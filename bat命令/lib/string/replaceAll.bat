::Date   18/6/2
::Author 威
::Desc   本批处理功能：
::			从后往前匹配子串
::Param	 	replaceAll_Str			主要字符串
::Param	 	replaceAll_OldStr		比较的串
::Param	 	replaceAll_NewStr		比较的串
::return	temp.data 				找不到值为-1，反之则1
@echo off
set replaceAll_Str=%1
set replaceAll_OldStr=%2
set replaceAll_NewStr=%3
set replace_Index=0

goto doReplace
: doReplace
call %string_path%replace.bat %replaceAll_Str% %replaceAll_OldStr% %replaceAll_NewStr%
set /p replaceAll_Str=<%data_path%temp.data


::初始化replace_OldStr的下标
call %string_path%indexOf.bat %replaceAll_Str% %replaceAll_OldStr% %replace_Index%
set /p replace_Index=<%data_path%temp.data 

::echo replace_Index：%replace_Index%
::如果等于-1则直接退出
if %replace_Index% EQU -1 goto end
goto doReplace
goto end
: end
echo %replaceAll_Str%>%data_path%\temp.data
