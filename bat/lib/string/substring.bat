::Date   10/9
::Author 陈
::Desc   本批处理功能：
::			从字符串中筛选第start到end的子串
::     		不能对有空格的行操作
::Param	 str	需要筛选的字符串
::Param	 start	筛选的起始位置
::Param	 end	筛选的结束位置
@echo off
setlocal ENABLEDELAYEDEXPANSION
::设置环境变量 在局部同步（个人理解）  获取量时!num!而不是%num%

::接收参数
set str=%1
set start=%2
set end=%3
::echo %str%

::异常判断
if %start% EQU -1 goto NegativeException
if %end% EQU -1 goto NegativeException
if %start% GEQ %end% goto AroundException
::当start大于end时，提示异常

set num=-1
:next

if "%str%"=="" goto endd
::如果str空 结束
if not "%str%"=="" (
	set /a num+=1 
	if !num!==%start% goto STq
	set "str=%str:~1%"
	if not !num!==%end% goto next
)
::以上每行的注解在下面
::自加
::循环到start可以前往截取字符
::每次循环str去掉首位
::未到start跳回继续循环

:STq
::此处开始截取字符
if not "%str%"=="" (
	set substring_Temp=%substring_Temp%%str:~0,1%
	set /a num+=1
	if !num! EQU %end% (
		goto last
	)
	set "str=%str:~1%"
	if not !num!==%end% goto STq
) else goto endd
::temp开始截取 以拼接的形式
::num依然在循环中自加
::当循环到end时结束截取
::依然是每次循环str去掉首位

:last
::echo 截取到的字符串%substring_Temp% & (echo %substring_Temp% > substring_Temp.txt)
::结果输出
echo !substring_Temp!>%data_path%temp.data
goto endd

::下标前后异常
:AroundException
::echo IndexOut下标异常 > substring_Temp.data & exit
echo IndexOut下标异常 start:%start% end:%end%
goto endd

::下标负数异常
:NegativeException
echo 下标负数异常
goto endd

:endd