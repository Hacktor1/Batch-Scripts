@echo off
setlocal enabledelayedexpansion

REM =========================
REM --- User-configurable paths ---
REM =========================
set "SOURCE1=%USERPROFILE%\Downloads\examplemod-1.0.0.jar"
set "VERSIONS=%APPDATA%\.minecraft\versions"
set "BAR_LENGTH=50"      REM Length of the progress bar
set "DOWNLOAD_DELAY=100" REM Delay in milliseconds per step (~5s total)

REM =========================
REM --- Check if mod exists ---
REM =========================
echo Checking mod file...
if exist "%SOURCE1%" (
    echo File found: %SOURCE1%
) else (
    echo File not found: %SOURCE1%
    pause
    exit /b
)

REM =========================
REM --- Fake download with progress bar ---
REM =========================
echo.
echo Downloading mod...
for /L %%P in (0,1,%BAR_LENGTH%) do (
    set "BAR="
    REM Build the '#' part
    for /L %%i in (1,1,%%P) do set "BAR=!BAR!#"
    REM Build the spaces
    set /A SPACES=%BAR_LENGTH%-%%P
    for /L %%i in (1,1,!SPACES!) do set "BAR=!BAR! "
    REM Calculate percent
    set /A PERCENT=%%P*100/%BAR_LENGTH%
    REM Display the progress bar
    <nul set /p= !BAR! !PERCENT!%%`r
    REM Delay using ping for ~short milliseconds
    ping -n 1 -w %DOWNLOAD_DELAY% 127.0.0.1 >nul
)
echo.

REM =========================
REM --- Copy mod to all BETTER FANTASY versions ---
REM =========================
for /d %%D in ("%VERSIONS%\*BETTER FANTASY*") do (
    set "TARGET=%%D\mods"

    REM Create mods folder if it doesn't exist
    if not exist "!TARGET!" (
        mkdir "!TARGET!"
    )

    echo Copying mod to: !TARGET! ...
    copy "%SOURCE1%" "!TARGET!" /Y >nul
    echo Done!
)

echo.
echo All mods have been installed successfully!
pause
