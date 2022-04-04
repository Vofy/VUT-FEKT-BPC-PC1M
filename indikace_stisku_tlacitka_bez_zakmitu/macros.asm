.include "m128def.inc"

.macro binaryFlip
	
	ldi R17,0b00000000
	ldi R18,8

smycka:
	ror R16
	rol R17
	dec R18
	brne smycka
.endmacro
