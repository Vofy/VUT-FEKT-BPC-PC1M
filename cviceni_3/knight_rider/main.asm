.include "m128def.inc"
.include "macros.asm"

SPInit

ldi R16, 0b11111111	;Nastavi data direction pro PORTB
out DDRB, R16

ldi R16, 0b00000000 ;Nastavi registr R16 (slouzi k nastaveni LEDek) na 0

main:
leftOn:		sec
			ror R16
			out PORTB, R16			
			call delay
			cpi R16, 0b11111111
			brne leftOn

leftOff:	nop
			lsr R16
			out PORTB, R16			
			call delay
			cpi R16, 0b00000000
			brne leftOff

rightOn:	sec
			rol R16
			out PORTB, R16			
			call delay
			cpi R16, 0b11111111
			brne rightOn

rightOff:	nop
			lsl R16
			out PORTB, R16			
			call delay
			cpi R16, 0b00000000
			brne rightOff

			jmp main


delay:		ldi R17, 255
	
loop3:		ldi R18, 255
loop2:		ldi R19, 5
loop1:		dec R19
			brne loop1

			dec R18
			brne loop2

			dec R17
			brne loop3
ret

