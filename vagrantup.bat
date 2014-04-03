@echo off

SET VM_MEMORY=400
echo INFO - Setting VM_MEMORY=%VM_MEMORY%

rem -----------------------------------------------------------------------------------------------
rem Obtaining local IP. Nexus Server should be local. If not, a SSH tunnel may be required
rem -----------------------------------------------------------------------------------------------
echo WARN - Local execution! Getting local IP for Nexus Server. WARN - SSH TUNNEL MAY BE REQUIRED!
set str=
ipconfig | findstr /C:"   IPv4" > .tmp
for /f "tokens=*" %%i in ('type .tmp') do (
	call :getip "%%i"
	goto :break-1
)
:break-1
rem -----------------------------------------------------------------------------------------------

echo INFO - Copying nexus{LOCAL}.properties To nexus.properties
copy /Y "puppet\modules\base\files\nexus{LOCAL}.properties" puppet\modules\base\files\nexus.properties

echo -------------------------------------------------------------------------
echo INFO - vagrant up
echo -------------------------------------------------------------------------
@echo on
vagrant up
@echo off
echo.
echo -------------------------------------------------------------------------
goto :end


rem ###############################################################################################
rem GetIP: Creates nexus{LOCAL}.properties file with the IP contained in ipconfig output file line
rem ###############################################################################################
:getip
set str=%1
set str=%str:~1,-1%
set str=%str: =%
for /f "tokens=2 delims=: " %%a in ("%str%") do (
	echo WARN - Pushing NEXUS_URL=%%a:8081 to 'nexus{LOCAL}.properties'.
	echo WARN -         ========= ^^
	echo WARN - A SSH Tunnel may be required. Example:
	echo WARN -  ssh -N %USERNAME%@10.192.104.12 -L 0.0.0.0:8081:127.0.0.1:8081
	echo NEXUS_URL=%%a:8081> "puppet\modules\base\files\nexus{LOCAL}.properties"
)
del .tmp
goto :EOF
rem ###############################################################################################

:end
echo INFO - Finished!
exit 0