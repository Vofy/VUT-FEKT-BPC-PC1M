.include "m128def.inc"
.ORG 000
          jmp zac
.ORG OC1Aaddr
          jmp timer
.ORG 0x100
zac:   ldi   R16, high(RAMEND)    // Inicializace SP
          out  SPH, R16
          ldi    R16, low(RAMEND)
          out  SPL, R16
          ldi    R16, 0x00                     // Konfigurace casovace 
          out  TCCR1A, R16
          ldi    R16, 0x09
          out  TCCR1B, R16
          ldi    R16, 0x6A
          out  OCR1AH, R16
          ldi    R16, 0x40
          out  OCR1AL, R16

          ldi    R16, 0x10
          out  TIMSK,  R16         // Povoleni preruseni casovace
          ldi    R17, 0x18
            
          sei 
loop: 
          jmp  loop

timer: inc R17
           reti 
