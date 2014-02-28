@echo off

REM
REM  Java Runner
REM  ===========
REM
REM  Utility to launch Java applications.
REM
REM  Tested in:
REM    - Microsoft Windows XP [versão 5.1.2600].
REM
REM  Author: Cris Stanza, 29-Fev-2014
REM

REM  Clear screen on menu refresh.
REM  Valid values: 0|1
set CLEAR_SCREEN=1

REM  Don't ask to press any key on quiting.
REM  Valid values: 0|1
set QUICK_QUIT=1

set COLOR_DEFAULT=02
set COLOR_ERROR=04

set SHOW_ERROR_1=0
set SHOW_ERROR_2=0

:MAIN_MENU
if [%CLEAR_SCREEN%] == [1] cls
color %COLOR_DEFAULT%
echo.
echo  Installer Runner
echo  ================
echo.

echo  What's your choice?
echo.
REM validation messages
if [%SHOW_ERROR_1%] == [1] (
	color %COLOR_ERROR%
	echo  ERROR: Pick a valid one!
	echo.
	pause
	echo.
	set SHOW_ERROR_1=0
)
if [%SHOW_ERROR_2%] == [1] (
	color %COLOR_ERROR%
	echo  ERROR: File not found: %MAIN_FUNCION_PARAM_1%
	echo.
	pause
	echo.
	set SHOW_ERROR_2=0
	set MAIN_FUNCION_PARAM_1=
)
REM /validation messages
color %COLOR_DEFAULT%
echo    1) Application I
echo    2) Application II
echo    3) Application III
echo    4) Application IV
echo    5) Application V
echo.
echo    a) All
echo.
echo  q) Quit
echo.
set /p OPTION= : 

if [%OPTION%] == [1] goto MAIN_MENU_OPTION_1
if [%OPTION%] == [2] goto MAIN_MENU_OPTION_2
if [%OPTION%] == [3] goto MAIN_MENU_OPTION_3
if [%OPTION%] == [4] goto MAIN_MENU_OPTION_4
if [%OPTION%] == [5] goto MAIN_MENU_OPTION_5

if [%OPTION%] == [a] goto MAIN_MENU_OPTION_A
if [%OPTION%] == [A] goto MAIN_MENU_OPTION_A

if [%OPTION%] == [q] goto MAIN_MENU_OPTION_Q
if [%OPTION%] == [Q] goto MAIN_MENU_OPTION_Q

set SHOW_ERROR_1=1
goto MAIN_MENU

:MAIN_FUNCION
echo.
REM generate file name
SET NOW=%date%
SET BUILD_DATE=%NOW:~10,4%%NOW:~7,2%%NOW:~4,2%
SET BUILD_VERSION=1.0.0
set FILE_PATH=.\
set FILE_NAME=%PARAM_1%-%BUILD_VERSION%-%BUILD_DATE%.jar
set FILE_PATH_NAME=%FILE_PATH%%FILE_NAME%
REM /generate file name
if not exist %FILE_PATH_NAME% (
	set SHOW_ERROR_2=1
	set MAIN_FUNCION_PARAM_1=%FILE_PATH_NAME%
	goto MAIN_MENU
) else (
	start java -jar %FILE_NAME%
	echo.
	goto %MAIN_RETURN%
)

:MAIN_MENU_OPTION_1
echo.
set PARAM_1=app-one
set MAIN_RETURN=MAIN_MENU_OPTION_1_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_1_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_2
echo.
set PARAM_1=app-two
set MAIN_RETURN=MAIN_MENU_OPTION_2_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_2_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_3
echo.
set PARAM_1=app-three
set MAIN_RETURN=MAIN_MENU_OPTION_3_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_3_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_4
echo.
set PARAM_1=app-four
set MAIN_RETURN=MAIN_MENU_OPTION_4_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_4_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_5
echo.
set PARAM_1=app-five
set MAIN_RETURN=MAIN_MENU_OPTION_5_LABEL_1
goto MAIN_FUNCION
:MAIN_MENU_OPTION_5_LABEL_1
goto MAIN_MENU

:MAIN_MENU_OPTION_A
echo.
color %COLOR_ERROR%
echo Not implemented!
echo.
pause
goto MAIN_MENU

:MAIN_MENU_OPTION_Q
echo.
goto END

:END
echo.
echo  End of the script.
echo.
if not [%QUICK_QUIT%] == [1] pause
echo.
