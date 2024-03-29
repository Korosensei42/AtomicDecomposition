@echo off
set /p dir=Enter Directory:
set /p hide=Want to hide? [J/N]:

if "%hide%"=="J" GOTO HIDE
if "%hide%"=="N" GOTO NOHIDE

:HIDE
mkdir %dir%
for %%f in (*.red) do (
    echo %%~nf.log wird erstellt!
    %~dp0hideexec.exe reduce "%%~nf.txt" -w -l %dir%/%%~nf.red"
)
:End

:NOHIDE
mkdir %dir%
for %%f in (*.red) do (
    echo %%~nf.log wird erstellt!
    reduce "%%~nf.txt" -w -l %dir%/%%~nf.red"
)
:End