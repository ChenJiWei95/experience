@echo off
::ÉèÖÃlib¿âµÄÂ·¾¶
set lib_path=%cd%\lib\
set str=123456
call %lib_path%String.bat substring %str% 5 6
call %lib_path%System.bat print
pause




