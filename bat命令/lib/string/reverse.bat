::Date   18/6/2
::Author ��
::Desc   ���������ܣ�
::			һ���ַ���ȡ��
::Param	 	str			��Ҫ�ַ���
@echo off
setlocal ENABLEDELAYEDEXPANSION
set reverseStr=%1
call %string_path%length.bat %reverseStr%
set /p len=<%data_path%temp.data
set temp=
for /l %%a in (2,1,%len%) do (
	set temp=!temp!!reverseStr:~-1!
	set "reverseStr=!reverseStr:~0,-1!"
)
set temp=%temp%%reverseStr%
echo %temp% > %data_path%temp.data
pause

