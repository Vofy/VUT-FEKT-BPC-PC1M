.include "macros.asm" // P�ilinkov�n� souboru macros.asm

SPinit RAMEND - 0x00F0 // Zavol�n� makra pro inicializaci stack pointeru

outm DDRB, 0b11111111, R16 // Zavol�n� makra pro ulo�en� hodnoty do SFR

outm PORTB, 0b00000001, R16

main: jmp main // Hlavn� smy�ka programu
