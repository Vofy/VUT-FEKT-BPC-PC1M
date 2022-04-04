	.include "m128def.inc"
	.include "macros.asm"

	ldi R16, LOW(RAMEND)
	out SPL, R16
	ldi R16, HIGH(RAMEND)
	out SPH, R16

	ldi R16, 0b11111111
	out DDRB, R16

	ldi R16, 0b00000000
	out DDRC, R16

main:
	in R16, PINC
	com R16

	binaryFlip

	out PORTB, R17
	jmp main
