@ECHO off

goto check_Permissions

:check_Permissions
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo off
    ) else (
        echo I know reading is hard but come on, it's the name of a file. Go RTFM.
pause
exit
    )
	
@ECHO off
CD /d %~dp0
mkdir Temp
goto start

:start
echo 2015-2022
curl -L -o Temp\x64.exe https://aka.ms/vs/17/release/vc_redist.x64.exe
curl -L -o Temp\x86.exe https://aka.ms/vs/17/release/vc_redist.x86.exe
echo 2013
curl -L -o Temp\x8613.exe https://aka.ms/highdpimfc2013x86enu
curl -L -o Temp\x6413.exe https://aka.ms/highdpimfc2013x64enu
echo 2012
curl -L -o Temp\x8612.exe https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe
curl -L -o Temp\x6412.exe https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe
echo 2010
curl -L -o Temp\x8610.exe https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe
curl -L -o Temp\x6410.exe https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe
echo 2008
curl -L -o Temp\x868.exe https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe
curl -L -o Temp\x648.exe https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe

cls
echo Installing Visual Studio Runtime packages, please wait.
echo 2015-2022
start /wait Temp\x86.exe /passive /norestart
start /wait Temp\x64.exe /passive /norestart
echo 2013
start /wait Temp\x8613.exe /passive /norestart
start /wait Temp\x6413.exe /passive /norestart
echo 2012
start /wait Temp\x8612.exe /passive /norestart
start /wait Temp\x6412.exe /passive /norestart
echo 2010
start /wait Temp\x8610.exe /passive /norestart
start /wait Temp\x6410.exe /passive /norestart
echo 2008
start /wait Temp\x868.exe /qb
start /wait Temp\x648.exe /qb
echo Deleting system32
echo Done.
rmdir /S /Q Temp\
exit
