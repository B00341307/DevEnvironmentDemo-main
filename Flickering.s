

LDX #$00
LDY #$FC
FlickeringLoop:
    LDA $201, X ; low OAM adress memeory + x 
    STA $201, y ; high OAM adress 
    INX
     INX
      INX
       INX
    INY
     INY
      INY
       INY
    CPX #$40 ;or 87? 
    BCS FlickeringLoop
LDX #$00
LDY #$FC
LDA #$00
     

