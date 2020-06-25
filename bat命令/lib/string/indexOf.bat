::Date   10/9
::Author 陈
::Desc   本批处理功能：
::			1、获取字符在字符串中的第一次出现位置
::		 	2、获取子串在字符串中的第一次出现位置
::			18/1/12 经过处理只需要输入字符串和子串
::Param	 	indexOf_Str		主要字符串
::Param	 	strChild		需要获取位置的子串
::param 	indexOf_Index	开始的位置
::return 	temp.data 		找不到值为-1，反之则子串位置

@echo off
setlocal ENABLEDELAYEDEXPANSION
::设置环境变量 在局部同步（个人理解）  获取量时!num!而不是%num%

set strChild=%2
set indexOf_Index=%3
if "%indexOf_Index%" EQU "" set indexOf_Index=0
::set length=%3
call %string_path%length.bat %strChild%
set /p length=<%data_path%temp.data
::echo %length%
set indexOf_Str=%1

::echo 字符串%indexOf_Str%
::echo 子串长度%length%
::echo 子串值%strChild%
::接收参数

::初始化indexOf_Str
for /l %%a in (1,1,%indexOf_Index%) do (
	set indexOf_Str=!indexOf_Str:~1!
)
::echo %indexOf_Str%

set str2=
set num=0

:next

if "%indexOf_Str%"=="" goto fail
::如果str空 结束
::echo 获取子串
goto getStrChild
:getOK
::getOK 子串拼接获取完毕进行比较
::echo 进行比对
if not "%indexOf_Str%"=="" (
	if "%str2%"=="%strChild%" (
		set /a num+=%indexOf_Index%
		goto last
	)
	::结束
	set "indexOf_Str=%indexOf_Str:~1%"
	set /a num+=1
	goto next
)else goto fail
::以上每行的注解在下面
::goto getStrChild 与 :getOK 是用于依次获取参加比较的子串
::"%str2%"=="%strChild%"   当获取的子串和参数子串相等时则结束
::后三行 分别是每次循环str去掉首位 自加 跳到next标签继续循环

:getStrChild 
::进行获取与参数子串比较的子串
set num1=0
set str2=
::echo 清空str2:%str2% 重新获取新的子串
set temp=%indexOf_Str%
::echo %temp%
:doNext
::doNext 继续循环获取长度为2的子串循环
if "%temp%"=="" goto fail
::fail 找到末尾依然找不着
::echo 拼接前str2:%str2%,temp:%temp%,length:%length%
set str2=%str2%%temp:~0,1%
::echo 拼接后%str2%
::在每次循环中拼接生成比较子串
set "temp=%temp:~1%"
::echo %temp%
::每次循环temp去掉首位
set /a num1+=1
::echo num1:%num1%,%length%
if %num1%==%length% (goto getOK) else goto doNext
::echo 继续循环doNext
::getOK 子串拼接完毕返回进行比较
::if not "%num1%"=="%length%" 
::doNext 继续循环获取长度为2的子串循环
:fail
::fail 找到末尾依然找不着
set num=-1

:last
::echo 位置%num% & (echo %num% > temp.txt)
echo %num% > %data_path%temp.data


