@echo off
setlocal enabledelayedexpansion

set "SOURCE1=mimimod-1.20.1-4.3.1.BETA.2-forge.*"
set "SOURCE2=DiscCord-1.20.1-1.3.0.*"

set "VERSIONS=%APPDATA%\.minecraft\versions"

for /d %%D in ("%VERSIONS%\*BETTER FANTASY*") do (
    set "TARGET=%%D\mods"
    
    if not exist "!TARGET!" (
        mkdir "!TARGET!"
    )

    echo Copying to: !TARGET!
    copy "%CD%\%SOURCE1%" "!TARGET!" /Y
    copy "%CD%\%SOURCE2%" "!TARGET!" /Y
)

echo Done.
pause
