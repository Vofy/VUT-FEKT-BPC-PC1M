.include "m128def.inc"
.include "macros.asm"

ldi R16, HIGH(RAMEND)
out SPH, R16
ldi R16, LOW(RAMEND)
out SPL, R16

ldi R16, 0b11111111	;Nastavi data direction pro PORTB
out DDRB, R16

ldi R16, 0b00000000 ;Nastavi registr R16 (slouzi k nastaveni LEDek) na 0

main:
			ldi R16, 0b11111111
			out PORTB, R16
			call delay

			; ORI 

			ldi R16, 0b00011000
			out PORTB, R16
			call delay

			jmp main



delay:		push R16
			push R17
			push R18

			ldi R16, 255
loop3:		ldi R17, 180
loop2:		ldi R18, 1
loop1:		dec R18
			brne loop1

			dec R17
			brne loop2

			dec R16
			brne loop3

			pop R18
			pop R17
			pop R16
ret
