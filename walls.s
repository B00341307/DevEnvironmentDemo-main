    
    LoadWalls:
    ;brick1  (up right)
    CLC
    LDA #$66 
    STA $0224

    
    LDA #$30
    STA $0225

    
    LDA #$02
    STA $0226

    
    LDA #$66 
    STA $0227
    

    ;brick2 (down right)
    
    LDA #$66 
    ADC #$04
    STA $0228

    CLC
    LDA #$31
    STA $0229

    
    LDA #$02
    STA $022A

    
    LDA #$66 
    STA $022B

    ;brick1 (down lleft)
    
    LDA #$66 
    ADC #$04
    STA $022C

    CLC
    LDA #$30
    STA $022D

    
    LDA #$02
    STA $022E

    
    LDA #$66 
    ADC #$04
    STA $022F
    
    ;brick2 (up left)    
    LDA #$66 
    STA $0244;230

    
    LDA #$31
    STA $0245;31

    
    LDA #$02
    STA $0246;32

    
    LDA #$66 
    ADC #$04
    STA $0247;33
    CLC


    ;brick2 (up left left)    
    LDA #$66 
    STA $0234

    
    LDA #$30
    STA $0235

    
    LDA #$02
    STA $0236

    
    LDA #$66 
    ADC #$08
    STA $0237
    CLC

    ;brick2 (down left left)    
    LDA #$66 
    ADC #$04
    STA $0238
    
    LDA #$31
    STA $0239
   
    LDA #$02
    STA $023A

    LDA #$66 
    ADC #$08
    STA $023B
    CLC

 ;brick2 (down down right)    
    LDA #$66 
    ADC #$08
    STA $023C
  
    LDA #$30
    STA $023D
   
    LDA #$02
    STA $023E

    LDA #$66 
    STA $023F

    ;brick2 (up left left ledt)    
    LDA #$66 
    STA $0240
    clc
    
    LDA #$31
    STA $0241
   
    LDA #$02
    STA $0242

    LDA #$66 
    ADC #$0C
    STA $0243
    CLC
    
 .include "wallsVS.s"


  


 ; //  brick1:
;//.byte $78, $30, $02, $78 

;//brick2:
;//.byte $08, $31, $02, $00 