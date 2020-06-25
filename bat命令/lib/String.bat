@echo off
::语法
::[methodName] [string] 
::方法：
::length			
::indexOf		[searchStr] [startIndex]
::lastIndexOf	[searchStr] [startIndex]
::substring		[startIndex] [endIndex]
::replace		[oldStr] [newStr]
::replaceAll	[oldStr] [newStr]
::endsWith		[compStr] 
::设置string包的目录包
set string_path=%lib_path%string\
::设置data包的目录包
set data_path=%lib_path%data\
::设置sys包的目录包
set sys_path=%lib_path%sys\
set methodName=%1
set string=%2
if "%methodName%" EQU "length" call %string_path%length.bat %string%
if "%methodName%" EQU "indexOf" call %string_path%indexOf.bat %string% %3 %4 
if "%methodName%" EQU "lastIndexOf" call %string_path%lastIndexOf.bat %string% %3 %4
if "%methodName%" EQU "substring" call %string_path%substring.bat %string% %3 %4
if "%methodName%" EQU "replace" call %string_path%replace.bat %string% %3 %4
if "%methodName%" EQU "replaceAll" call %string_path%replaceAll.bat %string% %3 %4
if "%methodName%" EQU "endsWith" call %string_path%endsWith.bat %string% %3




