@ECHO OFF

ECHO %~1

IF "%~1" == "" (
    ECHO Missing destination directory!
    EXIT /b 2
)

ECHO Deploying modpack to "%~1"; press CTRL+C to abort...
PAUSE

ROBOCOPY /Z /E /MIR config "%~1\config"
ECHO.

ROBOCOPY /Z /E /MIR mods "%~1\mods"
ECHO.

ROBOCOPY /Z /E /MIR scripts "%~1\scripts"
ECHO.

ECHO Removing client-only mods...
DEL "%~1\mods\journeymap*.jar"
ECHO.
