@echo off

tools\make -C lit all

:: need vs2017 or later
setlocal enabledelayedexpansion
for /f "usebackq tokens=*" %%i in (`tools\vswhere -version 15.0 -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do (
  set msbuild="%%i"
)
if defined msbuild (
    tools\premake5 vs2017
    rm -f tow.exe
    call %msbuild% "projects\tow\tow.vcxproj" /m /v:m /t:build /p:Configuration=Release
    call tow.exe
) else (
    echo Error: failed to find vs2017+
    echo /B 1
)