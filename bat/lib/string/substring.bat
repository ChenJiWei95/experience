::Date   10/9
::Author ��
::Desc   ���������ܣ�
::			���ַ�����ɸѡ��start��end���Ӵ�
::     		���ܶ��пո���в���
::Param	 str	��Ҫɸѡ���ַ���
::Param	 start	ɸѡ����ʼλ��
::Param	 end	ɸѡ�Ľ���λ��
@echo off
setlocal ENABLEDELAYEDEXPANSION
::���û������� �ھֲ�ͬ����������⣩  ��ȡ��ʱ!num!������%num%

::���ղ���
set str=%1
set start=%2
set end=%3
::echo %str%

::�쳣�ж�
if %start% EQU -1 goto NegativeException
if %end% EQU -1 goto NegativeException
if %start% GEQ %end% goto AroundException
::��start����endʱ����ʾ�쳣

set num=-1
:next

if "%str%"=="" goto endd
::���str�� ����
if not "%str%"=="" (
	set /a num+=1 
	if !num!==%start% goto STq
	set "str=%str:~1%"
	if not !num!==%end% goto next
)
::����ÿ�е�ע��������
::�Լ�
::ѭ����start����ǰ����ȡ�ַ�
::ÿ��ѭ��strȥ����λ
::δ��start���ؼ���ѭ��

:STq
::�˴���ʼ��ȡ�ַ�
if not "%str%"=="" (
	set substring_Temp=%substring_Temp%%str:~0,1%
	set /a num+=1
	if !num! EQU %end% (
		goto last
	)
	set "str=%str:~1%"
	if not !num!==%end% goto STq
) else goto endd
::temp��ʼ��ȡ ��ƴ�ӵ���ʽ
::num��Ȼ��ѭ�����Լ�
::��ѭ����endʱ������ȡ
::��Ȼ��ÿ��ѭ��strȥ����λ

:last
::echo ��ȡ�����ַ���%substring_Temp% & (echo %substring_Temp% > substring_Temp.txt)
::������
echo !substring_Temp!>%data_path%temp.data
goto endd

::�±�ǰ���쳣
:AroundException
::echo IndexOut�±��쳣 > substring_Temp.data & exit
echo IndexOut�±��쳣 start:%start% end:%end%
goto endd

::�±긺���쳣
:NegativeException
echo �±긺���쳣
goto endd

:endd