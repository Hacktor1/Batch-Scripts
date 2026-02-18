@echo off
setlocal enabledelayedexpansion

set "basePath=C:\Users\%USERNAME%\AppData\Roaming\.minecraft\versions"

for /d %%F in ("%basePath%\*BETTER FANTASY*") do (
    set "targetFolder=%%F"
    
    if exist "%%F\mods\DiscCord-1.20.1-1.3.0.jar" (
        echo Deleting file: %%F\mods\DiscCord-1.20.1-1.3.0.jar
        del /f "%%F\mods\DiscCord-1.20.1-1.3.0.jar"
    ) else (
        echo File not found v: %%F\mods
    )
)

pause