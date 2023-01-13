@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
for %%i in ("%~dp0..") do set "BASEDIR=%%~fi"

:repoSetup
set REPO=


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\com\sun\mail\pop3\2.0.1\pop3-2.0.1.jar;"%REPO%"\com\sun\mail\mailapi\2.0.1\mailapi-2.0.1.jar;"%REPO%"\com\sun\activation\jakarta.activation\2.0.1\jakarta.activation-2.0.1.jar;"%REPO%"\com\sun\mail\smtp\2.0.1\smtp-2.0.1.jar;"%REPO%"\mysql\mysql-connector-java\8.0.29\mysql-connector-java-8.0.29.jar;"%REPO%"\com\google\protobuf\protobuf-java\3.19.4\protobuf-java-3.19.4.jar;"%REPO%"\commons-codec\commons-codec\1.4\commons-codec-1.4.jar;"%REPO%"\commons-logging\commons-logging\1.2\commons-logging-1.2.jar;"%REPO%"\commons-httpclient\commons-httpclient\3.1-rc1\commons-httpclient-3.1-rc1.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.5.13\httpclient-4.5.13.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.4.15\httpcore-4.4.15.jar;"%REPO%"\net\sourceforge\barbecue\barbecue\1.5-beta1\barbecue-1.5-beta1.jar;"%REPO%"\com\sun\mail\javax.mail\1.6.2\javax.mail-1.6.2.jar;"%REPO%"\javax\activation\activation\1.1\activation-1.1.jar;"%REPO%"\org\apache\tomcat\tomcat-annotations-api\8.5.81\tomcat-annotations-api-8.5.81.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.5.81\tomcat-embed-core-8.5.81.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.5.81\tomcat-embed-jasper-8.5.81.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.5.81\tomcat-embed-el-8.5.81.jar;"%REPO%"\org\eclipse\jdt\ecj\3.12.3\ecj-3.12.3.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.5.81\tomcat-jasper-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.5.81\tomcat-el-api-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.5.81\tomcat-jasper-el-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.5.81\tomcat-jsp-api-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-coyote\8.5.81\tomcat-coyote-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.5.81\tomcat-servlet-api-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-jdbc\8.5.81\tomcat-jdbc-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.5.81\tomcat-juli-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.5.81\tomcat-api-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-jni\8.5.81\tomcat-jni-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.5.81\tomcat-util-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.5.81\tomcat-util-scan-8.5.81.jar;"%REPO%"\org\apache\tomcat\tomcat-jaspic-api\8.5.81\tomcat-jaspic-api-8.5.81.jar;"%REPO%"\com\heroku\sample\Elysium-Portal\1.0\Elysium-Portal-1.0.jar

set ENDORSED_DIR=
if NOT "%ENDORSED_DIR%" == "" set CLASSPATH="%BASEDIR%"\%ENDORSED_DIR%\*;%CLASSPATH%

if NOT "%CLASSPATH_PREFIX%" == "" set CLASSPATH=%CLASSPATH_PREFIX%;%CLASSPATH%

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS%  -classpath %CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dapp.home="%BASEDIR%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if %ERRORLEVEL% NEQ 0 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
