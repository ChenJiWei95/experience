@echo off
::����lib���·��
set lib_path=%cd%\lib\
set str=�л����񹲺͹����� 
cd %lib_path%
call String substring %str% 5 7
call System print
pause




