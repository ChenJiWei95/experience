::Date   18/6/2
::Author 威
::Desc   本批处理功能：
::			从后往前匹配子串
::Param	 	lastIndexStr	主要字符串
::Param	 	compareStr		比较的串
::Param	 	compareStr		比较的串
::return	temp.data 		找不到值为-1，反之则f返回找到的位置

@echo off
setlocal ENABLEDELAYEDEXPANSION
set lastIndexStr=%1

set compareStr=%2
set lastIndex_Index=%3
if "%lastIndex_Index%" EQU "" set lastIndex_Index=0

::初始化compareStr长度
call %string_path%length.bat %compareStr%
set /p len=<%cd%\data\temp.data

::初始化lastIndexStr末尾下标，将会从后往前 
call %string_path%length.bat %lastIndexStr%
set /p lastIndex_Num=<%cd%\data\temp.data
set num_=%lastIndex_Num%

::初始字符串
for /l %%a in (1,1,%lastIndex_Index%) do (
	set "lastIndexStr=!lastIndexStr:~0,-1!"
)
::echo 初始字符串为：%lastIndexStr%

goto getCompareStr

::从后往前获取要比较的子串
: getCompareStr
set num_=%lastIndex_Num%
set lastIndexStr_=%lastIndexStr%
call %string_path%length.bat %lastIndexStr_%
set /p len_=<%cd%\data\temp.data
set temp=
for /l %%a in (1,1,%len%) do (
	::如果所剩字符数少于比较串长度则结束查找
	if %len_% LSS %len% goto fail
	set num_=!num_!-1
	set temp=!lastIndexStr_:~-1!!temp!
	set "lastIndexStr_=!lastIndexStr_:~0,-1!"
)
goto doCompare

::获取的比较串和参数比较串进行比较
: doCompare
if "%temp%" EQU "%compareStr%" (
	set lastIndex_Num=%num_%
	goto success
)
set lastIndex_Num=%lastIndex_Num%-1
set "lastIndexStr=%lastIndexStr:~0,-1%"
goto getCompareStr

::成功找到
: success
set /a lastIndex_Num=%lastIndex_Num%-%lastIndex_Index%
::set lastIndex_Num=1
goto end

::找不到
: fail
set lastIndex_Num=-1
goto end

: end
echo %lastIndex_Num% > %data_path%temp.data



