::Date   10/9
::Author 陈
::Desc   本批处理功能：
::			比较是否以compStr结尾
::Param	 str		字符串
::Param	 compStr	结尾子串
@echo off
set endsWithStr=%1
set compStr=%2
call %string_path%length.bat %compStr%
set /p len=<%data_path%temp.data
::set len=5
if %len% EQU 1 set preStr=%endsWithStr:~-1%
if %len% EQU 2 set preStr=%endsWithStr:~-2%
if %len% EQU 3 set preStr=%endsWithStr:~-3%
if %len% EQU 4 set preStr=%endsWithStr:~-4%
if %len% EQU 5 set preStr=%endsWithStr:~-5%
if %len% EQU 6 set preStr=%endsWithStr:~-6%
if %len% EQU 7 set preStr=%endsWithStr:~-7%
if %len% EQU 8 set preStr=%endsWithStr:~-8%
if "%compStr%" EQU "%preStr%" ( 
	echo 1 > %data_path%temp.data
) else (
	echo -1 > %data_path%temp.data
)
