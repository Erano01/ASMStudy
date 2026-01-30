@echo off
echo Assembly programi derleniyor (MASM x64)...

REM Aşağıda kod derleniyor /c ile. /Zi hata ayıklama bilgisi ekleniyor.
REM ML64 komutu MASM x64 derleyicisidir. 
REM hello.asm dosyasını derleyip hello.obj dosyasını oluşturur.
REM /c stands for "Compile the assembly source file"
REM Compiling != Assembling.
ml64 /c /Zi hello.asm
if errorlevel 1 (
    echo HATA: ML64 derleme hatasi!
    pause
    exit /b 1
)

REM Aşağıda obj dosyası linkleniyor ve çalıştırılabilir dosya oluşturuluyor.
REM link komutu obj dosyasını alır ve hello.exe dosyasını oluşturur.
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
