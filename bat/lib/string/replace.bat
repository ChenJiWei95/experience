::Date   18/6/2
::Author 威
::Desc   本批处理功能：
::			从后往前匹配子串
::Param	 	lastIndexStr	主要字符串
::Param	 	compareStr		比较的串
::Param	 	compareStr		比较的串
::return	temp.data 		找不到值为-1，反之则1
@echo off
setlocal ENABLEDELAYEDEXPANSION
set replace_Str=%1
set replace_OldStr=%2
set replace_NewStr=%3

::初始化replace_OldStr的下标
call %string_path%indexOf.bat %replace_Str% %replace_OldStr%
set /p replace_Index=<%data_path%temp.data
::echo replace_Index：%replace_Index%
::如果等于-1则直接退出
if %replace_Index% EQU -1 goto end

::初始化replace_Str的长度
call %string_path%length.bat %replace_Str%
set /p replace_StrLen=<%data_path%temp.data
::echo %replace_StrLen%

::初始化replace_OldStr的长度
call %string_path%length.bat %replace_OldStr%
set /p replace_OldStrLen=<%data_path%temp.data
::echo replace_OldStrLen:%replace_OldStrLen%

::初始化前、后
call %string_path%substring.bat %replace_Str% 0 %replace_Index%
set /p replace_StrFont=<%data_path%temp.data

::初始化后半部分允许的下标
set /a replace_StrLast_Index=%replace_Index%+%replace_OldStrLen%
if %replace_StrLast_Index% NEQ %replace_StrLen% (
	call %string_path%substring.bat %replace_Str% %replace_StrLast_Index% %replace_StrLen%
	set /p replace_StrLast=<%data_path%temp.data
) 
set	replace_Str=%replace_StrFont%%replace_NewStr%%replace_StrLast%
goto end
: end
echo %replace_Str%>%data_path%temp.data