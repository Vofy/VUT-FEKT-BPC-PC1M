.include "m128def.inc"

.MACRO SPinit
	LDI R16, Low(@0) 	// Uloží spodní byte parametru do pracovního registru R16
	OUT SPL, R16		// Uloží hodnotu z pracovního registru do SFR SPL (Stack Pointer Low)
	LDI R16, High(@0)	// Uloží horní byte parametru do pracovního registru R16
	OUT SPH, R16		// Uloží hodnotu z pracovního registru do SFR SPH (Stack Pointer High)
						/* Dùvod proè nastavujeme horní a spodní byte je ten, že Stack Pointer potøebuje
						 * pro jeho nastavení dva bajty a SFR ukládá pouze 1bajt
						 */
.ENDMACRO

.MACRO outm
	LDI @2, @1
	OUT @0, @2
.ENDMACRO
