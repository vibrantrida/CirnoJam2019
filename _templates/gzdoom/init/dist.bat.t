---
to: <%= shortname %>-dist.bat
unless_exists: true
---
@echo off

rem rem prepare timestamp
rem set currentYr=%date:~-4%
rem set currentMon=%date:~3,2%
rem set currentDay=%date:~0,2%
rem set currentHr=%time:~0,2%
rem set currentMin=%time:~3,2%
rem set currentSec=%time:~6,2%

rem rem remove leading space
rem if "%currentMon:~0,1%" == " " set currentMon=0%currentMon:~1,1%
rem if "%currentDay:~0,1%" == " " set currentDay=0%currentDay:~1,1%
rem if "%currentHr:~0,1%" == " " set currentHr=0%currentHr:~1,1%
rem if "%currentMin:~0,1%" == " " set currentMin=0%currentMin:~1,1%
rem if "%currentMin:~0,1%" == " " set currentMin=0%currentMin:~1,1%

rem set timestamp=%currentYr%%currentMon%%currentDay%_%currentHr%%currentMin%%currentSec%%currentMS%

rem compile then archive
call <%= shortname %>-compile.bat
tools\7za.exe a -tzip dist\<%= shortname %>\<%= shortname %>.ipk3 .\<%= shortname %>\* -x!acs\*.acs
