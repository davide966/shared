@echo off

setlocal enabledelayedexpansion

set mytimeout=10
set servicelist[0]=QlikSenseEngineService
set servicelist[1]=QlikSenseProxyService
set servicelist[2]=QlikSensePrintingService
set servicelist[3]=QlikSenseSchedulerService
set servicelist[4]=QlikSenseServiceDispatcher
set servicelist[5]=QlikSenseRepositoryService
set servicelist[6]=QlikSenseRepositoryDatabase

rem array_limit=array_length -1
set array_limit=6
echo stopping services...
for /l %%s in (0,1,%array_limit%) do (
    echo stopping !servicelist[%%s]!...
    rem echo y | net stop !servicelist[%%s]!
    if ERRORLEVEL 1 goto error
)

echo:
echo timeout %mytimeout%...
timeout %mytimeout%
echo:

echo starting services...
for /l %%s in (!%array_limit!, -1, 0) do (
    echo starting !servicelist[%%s]!...
    rem echo y | net start !servicelist[%%s]!
    if ERRORLEVEL 1 goto error
)

goto end

:error
echo Problema!!!
rem download: https://www.softpedia.com/get/Internet/E-mail/Mail-Utilities/SendSMTP.shtml#download
rem Attenzione: necessita di Visual C++ Redistributable Package per Visual Studio 2013 (32bit)
rem https://www.microsoft.com/it-it/download/details.aspx?id=40784
rem usa SendSMTP.ini di default
C:\path_to\SendSMTP\SendSMTP.exe /S
@goto:eof

:end
rem exit
