.include "macros.asm" // Pøilinkování souboru macros.asm

SPinit RAMEND - 0x00F0 // Zavolání makra pro inicializaci stack pointeru

outm DDRB, 0b11111111, R16 // Zavolání makra pro uložení hodnoty do SFR

outm PORTB, 0b00000001, R16

main: jmp main // Hlavní smyèka programu
