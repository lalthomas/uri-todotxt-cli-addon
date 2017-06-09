@echo OFF 	
REM File : uri run.bat 	
REM Creation Date : 2017-06-09 	
REM Author : Lal Thomas 	
REM Original File : D:\Dropbox\project\20170609-uri todotxt cli addon\uri
	
REM Thanks http://stackoverflow.com/a/19706067/2182047
REM Original modified for need
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "longdatestamp=%YYYY%-%MM%-%DD%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

set scriptFolderPathFull=%~dp0%
set scriptFolderPath=%scriptFolderPathFull:~0,-1%

IF [%1] == [] GOTO :SETFILE
set file=%1
GOTO :EXECUTE

:SETFILE
set file="D:\Dropbox\project\20170609-uri todotxt cli addon\uri"
GOTO :EXECUTE

REM Section
:EXECUTE
call :INSTALL
exit

exit /b 0

:INSTALL

pushd "%userProfile%\.todo.actions.d"
echo "%scriptFolderPath%"
mklink /d uri "%scriptFolderPath%"
popd
exit /b 0
