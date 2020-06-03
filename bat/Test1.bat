@echo off
::设置lib库的路径
set lib_path=%cd%\lib\
set str=中华人民共和国成立 
cd %lib_path%
call String substring %str% 5 7
call System print
pause




