::Date   10/9
::Author 陈
::Desc   本批处理功能：
::			获取字符串的长度
::Param	 length_Str	主要字符串
@echo off
set tempStr=%1
set /a num=0

goto next
: next
if not "%tempStr%"=="" (
	set /a num+=1
	set "tempStr=%tempStr:~1%"
	goto next
) else goto end

: end 
::不断的循环直到为空 输出num
::echo "%v% size:%num%" & (echo %num% > temp.txt)
echo %num% > %data_path%temp.data
 


