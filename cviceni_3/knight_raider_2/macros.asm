.include "m128def.inc"

.MACRO SPInit

ldi R16, HIGH(RAMEND)
out SPH, R16
ldi R16, LOW(RAMEND)
out SPL, R16

.ENDMACRO
