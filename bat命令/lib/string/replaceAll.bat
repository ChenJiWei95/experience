::Date   18/6/2
::Author ��
::Desc   ���������ܣ�
::			�Ӻ���ǰƥ���Ӵ�
::Param	 	replaceAll_Str			��Ҫ�ַ���
::Param	 	replaceAll_OldStr		�ȽϵĴ�
::Param	 	replaceAll_NewStr		�ȽϵĴ�
::return	temp.data 				�Ҳ���ֵΪ-1����֮��1
@echo off
set replaceAll_Str=%1
set replaceAll_OldStr=%2
set replaceAll_NewStr=%3
set replace_Index=0

goto doReplace
: doReplace
call %string_path%replace.bat %replaceAll_Str% %replaceAll_OldStr% %replaceAll_NewStr%
set /p replaceAll_Str=<%data_path%temp.data


::��ʼ��replace_OldStr���±�
call %string_path%indexOf.bat %replaceAll_Str% %replaceAll_OldStr% %replace_Index%
set /p replace_Index=<%data_path%temp.data 

::echo replace_Index��%replace_Index%
::�������-1��ֱ���˳�
if %replace_Index% EQU -1 goto end
goto doReplace
goto end
: end
echo %replaceAll_Str%>%data_path%\temp.data
