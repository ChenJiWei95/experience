::Date   18/6/2
::Author ��
::Desc   ���������ܣ�
::			�Ӻ���ǰƥ���Ӵ�
::Param	 	lastIndexStr	��Ҫ�ַ���
::Param	 	compareStr		�ȽϵĴ�
::Param	 	compareStr		�ȽϵĴ�
::return	temp.data 		�Ҳ���ֵΪ-1����֮��f�����ҵ���λ��

@echo off
setlocal ENABLEDELAYEDEXPANSION
set lastIndexStr=%1

set compareStr=%2
set lastIndex_Index=%3
if "%lastIndex_Index%" EQU "" set lastIndex_Index=0

::��ʼ��compareStr����
call %string_path%length.bat %compareStr%
set /p len=<%cd%\data\temp.data

::��ʼ��lastIndexStrĩβ�±꣬����Ӻ���ǰ 
call %string_path%length.bat %lastIndexStr%
set /p lastIndex_Num=<%cd%\data\temp.data
set num_=%lastIndex_Num%

::��ʼ�ַ���
for /l %%a in (1,1,%lastIndex_Index%) do (
	set "lastIndexStr=!lastIndexStr:~0,-1!"
)
::echo ��ʼ�ַ���Ϊ��%lastIndexStr%

goto getCompareStr

::�Ӻ���ǰ��ȡҪ�Ƚϵ��Ӵ�
: getCompareStr
set num_=%lastIndex_Num%
set lastIndexStr_=%lastIndexStr%
call %string_path%length.bat %lastIndexStr_%
set /p len_=<%cd%\data\temp.data
set temp=
for /l %%a in (1,1,%len%) do (
	::�����ʣ�ַ������ڱȽϴ��������������
	if %len_% LSS %len% goto fail
	set num_=!num_!-1
	set temp=!lastIndexStr_:~-1!!temp!
	set "lastIndexStr_=!lastIndexStr_:~0,-1!"
)
goto doCompare

::��ȡ�ıȽϴ��Ͳ����Ƚϴ����бȽ�
: doCompare
if "%temp%" EQU "%compareStr%" (
	set lastIndex_Num=%num_%
	goto success
)
set lastIndex_Num=%lastIndex_Num%-1
set "lastIndexStr=%lastIndexStr:~0,-1%"
goto getCompareStr

::�ɹ��ҵ�
: success
set /a lastIndex_Num=%lastIndex_Num%-%lastIndex_Index%
::set lastIndex_Num=1
goto end

::�Ҳ���
: fail
set lastIndex_Num=-1
goto end

: end
echo %lastIndex_Num% > %data_path%temp.data



