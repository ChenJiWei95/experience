::Date   18/6/2
::Author ��
::Desc   ���������ܣ�
::			�Ӻ���ǰƥ���Ӵ�
::Param	 	lastIndexStr	��Ҫ�ַ���
::Param	 	compareStr		�ȽϵĴ�
::Param	 	compareStr		�ȽϵĴ�
::return	temp.data 		�Ҳ���ֵΪ-1����֮��1
@echo off
setlocal ENABLEDELAYEDEXPANSION
set replace_Str=%1
set replace_OldStr=%2
set replace_NewStr=%3

::��ʼ��replace_OldStr���±�
call %string_path%indexOf.bat %replace_Str% %replace_OldStr%
set /p replace_Index=<%data_path%temp.data
::echo replace_Index��%replace_Index%
::�������-1��ֱ���˳�
if %replace_Index% EQU -1 goto end

::��ʼ��replace_Str�ĳ���
call %string_path%length.bat %replace_Str%
set /p replace_StrLen=<%data_path%temp.data
::echo %replace_StrLen%

::��ʼ��replace_OldStr�ĳ���
call %string_path%length.bat %replace_OldStr%
set /p replace_OldStrLen=<%data_path%temp.data
::echo replace_OldStrLen:%replace_OldStrLen%

::��ʼ��ǰ����
call %string_path%substring.bat %replace_Str% 0 %replace_Index%
set /p replace_StrFont=<%data_path%temp.data

::��ʼ����벿��������±�
set /a replace_StrLast_Index=%replace_Index%+%replace_OldStrLen%
if %replace_StrLast_Index% NEQ %replace_StrLen% (
	call %string_path%substring.bat %replace_Str% %replace_StrLast_Index% %replace_StrLen%
	set /p replace_StrLast=<%data_path%temp.data
) 
set	replace_Str=%replace_StrFont%%replace_NewStr%%replace_StrLast%
goto end
: end
echo %replace_Str%>%data_path%temp.data