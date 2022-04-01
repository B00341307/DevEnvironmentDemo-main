
;LDX OAMIndexOffset
LDY #$00
OAMIndexOffsetLoop:
LDA $201, y
ADC OAMIndexOffsetLoop
STA $201, y
INY
INY
INY
INY
CPY  #32
BNE OAMIndexOffsetLoop

INX 
INX 
INX 
INX 
STX OAMIndexOffset
