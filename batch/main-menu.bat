@echo off

REM
REM  MS-DOS Batch Script Menu Boilerplate
REM  ====================================
REM
REM  A (not so) simple and (very) useful menu written entirely in MS-DOS batch script.
REM
REM  Tested in:
REM    - Microsoft Windows XP [versão 5.1.2600].
REM
REM  Author: Cris Stanza, 29-Fev-2014
REM

set COLOR_DEFAULT=02
set COLOR_ERROR=04

set SHOW_ERROR_1=0

:MAIN_MENU
cls
color %COLOR_DEFAULT%
echo.
echo  Main Menu
echo  =========
echo.

echo  What's your choice?
echo.
if [%SHOW_ERROR_1%] == [1] (
	color %COLOR_ERROR%
	echo  ERROR: Pick a valid one!
	echo.
	pause
	echo.
	set SHOW_ERROR_1=0
)
echo    1) Option One
echo    2) Option Two
echo    3) Option Three
echo    4) Option Four
echo    5) Option Five
echo.
echo  q) Quit
echo.
set /p OPTION= : 
color %COLOR_DEFAULT%

if [%OPTION%] == [1] goto MAIN_MENU_OPTION_1
if [%OPTION%] == [2] goto MAIN_MENU_OPTION_2
if [%OPTION%] == [3] goto MAIN_MENU_OPTION_3
if [%OPTION%] == [4] goto MAIN_MENU_OPTION_4
if [%OPTION%] == [5] goto MAIN_MENU_OPTION_5
if [%OPTION%] == [q] goto MAIN_MENU_OPTION_Q
if [%OPTION%] == [Q] goto MAIN_MENU_OPTION_Q
set SHOW_ERROR_1=1
goto MAIN_MENU

:MAIN_FUNCION
echo.
echo  Your choice was: %PARAM_1%
echo  Return point is %MAIN_RETURN%
echo.
pause
goto %MAIN_RETURN%

:MAIN_MENU_OPTION_1
echo.
set PARAM_1=%OPTION%
set MAIN_RETURN=MAIN_MENU_OPTION_1_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_1_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_2
echo.
set PARAM_1=%OPTION%
set MAIN_RETURN=MAIN_MENU_OPTION_2_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_2_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_3
echo.
set PARAM_1=%OPTION%
set MAIN_RETURN=MAIN_MENU_OPTION_3_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_3_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_4
echo.
set PARAM_1=%OPTION%
set MAIN_RETURN=MAIN_MENU_OPTION_4_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_4_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_5
echo.
set PARAM_1=%OPTION%
set MAIN_RETURN=MAIN_MENU_OPTION_5_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_5_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_Q
echo.
echo  You have chosen to quit.
goto END

:END
echo.
echo  End of the script.
echo.
pause
echo.
