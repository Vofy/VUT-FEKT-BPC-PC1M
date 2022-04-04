.include "m128def.inc"

.MACRO SPinit
	LDI R16, Low(@0) 	// Ulo�� spodn� byte parametru do pracovn�ho registru R16
	OUT SPL, R16		// Ulo�� hodnotu z pracovn�ho registru do SFR SPL (Stack Pointer Low)
	LDI R16, High(@0)	// Ulo�� horn� byte parametru do pracovn�ho registru R16
	OUT SPH, R16		// Ulo�� hodnotu z pracovn�ho registru do SFR SPH (Stack Pointer High)
						/* D�vod pro� nastavujeme horn� a spodn� byte je ten, �e Stack Pointer pot�ebuje
						 * pro jeho nastaven� dva bajty a SFR ukl�d� pouze 1bajt
						 */
.ENDMACRO

.MACRO outm
	LDI @2, @1
	OUT @0, @2
.ENDMACRO
