.INCLUDE "m128def.inc"

.CSEG
.ORG 0x000
	jmp zac ; skok na start programu
.ORG 0x100
zac:ldi R16, HIGH(RAMEND) ; inicializace SP
	out SPH, R16
	ldi R16, LOW(RAMEND)
	out SPL, R16

	ldi r16,0xFF ; Nastaven� portu B jako v�stup
	out DDRB, r16

main: ; Hlavn� smy�ka programu
	jmp main
