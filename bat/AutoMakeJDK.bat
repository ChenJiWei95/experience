::添加环境变量JAVA_HOME
@echo off 
::后面将不显示详细的执行命令

set rootPath=
set /p "rootPath=输入运行的根目录（回车默认c:\Windows\System32）："
if defined rootPath (echo 使用默认路径) else set rootPath=c:\Windows\System32
c:
cd %rootPath%
echo 当前路径为%rootPath%
::设置输入参数 当输入参数为空时使用默认参数
::设置执行目录

echo 设置java环境
echo （选项1：配置宿舍环境。选项2：配置课室环境）
set input=
set /p "input=请输入选项（回车默认选项1）："
if input=="1" (echo 当前操作地为宿舍) && goto sushe
if input=="2" (echo 当前操作地为课室) && goto keshi

:keshi
echo 配置宿舍环境:
set javapath=
set /p "javapath=请输入jdk路径（回车默认C:\Program Files\Java\jdk1.6.0_21）："
if defined javapath (echo 使用默认路径) else set javapath=" C:\Program Files\Java\jdk1.6.0_21"
echo 当前jdk路径为%javapath%
goto continute

:sushe
echo 配置宿舍环境:
set javapath=
set /p "javapath=请输入jdk路径（回车默认C:\Program Files\Java\jdk1.8.0_73）："
if defined javapath (echo 使用默认路径) else set javapath="C:\Program Files\Java\jdk1.8.0_73"
echo 当前jdk路径为%javapath%

:continute
set regpath=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
set evname=JAVA_HOME

reg add "%regpath%" /v %evname% /d %javapath% /f && echo JAVA_HOME设置完毕
::reg add KeyName [/v EntryName|/ve（环境名称）] [/t DataType] [/s separator] [/d value（值）] [/f] 


set evname=PATH
set value1=" %%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin;"
reg add "%regpath%" /v %evname% /d %value1% /f && echo PATH设置完毕

set evname=classpath
set value2=".;%%JAVA_HOME%%lib\dt.jar;%%JAVA_HOME%%lib\tools.jar;"
reg add "%regpath%" /v %evname% /d %value2% /f && echo classpath设置完毕 && exit

pause