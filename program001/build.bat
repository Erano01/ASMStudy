@echo off
echo Assembly programi derleniyor (MASM x64)...

ml64 /c /Zi hello.asm
if errorlevel 1 (
    echo HATA: ML64 derleme hatasi!
    pause
    exit /b 1
)

link hello.obj /SUBSYSTEM:CONSOLE /ENTRY:main /OUT:hello.exe kernel32.lib ucrt.lib vcruntime.lib msvcrt.lib legacy_stdio_definitions.lib
if errorlevel 1 (
    echo HATA: Link hatasi!
    pause
    exit /b 1
)

echo.
echo Derleme basarili! hello.exe olusturuldu.
echo Programi calistirmak icin: hello.exe
echo.
pause
