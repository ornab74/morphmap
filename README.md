# Worldshard Chess

Worldshard Chess is an AI-directed chess saga in which every legal move generates the next scene of a changing world. A local chess engine remains the source of truth while OpenAI models plan the experience, render each board, and independently audit what was rendered.

The playable board stays strict and click-safe. The world around it is allowed to fracture, brighten, decay, or become mythic as the game moves from opening to endgame.

## What It Does

- Runs legal chess locally, including checks, castling, en passant, promotion, undo, FEN, and PGN.
- Builds a phase-aware scene brief for every position and move.
- Generates a new PNG game screen through the OpenAI Images API.
- Uses an independent vision pass to locate the board, click zones, text, and visible pieces.
- Compares observed pieces with the local engine before allowing interaction.
- Marks inaccurate or low-confidence frames as read-only instead of trusting them.
- Preserves generated scenes in a navigable Chronicle.
- Exports individual frame metadata or the complete Chronicle as JSON.
- Optionally lets GPT play Black.
- Encrypts saved API settings locally with AES-256-GCM.

## How It Works

```text
Local chess position
        |
        v
Scene Director -> image generation -> PNG validation
                                      |
                                      v
Engine truth <- independent vision audit
        |
        +-> accepted: live, clickable scene
        +-> rejected: review-only scene
```

Vision is intentionally not given the engine's expected position. It reports only the pieces visible in the generated image, and the application calculates position fidelity locally. The default `0.98` threshold rejects even one missing opening piece.

## Prompt System

Prompt system `2.0-world-bible` separates stable identity from per-frame novelty:

- **World Bible** defines the permanent palette, materials, lighting, piece family, interface language, motifs, phase arc, continuity laws, and forbidden drift.
- **Scene Brief** gives each position one narrative function, one deterministic variation lens, and a phase-sensitive novelty budget.
- **Scar Ledger** derives persistent visual consequences from captures, castling, and promotion in the local move history.
- **Continuity Memory** carries forward the prior relevant scene summary while explicitly replacing its old chess position.
- **Canonical Truth** supplies one authoritative square-to-piece map, a FEN checksum, exact piece count, status copy, and recent move copy.
- **Independent Audit** checks visible pieces, board geometry, World Bible consistency, and render failures without seeing canonical chess truth.

Each frame stores the prompt-system version, complete image prompt, prompt SHA-256 fingerprint, variation key, scene brief, audit result, and World Bible. Repeated renders of the same position receive controlled variation without permission to redesign the core world.

The GPT rival also receives a planner-created persona. Its move prompt ranks legality and practical chess strength above narrative expression, using persona only to break ties between comparable moves.

## Requirements

- Python 3.10 or newer
- Tkinter with PNG support
- An OpenAI API key
- Access to compatible text/vision and image-generation models

Tkinter is part of standard Python installers on Windows and macOS. Some Linux distributions package it separately, for example:

```bash
sudo apt install python3-tk
```

## Installation

Create and activate a virtual environment:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

On Windows PowerShell, activate the environment with:

```powershell
.venv\Scripts\Activate.ps1
```

## API Key

The simplest option is an environment variable:

```bash
export OPENAI_API_KEY="your-key-here"
python main.py
```

On Windows PowerShell:

```powershell
$env:OPENAI_API_KEY="your-key-here"
python main.py
```

Alternatively, launch the application, open **Settings**, enter the key, and choose **Save encrypted**. The key is encrypted with a passphrase and must be loaded from Settings in future sessions.

## Running

```bash
python main.py
```

Recommended first session:

1. Open **Settings** and confirm model names available to your OpenAI account.
2. Select **Plan + Generate Opening Screen**.
3. Click a piece and then one of its highlighted legal destinations.
4. Use the Chronicle controls to revisit earlier scenes or return to the live position.
5. Regenerate any scene marked **QUALITY REVIEW / READ-ONLY**.

The default models are configured near `AppConfig` in `main.py` and can be changed at runtime in Settings.

## Quality Gate

A generated frame is playable only when both conditions pass:

- Board detection confidence is at least `0.65`.
- Observed position fidelity is at least `0.98`.

Vision retries can reduce audit noise, but they do not alter the generated image. If a piece is genuinely missing or incorrect, regenerate the frame. Thresholds and retry count are configurable in Settings.

The playable board is required to be top-down, axis-aligned, and free of perspective distortion because square hit-testing uses the detected rectangular board bounds.

## Controls

- **Plan + Generate Opening Screen** creates a new plan and first scene.
- **Regenerate Current Frame** renders the live engine position again.
- **GPT Move for Current Side** asks the configured model to choose from legal moves.
- **Undo Move** restores the engine and the newest matching Chronicle scene.
- **Earlier / Later / Live Position** navigates the Chronicle without changing chess state.
- **Export Frame Metadata JSON** exports the selected scene.
- **Export Chronicle Manifest** exports all scenes and the current game state.

Overlay controls expose the detected clickmap, text regions, legal targets, attack map, square labels, and click indicator.

## Local Files

By default, private application files are stored under:

```text
~/.worldshard_chess_secure/
```

Generated PNGs and their metadata are written to:

```text
~/.worldshard_chess_secure/outputs/
```

Encrypted settings are written to:

```text
~/.worldshard_chess_secure/settings.enc.json
```

Directories are created with user-only permissions where supported. Files are written atomically.

## Security Model

- API keys are never hardcoded or intentionally stored as plaintext.
- Saved settings use AES-256-GCM with a PBKDF2-HMAC-SHA256 derived key.
- Generated PNG structure, CRCs, dimensions, and size limits are checked before Tk loads an image.
- Model JSON is bounded, parsed as data, and sanitized before use.
- Generated code is never executed.
- There is no offline image or vision fallback that can silently bypass validation.

The application still sends prompts, chess positions, and generated images to the configured OpenAI APIs. API usage can incur text, vision, and image-generation charges.

## Troubleshooting

### `No module named tkinter`

Install your operating system's Tk package, such as `python3-tk` on Debian or Ubuntu.

### `No OpenAI client`

Set `OPENAI_API_KEY` or load an encrypted key through Settings.

### `Install cryptography first`

Activate the project environment and run:

```bash
python -m pip install -r requirements.txt
```

### Frame is read-only

Inspect the quality summary. Low board confidence means click geometry is uncertain; low position fidelity means the rendered pieces differ from the engine. Regenerate the scene rather than playing through a mismatched image.

### Image API did not return `b64_json`

Choose an image model that supports base64 PNG output and confirm that your account has access to it.

## Status

This is an experimental, API-only creative chess interface. The local engine and quality gate protect game state, but generative models can still produce rejected scenes, unreadable text, or inconsistent art direction. Image generation is the slowest and most expensive part of the loop.
