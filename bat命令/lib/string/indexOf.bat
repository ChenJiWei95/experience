::Date   10/9
::Author ��
::Desc   ���������ܣ�
::			1����ȡ�ַ����ַ����еĵ�һ�γ���λ��
::		 	2����ȡ�Ӵ����ַ����еĵ�һ�γ���λ��
::			18/1/12 ��������ֻ��Ҫ�����ַ������Ӵ�
::Param	 	indexOf_Str		��Ҫ�ַ���
::Param	 	strChild		��Ҫ��ȡλ�õ��Ӵ�
::param 	indexOf_Index	��ʼ��λ��
::return 	temp.data 		�Ҳ���ֵΪ-1����֮���Ӵ�λ��

@echo off
setlocal ENABLEDELAYEDEXPANSION
::���û������� �ھֲ�ͬ����������⣩  ��ȡ��ʱ!num!������%num%

set strChild=%2
set indexOf_Index=%3
if "%indexOf_Index%" EQU "" set indexOf_Index=0
::set length=%3
call %string_path%length.bat %strChild%
set /p length=<%data_path%temp.data
::echo %length%
set indexOf_Str=%1

::echo �ַ���%indexOf_Str%
::echo �Ӵ�����%length%
::echo �Ӵ�ֵ%strChild%
::���ղ���

::��ʼ��indexOf_Str
for /l %%a in (1,1,%indexOf_Index%) do (
	set indexOf_Str=!indexOf_Str:~1!
)
::echo %indexOf_Str%

set str2=
set num=0

:next

if "%indexOf_Str%"=="" goto fail
::���str�� ����
::echo ��ȡ�Ӵ�
goto getStrChild
:getOK
::getOK �Ӵ�ƴ�ӻ�ȡ��Ͻ��бȽ�
::echo ���бȶ�
if not "%indexOf_Str%"=="" (
	if "%str2%"=="%strChild%" (
		set /a num+=%indexOf_Index%
		goto last
	)
	::����
	set "indexOf_Str=%indexOf_Str:~1%"
	set /a num+=1
	goto next
)else goto fail
::����ÿ�е�ע��������
::goto getStrChild �� :getOK ���������λ�ȡ�μӱȽϵ��Ӵ�
::"%str2%"=="%strChild%"   ����ȡ���Ӵ��Ͳ����Ӵ����ʱ�����
::������ �ֱ���ÿ��ѭ��strȥ����λ �Լ� ����next��ǩ����ѭ��

:getStrChild 
::���л�ȡ������Ӵ��Ƚϵ��Ӵ�
set num1=0
set str2=
::echo ���str2:%str2% ���»�ȡ�µ��Ӵ�
set temp=%indexOf_Str%
::echo %temp%
:doNext
::doNext ����ѭ����ȡ����Ϊ2���Ӵ�ѭ��
if "%temp%"=="" goto fail
::fail �ҵ�ĩβ��Ȼ�Ҳ���
::echo ƴ��ǰstr2:%str2%,temp:%temp%,length:%length%
set str2=%str2%%temp:~0,1%
::echo ƴ�Ӻ�%str2%
::��ÿ��ѭ����ƴ�����ɱȽ��Ӵ�
set "temp=%temp:~1%"
::echo %temp%
::ÿ��ѭ��tempȥ����λ
set /a num1+=1
::echo num1:%num1%,%length%
if %num1%==%length% (goto getOK) else goto doNext
::echo ����ѭ��doNext
::getOK �Ӵ�ƴ����Ϸ��ؽ��бȽ�
::if not "%num1%"=="%length%" 
::doNext ����ѭ����ȡ����Ϊ2���Ӵ�ѭ��
:fail
::fail �ҵ�ĩβ��Ȼ�Ҳ���
set num=-1

:last
::echo λ��%num% & (echo %num% > temp.txt)
echo %num% > %data_path%temp.data


