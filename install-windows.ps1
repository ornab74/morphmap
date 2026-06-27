[CmdletBinding()]
param(
    [string]$InstallDir = "",
    [string]$VenvName = ".venv",
    [switch]$ForceSourceRefresh,
    [switch]$RecreateVenv,
    [switch]$DesktopShortcut,
    [switch]$NoLaunch,
    [switch]$NoPythonInstall
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

$AppName = "Worldshard Chess"
$InstallerVersion = "1.0.0"
$RepoArchiveUrl = "https://github.com/ornab74/morphmap/archive/refs/heads/main.zip"
$MinimumPython = [version]"3.10.0"
$PreferredPythonWingetId = "Python.Python.3.12"
$ScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$TemporaryPaths = New-Object 'System.Collections.Generic.List[string]'

if ($PSVersionTable.PSVersion.Major -lt 5) {
    throw "PowerShell 5.1 or newer is required."
}
if ([string]::IsNullOrWhiteSpace($env:LOCALAPPDATA)) {
    throw "This installer supports Windows only."
}

function Write-Step {
    param([string]$Message)
    Write-Host ""
    Write-Host "==> $Message" -ForegroundColor Cyan
}

function Write-Note {
    param([string]$Message)
    Write-Host "    $Message" -ForegroundColor DarkGray
}

function Invoke-Native {
    param(
        [Parameter(Mandatory = $true)][string]$FilePath,
        [Parameter(Mandatory = $true)][string[]]$Arguments
    )
    & $FilePath @Arguments
    if ($LASTEXITCODE -ne 0) {
        throw "Command failed with exit code ${LASTEXITCODE}: $FilePath $($Arguments -join ' ')"
    }
}

function Invoke-Python {
    param(
        [Parameter(Mandatory = $true)][pscustomobject]$Python,
        [Parameter(Mandatory = $true)][string[]]$Arguments
    )
    $AllArguments = @($Python.Prefix) + $Arguments
    Invoke-Native -FilePath $Python.Executable -Arguments $AllArguments
}

function Test-PythonCandidate {
    param(
        [Parameter(Mandatory = $true)][string]$Executable,
        [string[]]$Prefix = @()
    )
    try {
        $Arguments = @($Prefix) + @("-c", "import struct, sys; print('.'.join(map(str, sys.version_info[:3])) + '|' + str(struct.calcsize('P') * 8))")
        $Output = & $Executable @Arguments 2>$null
        if ($LASTEXITCODE -ne 0 -or -not $Output) {
            return $null
        }
        $Probe = [string]($Output | Select-Object -Last 1)
        $Parts = $Probe.Trim().Split("|")
        if ($Parts.Count -ne 2 -or $Parts[1] -ne "64") {
            return $null
        }
        $Version = [version]$Parts[0]
        if ($Version -lt $MinimumPython) {
            return $null
        }
        return [pscustomobject]@{
            Executable = $Executable
            Prefix = @($Prefix)
            Version = $Version
        }
    }
    catch {
        return $null
    }
}

function Find-CompatiblePython {
    $Launcher = Get-Command "py.exe" -ErrorAction SilentlyContinue
    if ($Launcher) {
        foreach ($Selector in @("-3.14", "-3.13", "-3.12", "-3.11", "-3.10")) {
            $Candidate = Test-PythonCandidate -Executable $Launcher.Source -Prefix @($Selector)
            if ($Candidate) {
                return $Candidate
            }
        }
    }

    foreach ($CommandName in @("python.exe", "python3.exe")) {
        $Command = Get-Command $CommandName -ErrorAction SilentlyContinue
        if ($Command) {
            $Candidate = Test-PythonCandidate -Executable $Command.Source
            if ($Candidate) {
                return $Candidate
            }
        }
    }

    $KnownPythonPaths = @(
        (Join-Path $env:LOCALAPPDATA "Programs\Python\Python314\python.exe"),
        (Join-Path $env:LOCALAPPDATA "Programs\Python\Python313\python.exe"),
        (Join-Path $env:LOCALAPPDATA "Programs\Python\Python312\python.exe"),
        (Join-Path $env:LOCALAPPDATA "Programs\Python\Python311\python.exe"),
        (Join-Path $env:LOCALAPPDATA "Programs\Python\Python310\python.exe"),
        (Join-Path $env:ProgramFiles "Python314\python.exe"),
        (Join-Path $env:ProgramFiles "Python313\python.exe"),
        (Join-Path $env:ProgramFiles "Python312\python.exe"),
        (Join-Path $env:ProgramFiles "Python311\python.exe"),
        (Join-Path $env:ProgramFiles "Python310\python.exe")
    )
    foreach ($Path in $KnownPythonPaths) {
        if (Test-Path -LiteralPath $Path) {
            $Candidate = Test-PythonCandidate -Executable $Path
            if ($Candidate) {
                return $Candidate
            }
        }
    }
    return $null
}

function Install-PythonWithWinget {
    if ($NoPythonInstall) {
        throw "Python 3.10+ was not found. Install Python from https://www.python.org/downloads/windows/ and include Tcl/Tk and the py launcher."
    }
    $Winget = Get-Command "winget.exe" -ErrorAction SilentlyContinue
    if (-not $Winget) {
        throw "Python 3.10+ was not found and winget is unavailable. Install Python from https://www.python.org/downloads/windows/ and rerun this script."
    }

    Write-Step "Python 3.10+ not found; installing Python 3.12 for the current user"
    Invoke-Native -FilePath $Winget.Source -Arguments @(
        "install",
        "--id", $PreferredPythonWingetId,
        "--exact",
        "--scope", "user",
        "--accept-package-agreements",
        "--accept-source-agreements",
        "--silent"
    )

    $PythonDirectory = Join-Path $env:LOCALAPPDATA "Programs\Python\Python312"
    if (Test-Path -LiteralPath $PythonDirectory) {
        $env:Path = "$PythonDirectory;$PythonDirectory\Scripts;$env:Path"
    }
}

function Copy-ProjectSource {
    param(
        [Parameter(Mandatory = $true)][string]$Source,
        [Parameter(Mandatory = $true)][string]$Destination
    )
    $Excluded = @(".git", ".venv", "__pycache__", "outputs")
    New-Item -ItemType Directory -Path $Destination -Force | Out-Null
    foreach ($Item in Get-ChildItem -LiteralPath $Source -Force) {
        if ($Excluded -contains $Item.Name) {
            continue
        }
        Copy-Item -LiteralPath $Item.FullName -Destination $Destination -Recurse -Force
    }
}

function Download-ProjectSource {
    param([Parameter(Mandatory = $true)][string]$Destination)

    Write-Step "Downloading the current Worldshard Chess source"
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    $TempRoot = Join-Path ([IO.Path]::GetTempPath()) ("worldshard-" + [guid]::NewGuid().ToString("N"))
    $ArchivePath = Join-Path $TempRoot "worldshard.zip"
    $ExtractPath = Join-Path $TempRoot "source"
    New-Item -ItemType Directory -Path $TempRoot -Force | Out-Null
    $TemporaryPaths.Add($TempRoot)

    Invoke-WebRequest -Uri $RepoArchiveUrl -OutFile $ArchivePath -UseBasicParsing
    Expand-Archive -LiteralPath $ArchivePath -DestinationPath $ExtractPath -Force
    $ExtractedRoot = Get-ChildItem -LiteralPath $ExtractPath -Directory | Select-Object -First 1
    if (-not $ExtractedRoot -or -not (Test-Path -LiteralPath (Join-Path $ExtractedRoot.FullName "main.py"))) {
        throw "Downloaded archive did not contain the expected Worldshard Chess files."
    }
    Copy-ProjectSource -Source $ExtractedRoot.FullName -Destination $Destination
}

function Resolve-ProjectRoot {
    $LocalMain = Join-Path $ScriptRoot "main.py"
    $LocalRequirements = Join-Path $ScriptRoot "requirements.txt"
    $HasLocalSource = (Test-Path -LiteralPath $LocalMain) -and (Test-Path -LiteralPath $LocalRequirements)

    if ([string]::IsNullOrWhiteSpace($InstallDir)) {
        if ($HasLocalSource) {
            return [IO.Path]::GetFullPath($ScriptRoot)
        }
        $script:InstallDir = Join-Path $env:LOCALAPPDATA "WorldshardChess"
    }

    $Target = [IO.Path]::GetFullPath($InstallDir)
    $TargetMain = Join-Path $Target "main.py"
    $TargetRequirements = Join-Path $Target "requirements.txt"
    $TargetReady = (Test-Path -LiteralPath $TargetMain) -and (Test-Path -LiteralPath $TargetRequirements)

    if ($TargetReady -and -not $ForceSourceRefresh) {
        Write-Note "Using existing source at $Target"
        return $Target
    }

    if ((Test-Path -LiteralPath $Target) -and -not $TargetReady -and -not $ForceSourceRefresh) {
        $Existing = Get-ChildItem -LiteralPath $Target -Force -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($Existing) {
            throw "Install directory is not empty and is not a Worldshard Chess installation: $Target. Choose another -InstallDir or pass -ForceSourceRefresh."
        }
    }

    if ($HasLocalSource -and -not $ForceSourceRefresh) {
        Write-Step "Copying local project source to $Target"
        Copy-ProjectSource -Source $ScriptRoot -Destination $Target
    }
    else {
        Download-ProjectSource -Destination $Target
    }
    return $Target
}

function Write-Launchers {
    param(
        [Parameter(Mandatory = $true)][string]$ProjectRoot,
        [Parameter(Mandatory = $true)][string]$VenvDirectory
    )
    Write-Step "Creating launchers"
    $RelativeVenv = $VenvName.Replace("/", "\")
    $CmdPath = Join-Path $ProjectRoot "run-worldshard.cmd"
    $CmdContent = @"
@echo off
setlocal
cd /d "%~dp0"
if not exist "$RelativeVenv\Scripts\python.exe" (
  echo Virtual environment missing. Run install-windows.ps1 again.
  pause
  exit /b 1
)
"$RelativeVenv\Scripts\python.exe" "main.py"
if errorlevel 1 (
  echo.
  echo Worldshard Chess exited with an error.
  pause
)
"@
    Set-Content -LiteralPath $CmdPath -Value $CmdContent -Encoding ASCII

    if ($DesktopShortcut) {
        $Desktop = [Environment]::GetFolderPath("Desktop")
        $ShortcutPath = Join-Path $Desktop "$AppName.lnk"
        $PythonWindowed = Join-Path $VenvDirectory "Scripts\pythonw.exe"
        $MainPath = Join-Path $ProjectRoot "main.py"
        $Shell = New-Object -ComObject WScript.Shell
        $Shortcut = $Shell.CreateShortcut($ShortcutPath)
        $Shortcut.TargetPath = $PythonWindowed
        $Shortcut.Arguments = "`"$MainPath`""
        $Shortcut.WorkingDirectory = $ProjectRoot
        $Shortcut.Description = "Launch $AppName"
        $Shortcut.IconLocation = "$PythonWindowed,0"
        $Shortcut.Save()
        Write-Note "Desktop shortcut: $ShortcutPath"
    }
}

try {
    Write-Host "$AppName Windows Installer" -ForegroundColor White
    Write-Host "No administrator privileges are required." -ForegroundColor DarkGray

    $ProjectRoot = Resolve-ProjectRoot
    Set-Location -LiteralPath $ProjectRoot
    Write-Note "Project root: $ProjectRoot"

    if (
        [string]::IsNullOrWhiteSpace($VenvName) -or
        [IO.Path]::IsPathRooted($VenvName) -or
        $VenvName -match '(^|[\\/])\.\.([\\/]|$)'
    ) {
        throw "VenvName must be a relative directory inside the project and cannot contain '..'."
    }

    Write-Step "Finding a compatible 64-bit Python"
    $Python = Find-CompatiblePython
    if (-not $Python) {
        Install-PythonWithWinget
        $Python = Find-CompatiblePython
    }
    if (-not $Python) {
        throw "Python installation completed but the interpreter was not found. Open a new PowerShell window and rerun this installer."
    }
    Write-Note "Python $($Python.Version): $($Python.Executable) $($Python.Prefix -join ' ')"
    Invoke-Python -Python $Python -Arguments @(
        "-c",
        "import platform, sys; assert sys.maxsize > 2**32, '64-bit Python is required'; print('Architecture:', platform.architecture()[0])"
    )

    Write-Step "Checking Tkinter and PNG-capable Tk"
    try {
        Invoke-Python -Python $Python -Arguments @(
            "-c",
            "import tkinter as tk; t=tk.Tcl(); assert float(t.call('info','patchlevel').rsplit('.',1)[0]) >= 8.6; print('Tk:', t.call('info','patchlevel'))"
        )
    }
    catch {
        throw "Tkinter/Tk 8.6+ is unavailable. Reinstall Python from python.org with the Tcl/Tk and IDLE feature enabled."
    }

    $VenvDirectory = Join-Path $ProjectRoot $VenvName
    $VenvPython = Join-Path $VenvDirectory "Scripts\python.exe"
    if ($RecreateVenv -and (Test-Path -LiteralPath $VenvDirectory)) {
        Write-Step "Recreating virtual environment"
        Remove-Item -LiteralPath $VenvDirectory -Recurse -Force
    }
    if (-not (Test-Path -LiteralPath $VenvPython)) {
        Write-Step "Creating isolated virtual environment at $VenvDirectory"
        Invoke-Python -Python $Python -Arguments @("-m", "venv", $VenvDirectory)
    }
    if (-not (Test-Path -LiteralPath $VenvPython)) {
        throw "Virtual environment creation did not produce $VenvPython"
    }
    $Venv = [pscustomobject]@{
        Executable = $VenvPython
        Prefix = @()
        Version = $Python.Version
    }

    Write-Step "Upgrading packaging tools"
    Invoke-Python -Python $Venv -Arguments @("-m", "pip", "install", "--upgrade", "pip", "setuptools", "wheel")

    Write-Step "Installing locked-compatible project dependencies"
    Invoke-Python -Python $Venv -Arguments @("-m", "pip", "install", "--requirement", (Join-Path $ProjectRoot "requirements.txt"))

    Write-Step "Running dependency and application smoke tests"
    Invoke-Python -Python $Venv -Arguments @("-m", "pip", "check")
    Invoke-Python -Python $Venv -Arguments @(
        "-c",
        "import tkinter as tk; from openai import OpenAI; from cryptography.hazmat.primitives.ciphers.aead import AESGCM; t=tk.Tcl(); print('Imports OK; Tk', t.call('info','patchlevel'))"
    )
    Invoke-Python -Python $Venv -Arguments @("-m", "py_compile", (Join-Path $ProjectRoot "main.py"))
    Invoke-Python -Python $Venv -Arguments @("-c", "import main; assert len(main.ChessGame().all_legal_moves('w')) == 20; print('Worldshard engine smoke test OK')")
    Invoke-Python -Python $Venv -Arguments @("-m", "unittest", "discover", "-s", (Join-Path $ProjectRoot "tests"), "-v")

    Write-Launchers -ProjectRoot $ProjectRoot -VenvDirectory $VenvDirectory

    $InstallState = [ordered]@{
        app = $AppName
        installer_version = $InstallerVersion
        installed_utc = [DateTime]::UtcNow.ToString("o")
        repository = "https://github.com/ornab74/morphmap"
        project_root = $ProjectRoot
        python_version = $Python.Version.ToString()
        python_executable = $Python.Executable
        virtual_environment = $VenvDirectory
        requirements_sha256 = (Get-FileHash -LiteralPath (Join-Path $ProjectRoot "requirements.txt") -Algorithm SHA256).Hash.ToLowerInvariant()
    }
    $InstallState | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $ProjectRoot "install-state.json") -Encoding UTF8

    Write-Host ""
    Write-Host "Installation complete." -ForegroundColor Green
    Write-Host "Project:  $ProjectRoot"
    Write-Host "Launcher: $(Join-Path $ProjectRoot 'run-worldshard.cmd')"
    Write-Host "Receipt:  $(Join-Path $ProjectRoot 'install-state.json')"
    if ($env:OPENAI_API_KEY) {
        Write-Host "API key:  OPENAI_API_KEY is set for this shell." -ForegroundColor Green
    }
    else {
        Write-Host "API key:  not set. Add it in Settings and save it encrypted, or set OPENAI_API_KEY." -ForegroundColor Yellow
    }

    if (-not $NoLaunch) {
        Write-Step "Launching $AppName"
        $PythonWindowed = Join-Path $VenvDirectory "Scripts\pythonw.exe"
        Start-Process -FilePath $PythonWindowed -ArgumentList "`"$(Join-Path $ProjectRoot 'main.py')`"" -WorkingDirectory $ProjectRoot
    }
}
catch {
    Write-Host ""
    Write-Host "Installation failed: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Rerun with: powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\install-windows.ps1" -ForegroundColor Yellow
    exit 1
}
finally {
    foreach ($Path in $TemporaryPaths) {
        if (Test-Path -LiteralPath $Path) {
            Remove-Item -LiteralPath $Path -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}
