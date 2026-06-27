import sqlite3
import tempfile
import unittest
from pathlib import Path

import main


DEPENDENCIES_AVAILABLE = main.aiosqlite is not None and main.AESGCM is not None


@unittest.skipUnless(DEPENDENCIES_AVAILABLE, "aiosqlite and cryptography are required")
class SecureDatabaseTests(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self) -> None:
        self.temp_dir = tempfile.TemporaryDirectory()
        self.path = Path(self.temp_dir.name) / "vault.sqlite3"
        self.database = main.SecureDatabase(str(self.path))

    async def asyncTearDown(self) -> None:
        self.database.lock()
        self.temp_dir.cleanup()

    async def test_encrypted_round_trip_and_wrong_passphrase(self) -> None:
        result = await self.database.unlock("correct horse battery staple", create=True)
        self.assertTrue(result["created"])
        await self.database.save_settings({"api_key": "sk-secret-value", "vision_model": "gpt-test"})
        await self.database.checkpoint()

        self.assertNotIn(b"sk-secret-value", self.path.read_bytes())
        self.assertEqual((await self.database.load_settings())["api_key"], "sk-secret-value")

        self.database.lock()
        with self.assertRaises(PermissionError):
            await self.database.load_settings()
        with self.assertRaises(ValueError):
            await self.database.unlock("incorrect passphrase", create=False)

        await self.database.unlock("correct horse battery staple", create=False)
        self.assertEqual((await self.database.load_settings())["vision_model"], "gpt-test")

    async def test_passphrase_rotation_reencrypts_all_records(self) -> None:
        await self.database.unlock("initial passphrase", create=True)
        await self.database.put_record("frame", "session-1:0001", {"fen": "secret-fen", "prompt": "secret-prompt"})
        count = await self.database.rotate_passphrase("replacement passphrase")
        self.assertEqual(count, 1)
        self.database.lock()

        with self.assertRaises(ValueError):
            await self.database.unlock("initial passphrase", create=False)
        await self.database.unlock("replacement passphrase", create=False)
        record = await self.database.get_record("frame", "session-1:0001")
        self.assertEqual(record["fen"], "secret-fen")
        self.assertNotIn(b"secret-prompt", self.path.read_bytes())

    async def test_ciphertext_tampering_is_detected(self) -> None:
        await self.database.unlock("tamper test passphrase", create=True)
        await self.database.put_record("settings", "primary", {"api_key": "sk-tamper"})
        await self.database.checkpoint()

        connection = sqlite3.connect(self.path)
        try:
            ciphertext = connection.execute(
                "SELECT ciphertext FROM secure_records WHERE record_type = 'settings' AND record_key = 'primary'"
            ).fetchone()[0]
            damaged = bytes([ciphertext[0] ^ 1]) + ciphertext[1:]
            connection.execute(
                "UPDATE secure_records SET ciphertext = ? WHERE record_type = 'settings' AND record_key = 'primary'",
                (damaged,),
            )
            connection.commit()
        finally:
            connection.close()

        with self.assertRaises(ValueError):
            await self.database.get_record("settings", "primary")


if __name__ == "__main__":
    unittest.main()
