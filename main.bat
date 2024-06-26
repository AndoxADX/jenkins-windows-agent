@echo off
set current_dir="%CD%"
@REM set "openjdk_url=https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_windows-x64_bin.zip"
set "jenkins_agent_url=https://github.com/winsw/winsw/releases/download/v2.12.0/WinSW-x64.exe"

@REM :download_jdk11
@REM rem jdk-11.0.2
@REM curl -o "%current_dir%\openjdk-11.0.2_windows-x64_bin.zip" "%openjdk_url%"
@REM powershell -Command "Expand-Archive -Path '%current_dir%\openjdk-11.0.2_windows-x64_bin.zip' -DestinationPath '%current_dir%'"

:download_agent
curl -o "%current_dir%\jenkins-agent.exe" "%jenkins_agent_url%"

if "%1"=="agent" goto end

:install_service
jenkins-agent.exe install
:start_service
jenkins-agent.exe start

:end