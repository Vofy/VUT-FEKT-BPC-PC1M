.include "m128def.inc"
.include "macros.asm"

.CSEG
SPInit

ldi R16, 0b11111111	;Nastavi data direction pro PORTD
out DDRB, R16

ldi R16, 0b00001111

main:		com R16
			out PORTB, R16
			call delay
			
			com R16
			out PORTB, R16
			call delay

			jmp main


delay:		ldi R17, 255
	
loop3:		ldi R18, 255
loop2:		ldi R19, 50
loop1:		dec R19
			brne loop1

			dec R18
			brne loop2
			dec R17
			brne loop3
ret
