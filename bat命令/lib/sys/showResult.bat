::Date   18/6/2
::Author 威
::Desc   本批处理功能：
::			显示temp.data中的结果
@echo off
set /p result=<%data_path%temp.data
echo RESULT:%result%
del %data_path%temp.data