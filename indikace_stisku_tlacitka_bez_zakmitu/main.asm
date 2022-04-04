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

ldi R20, 0

main:
	in R16, PINC

	call loop

	sbic PINC, 7
	jmp next
	call increment

next:
	sbic PINC, 0
	jmp print
	call decrement

print:
	out PORTB, R20
	jmp main



; PODPROGRAMY

increment:
	inc R20
	ret

decrement:
	;brnz a cp - osetreni preteceni
	dec R20
	ret

loop:
	push R17
	push R18
	push R19

	ldi R17, 255

	loop3:
		ldi R18, 255
	loop2:
		ldi R19, 20
	loop1:
		dec R19
		brne loop1

		dec R18
		brne loop2

		dec R17
		brne loop3

	pop R19
	pop R18
	pop R17

	ret
