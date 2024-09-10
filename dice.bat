@echo off
setlocal enabledelayedexpansion

:: path 4 files
set "dirPath=files"

:menu
cls
echo 1. Roll the dice
echo 2. Exit
set /p choice=Choose an option (1 or 2): 
if "%choice%"=="1" goto roll_dice
if "%choice%"=="2" exit
goto menu

:roll_dice
cls
echo Rolling the dice...
set /a "roll=%random% %% 6 + 1"
for /L %%i in (1,1,3) do (
    set /a "randomFace=!random! %% 6 + 1"
    cls
    type "!dirPath!\!randomFace!.txt"
    timeout /t 1 >nul
)
:: result
cls
type "!dirPath!\%roll%.txt"
echo.
echo You rolled a %roll%!
echo.
pause
goto menu
