::Date   10/9
::Author ��
::Desc   ���������ܣ�
::			��ȡ�ַ����ĳ���
::Param	 length_Str	��Ҫ�ַ���
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
::���ϵ�ѭ��ֱ��Ϊ�� ���num
::echo "%v% size:%num%" & (echo %num% > temp.txt)
echo %num% > %data_path%temp.data
 


