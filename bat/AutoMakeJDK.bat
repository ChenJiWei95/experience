::��ӻ�������JAVA_HOME
@echo off 
::���潫����ʾ��ϸ��ִ������

set rootPath=
set /p "rootPath=�������еĸ�Ŀ¼���س�Ĭ��c:\Windows\System32����"
if defined rootPath (echo ʹ��Ĭ��·��) else set rootPath=c:\Windows\System32
c:
cd %rootPath%
echo ��ǰ·��Ϊ%rootPath%
::����������� ���������Ϊ��ʱʹ��Ĭ�ϲ���
::����ִ��Ŀ¼

echo ����java����
echo ��ѡ��1���������ỷ����ѡ��2�����ÿ��һ�����
set input=
set /p "input=������ѡ��س�Ĭ��ѡ��1����"
if input=="1" (echo ��ǰ������Ϊ����) && goto sushe
if input=="2" (echo ��ǰ������Ϊ����) && goto keshi

:keshi
echo �������ỷ��:
set javapath=
set /p "javapath=������jdk·�����س�Ĭ��C:\Program Files\Java\jdk1.6.0_21����"
if defined javapath (echo ʹ��Ĭ��·��) else set javapath=" C:\Program Files\Java\jdk1.6.0_21"
echo ��ǰjdk·��Ϊ%javapath%
goto continute

:sushe
echo �������ỷ��:
set javapath=
set /p "javapath=������jdk·�����س�Ĭ��C:\Program Files\Java\jdk1.8.0_73����"
if defined javapath (echo ʹ��Ĭ��·��) else set javapath="C:\Program Files\Java\jdk1.8.0_73"
echo ��ǰjdk·��Ϊ%javapath%

:continute
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=JAVA_HOME

reg add "%regpath%" /v %evname% /d %javapath% /f && echo JAVA_HOME�������
::reg add KeyName [/v EntryName|/ve���������ƣ�] [/t DataType] [/s separator] [/d value��ֵ��] [/f] 


set evname=PATH
set value1=" %%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;"
reg add "%regpath%" /v %evname% /d %value1% /f && echo PATH�������

set evname=classpath
set value2=".;%%JAVA_HOME%%lib\dt.jar;%%JAVA_HOME%%lib\tools.jar;"
reg add "%regpath%" /v %evname% /d %value2% /f && echo classpath������� && exit

pause