@echo off
setlocal EnableDelayedExpansion
set "output_cnt=0"
cd.> list_swap.txt
set inputs=%1
set a=%inputs%* /s
dir %a% > list_swap.txt 
for /F "delims=" %%f in ('find "Directory" list_swap.txt') do (
    set "output[!output_cnt!]=%%f"
    set directory=%%f
    set directory=!directory: Directory of =!
    echo !output_cnt! !directory!
    set /a output_cnt+=1
)
del list_swap.txt

set /p id="enter your selection "
set /a y=%id%
if %y%==0 goto:eof 
set string=!output[%y%]!

:: here we take the users selection from the list output[]

set string=%string: Directory of =% 
echo %string% > list_swap.txt
endlocal

FOR /F "tokens=* delims=" %%x in (list_swap.txt) DO (
	echo %%x | clip
	del list_swap.txt
	cd %%x
)
::here we use an extra for loop because commands 
::executed in between setlocal and endlocal will
::allow you to chang directory since its local
::So we write a separate for loop






