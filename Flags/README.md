# x86 / x86-64 Flags
Assembly’de flag’lar, CPU’nun status / condition register’ı içinde bulunan ve son yapılan işlemin sonucuna dair durumu gösteren 1-bitlik özel bayraklardır.<br>
x86 mimarisinde bu register FLAGS / EFLAGS / RFLAGS olarak geçer.<br>
ALU bir işlem yapar → sonuçla ilgili bilgileri flag’lara yazar → branch / conditional instruction’lar bu flag’lara bakar.<br>
x86 / x86-64 mimarisinde flag’lar 3 ana kategoriye ayrılır. Bu ayrım ne amaçla kullanıldıklarına göredir.

## 1-) Status (Condition) Flags
• ALU işlemlerinin sonucunu temsil eder<br>
• add / sub / cmp / test / and / or gibi instruction’lar tarafından otomatik set edilir<br>

Başlıca status flag’lar:<br>
• CF (Carry Flag) – unsigned taşma<br>
• ZF (Zero Flag) – sonuç 0 mı<br>
• SF (Sign Flag) – sonuç negatif mi<br>
• OF (Overflow Flag) – signed taşma<br>
• PF (Parity Flag) – parity<br>
• AF (Auxiliary Carry) – BCD<br>

Branch’lerin %90’ı burayı kullanır<br>

## 2-) Control Flags
• CPU’nun nasıl çalışacağını kontrol eder<br>
• Arithmetic sonucu ile alakalı değildir<br>

Control flag’lar:<br>
• IF (Interrupt Flag) – interrupt açık / kapalı<br>
• DF (Direction Flag) – string instruction yönü<br>
• TF (Trap Flag) – single-step debug<br>

Daha çok kernel / debugger / low-level kodda<br>

## 3-) System Flag
• CPU’nun çalışma modu ve privilege seviyeleri ile ilgilidir<br>
• User-mode’da çoğu erişilemez<br>

Önemli system flag’lar:<br>
• IOPL (I/O Privilege Level) – I/O yetkisi<br>
• NT (Nested Task)<br>
• RF (Resume Flag) – debug exception kontrolü<br>
• VM (Virtual-8086 Mode)<br>
• AC (Alignment Check)<br>
• VIF / VIP – virtual interrupt flag’ları<br>

OS / hypervisor alanı<br>

