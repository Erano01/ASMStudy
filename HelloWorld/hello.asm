; Hello World programı - x86-64 Windows için
; MASM (Microsoft Macro Assembler) ile
; ML64 ile derlemek için: ml64 /c hello.asm
; Link için: link hello.obj /SUBSYSTEM:CONSOLE /ENTRY:main /OUT:hello.exe

.data
    message BYTE 'Merhaba Dunya!', 0Dh, 0Ah, 0  ; Mesaj + satır sonu

.code
    EXTERN printf:PROC
    EXTERN ExitProcess:PROC
    
    main PROC
        ; Stack hizalama (Windows x64 calling convention)
        push rbp
        mov rbp, rsp
        sub rsp, 32         ; Shadow space için 32 byte ayır
        
        ; printf çağrısı
        lea rcx, message    ; İlk parametre (format string) RCX'e
        call printf
        
        ; Programdan çık
        xor ecx, ecx        ; Çıkış kodu 0
        call ExitProcess
        
        ; Temizlik (buraya asla gelmeyecek ama yine de)
        add rsp, 32
        pop rbp
        ret
    main ENDP

END
