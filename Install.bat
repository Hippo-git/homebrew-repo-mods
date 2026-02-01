@echo off
SETLOCAL EnableExtensions
set "ROOT_DIR=C:\Users\%USERNAME%\AppData\Roaming\Thunderstore Mod Manager\DataFolder\REPO\profiles\Default\BepInEx\plugins"
set "HB_DIR=%ROOT_DIR%\homebrew"

:MENU
cls
echo =========================================================
echo       REPO HOMEBREW MOD MANAGER - v1.0.2
echo =========================================================
echo  1. Install/Update ALL Mods
echo  2. Uninstall ALL Homebrew Mods
echo  3. Exit
echo =========================================================
set /p choice="Select an option (1-3): "

if "%choice%"=="1" goto INSTALL
if "%choice%"=="2" goto UNINSTALL
if "%choice%"=="3" exit
goto MENU

:INSTALL
echo.
echo [1/3] Cleaning old standalone files...
:: This prevents double-stacking by deleting files in the main plugins folder
if exist "%ROOT_DIR%\BoomboxSpawnerMod.dll" del /f "%ROOT_DIR%\BoomboxSpawnerMod.dll"
if exist "%ROOT_DIR%\TeammateMapIcons.dll" del /f "%ROOT_DIR%\TeammateMapIcons.dll"

echo [2/3] Preparing Homebrew folder...
if not exist "%HB_DIR%" mkdir "%HB_DIR%"

echo [3/3] Installing latest versions...
:: Points to the folders you just created in GitHub
xcopy /Y /S "%~dp0Boombox-Smuggler\*.dll" "%HB_DIR%\"
xcopy /Y /S "%~dp0Teammate_Map_Icons\*.dll" "%HB_DIR%\"

echo.
echo SUCCESS: All mods installed to BepInEx\plugins\homebrew
pause
goto MENU

:UNINSTALL
echo.
echo Are you sure you want to remove all Homebrew mods?
set /p confirm="Type Y to confirm: "
if /I "%confirm%"=="Y" (
    rd /s /q "%HB_DIR%"
    echo Homebrew folder removed.
)
pause
goto MENU
