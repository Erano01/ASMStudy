# Register Nedir
Register, CPU’nun içinde bulunan, sayıları çok az ama erişim süresi tek clock cycle olan küçük depolama alanlarıdır.<br>
Hız sıralaması (yaklaşık):<br>
Register > L1 Cache > L2 Cache > L3 Cache > RAM > Disk<br>

Bu yüzden compiler’lar ve assembly kodu yazanlar register kullanımına obsesiftir.

Register’lar üç ana amaçla kullanılır:<br>
1. Veri tutmak (operandlar, geçici değerler)<br>
2. Adres tutmak (memory pointer’ları)<br>
3. CPU durumunu kontrol etmek (flag’ler, instruction pointer)<br>

## 8 Bit(Low) Registers
8 Bit (Low) Registers:<br>
Bunlar 16-bit register’ın low 8 bitidir.<br>
• AL → AX’in Low 8 biti<br>
• BL → BX’in Low 8 biti<br>
• CL → CX’in Low 8 biti<br>
• DL → DX’in Low 8 biti<br>

x64 ile gelen 8 Bit (Low) Registers:<br>
• SIL → RSI’nin Low 8 biti<br>
• DIL → RDI’nin Low 8 biti<br>
• BPL → RBP’nin Low 8 biti<br>
• SPL → RSP’nin Low 8 biti<br>

Yeni GPR’lerin alt 8 bitleri:<br>
• R8B, R9B, R10B, R11B, R12B, R13B, R14B, R15B<br>

## 8 Bit(High) Registers
Bunlar 16-bit register’ın high 8 bitidir.<br>
• AH → AX’in high 8 biti<br>
• BH → BX’in high 8 biti<br>
• CH → CX’in high 8 biti<br>
• DH → DX’in high 8 biti<br>

## 16 Bit Registers
Bunlar orijinal 8086 register’larıdır ve hâlâ x86-64’te mevcuttur.<br>
• AX (Accumulator) -> Aritmetik işlemlerde varsayılan register<br>
• BX (Base) -> Tarihsel olarak base address tutmak için<br>
• CX (Counter) -> Loop ve tekrar işlemleri için sayaç<br>
• DX (Data) -> Çarpma/bölme işlemlerinde üst veri<br>

Index ve stack register’ları:<br>
• SI (Source Index) → Memory kaynak adresi<br>
• DI (Destination Index) → Memory hedef adresi<br>
• BP (Base Pointer) → Stack frame referansı<br>
• SP (Stack Pointer) → Stack’in tepe adresi<br>

x64 ile gelen 16-bit alt register’lar:<br>
•  R8W, R9W, R10W, R11W, R12W, R13W, R14W, R15W<br>


## 32 Bit Registers
• EAX (Accumulator Register) -> Aritmetik ve mantıksal işlemlerde varsayılan register’dır. Fonksiyon dönüş değeri bunun üzerinden verilir.<br>
• EBX (Base Register) -> Tarihsel olarak base address tutmak için kullanılır, Calling convention’larda genelde callee-saved’dir, Uzun ömürlü değişkenleri tutmak için tercih edilir.<br>
• ECX (Counter Register)-> Loop ve tekrar işlemlerinde kullanılır, rep movs, rep stos gibi string talimatlarında sayaçtır. Bazı calling convention’larda argüman register’ıdır (Windows x64)<br>
• EDX (Data Register)-> Çarpma ve bölmede üst kısmı tutar, I/O ve sistem seviyesinde veri taşımada sık görülür. Fonksiyon argümanı olarak da kullanılabilir.<br>
• ESI (Source Index)-> memory işlemlerinde kaynak adres, String ve buffer kopyalamada kullanılır. System V ABI’de 1. argüman register’ıdır.<br>
• EDI (Destination Index)-> memory işlemlerinde hedef adres, String talimatlarında RSI ile eşleşir. System V ABI’de 0. argüman register’ıdır.<br>
• EBP (Base / Frame Pointer)-> Stack frame’in sabit referans noktasıdır, Local variable ve argümanlara erişim için kullanılır. Debug ve reverse engineering’de kritik önemdedir.<br>
• ESP (Stack Pointer)-> Stack’in en üst adresini tutar, push, pop, call, ret doğrudan bunu değiştirir. Yanlış kullanımı programı anında çökertir<br>

// E → Extended (16-bit AX, BX, … register’larının 32-bit hâli)<br>
// ESP stack pointer, EBP frame pointer’dır<br>

// Aşağıdakiler x86'nin segment registerları:<br>

• CS (Code Segment) -> Çalıştırılan kodun bulunduğu segmenti temsil eder. Instruction fetch işlemleri CS + EIP üzerinden yapılır. Kontrol akışı (jmp, call) bu segment ile ilişkilidir.<br>
• DS (Data Segment) -> Varsayılan veri segmentidir. Global ve static veriler için kullanılır. Bellek erişimlerinde segment override yoksa DS kullanılır.<br>
• SS (Stack Segment) -> Stack’in bulunduğu segmenttir. ESP ile birlikte kullanılır. Stack erişimlerinin güvenliği ve bütünlüğü için tasarlanmıştır.<br>
• ES (Extra Segment) -> Ek veri segmentidir. Özellikle string talimatlarında (rep movs, stos) hedef segment olarak kullanılır.<br>
• FS / GS (Thread-Local Storage) -> Thread-local ve CPU-local verilere erişim için kullanılır. Modern sistemlerde aktif olarak kullanılan tek segment register’lardır. Hem x86 hem x64 mimarilerinde mevcuttur.<br>

// x86 Control Register'ları<br>

• EIP (Instruction Pointer) -> CPU’nun bir sonraki çalıştıracağı instruction’ın adresini tutar. Doğrudan yazılamaz, sadece jump / call / ret ile değişir.<br>
• EFLAGS -> CPU’nun durum bilgisini tutar. Aritmetik ve karşılaştırma sonuçlarına göre branch kararları buradan verilir. (ZF, CF, OF, SF, IF gibi flag’leri içerir)<br>

## 64 Bit Registers
• RAX (Accumulator Register) -> Aritmetik ve mantıksal işlemlerde varsayılan register’dır. Fonksiyon dönüş değeri bunun üzerinden verilir.<br>
• RBX (Base Register)-> Tarihsel olarak base address tutmak için kullanılır, Calling convention’larda genelde callee-saved’dir, Uzun ömürlü değişkenleri tutmak için tercih edilir.<br>
• RCX (Counter Register)->  Loop ve tekrar işlemlerinde kullanılır, rep movs, rep stos gibi string talimatlarında sayaçtır. Bazı calling convention’larda argüman register’ıdır (Windows x64)<br>
• RDX (Data Register)-> Çarpma ve bölmede üst kısmı tutar, I/O ve sistem seviyesinde veri taşımada sık görülür. Fonksiyon argümanı olarak da kullanılabilir.<br>
• RSI (Source Index)-> memory işlemlerinde kaynak adres, String ve buffer kopyalamada kullanılır. System V ABI’de 1. argüman register’ıdır.<br>
• RDI (Destination Index)-> memory işlemlerinde hedef adres, String talimatlarında RSI ile eşleşir. System V ABI’de 0. argüman register’ıdır.<br>
• RBP (Base / Frame Pointer)-> Stack frame’in sabit referans noktasıdır, Local variable ve argümanlara erişim için kullanılır. Debug ve reverse engineering’de kritik önemdedir.<br>
• RSP (Stack Pointer)-> Stack’in en üst adresini tutar, push, pop, call, ret doğrudan bunu değiştirir. Yanlış kullanımı programı anında çökertir<br>

// R → Register (64-bit)<br>

• R8 -> x64 ile gelen general-purpose register. Fonksiyon argümanı (System V: 5., Windows: 3.). Compiler optimizasyonlarında yoğun kullanılır.<br>
• R9 -> x64 ile gelen general-purpose register, Fonksiyon argümanı (System V: 6., Windows: 4.). Geçici veri tutmak için kullanılır.<br>
• R10 ->Tamamen general-purpose, Genelde caller-saved. Syscall ve low-level kodda sık görülür.<br>
• R11 -> Tamamen general-purpose, Caller-saved, geçici işlemler. Syscall dönüşlerinde kullanılır.<br>
• R12 -> General-purpose, Callee-saved, Uzun süreli değerler için uygundur.<br>
• R13 -> General-purpose, Callee-saved. Compiler’lar tarafından pointer olarak sık seçilir.<br>
• R14 -> General-purpose, Callee-saved, Loop ve state tutmada kullanılır.<br>
• R15 ->General-purpose, Callee-saved, En “serbest” register; optimizer favorisi.<br>

// x64 Control Register'ları<br>

• RIP (Instruction Pointer) -> CPU’nun bir sonraki çalıştıracağı instruction’ın adresini tutar. RIP-relative addressing sayesinde position-independent code mümkün olur.<br>
• RFLAGS -> CPU’nun durum ve kontrol flag’lerini tutar. Branch, interrupt ve string işlemleri bu register’a bağlıdır.<br>


## SIMD / Vector Register'ları

// x86 / x64:<br>
• XMM0–XMM15 ->128-bit SIMD register’larıdır (SSE). Float, double ve packed integer işlemlerinde kullanılır.<br>

// x64 (genişletilmiş):<br>
• YMM0–YMM15 ->256-bit SIMD register’larıdır (AVX).<br>
• ZMM0–ZMM31 -> 512-bit SIMD register’larıdır (AVX-512). Yüksek performans hesaplamalarda kullanılır.<br>








