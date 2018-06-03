@echo off
::设置data包的目录包
set data_path=%lib_path%data\
::设置sys包的目录包
set sys_path=%lib_path%sys\
set methodName=%1
if "%methodName%" EQU "print" call %sys_path%showResult.bat
if "%methodName%" EQU "clear" call %sys_path%clear.bat




