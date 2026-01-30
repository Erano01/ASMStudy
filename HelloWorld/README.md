# İlk Assembly Programı - Hello World

Bu basit x86-64 assembly programı Windows'ta "Merhaba Dünya!" mesajını ekrana yazdırır.

## Gereksinimler

- **Visual Studio 2026** veya **MSVC Build Tools**
- **ML64** (Microsoft Macro Assembler for x64)
- Visual Studio Developer Command Prompt açık olmalı

## Derleme

`build.bat` dosyasını çalıştırın:
```batch
.\build.bat
```

Veya manuel olarak:
```batch
ml64 /c /Zi hello.asm
link hello.obj /SUBSYSTEM:CONSOLE /ENTRY:main /OUT:hello.exe legacy_stdio_definitions.lib msvcrt.lib
```

## Çalıştırma

```batch
.\hello.exe
```

## Program Açıklaması

- `.data` - Veri segmenti (mesaj metni burada)
- `.code` - Kod segmenti (program mantığı burada)
- Windows x64 calling convention kullanılıyor (RCX ilk parametre)
- `printf` fonksiyonu MSVCRT'den kullanılıyor
- `ExitProcess` ile program sonlandırılıyor

## MASM Sözdizimi

MASM, NASM'den farklı sözdizimi kullanır:
- Bölümler: `section .data` yerine `.data`
- Prosedürler: `global main` yerine `main PROC ... ENDP`
- Dosya sonu: `END` direktifi gerekli
