MoveTankUp:
 ;check if correct button was pressed 
  LDA buttons1 ;variable that stores signal from controller 
  AND #TANK_UP ;constant that stores %00010000
  CMP #TANK_UP ;compare buttons1 to #Tank_up  
  BNE MoveTankUpDone ;do not move tank if not equal 

   ;rotate
  LDA #$00
  STA $0201 
  LDA #$10
  STA $0209

  LDA #$01
  STA $0205
  LDA #$11
  STA $020D

  LDA #$02
  STA $0211 
  LDA #$12
  STA $0219

  LDA #$03
  STA $0215
  LDA #$13
  STA $021D

;boundaries
   LDA $0200 ;y coordinate of top left sprite of Tank
   SEC
   SBC #$04
   CMP #TOPWALL
   BCC MoveTankUpDone


  ;shooting
  LDA player_bullet_exist
  CMP #$00
  BNE Ignore1
  ;set front
  LDA #$00
  STA player_bullet_front
  Ignore1:
  LDA #$00
  STA player_front

;COLLISON WITH TANKS 
CLC 
LDA #$01
CMP P1toAi1Collison
BEQ MoveTankUpDone

;move
  LDA player_y 
  STA $0200
  STA $0204
  STA $0210
  STA $0214
  TAX
  CLC
  ADC #$08
  STA $0208
  STA $020C
  STA $0218
  STA $021C
  DEX
  STX player_y



MoveTankUpDone:

MoveTankDown:
 ;check if correct button was pressed 
    LDA buttons1    
    AND #TANK_DOWN
    CMP #TANK_DOWN
    BNE MovetankDownDone

 ;rotate
  LDA #$0C
  STA $0201 
  LDA #$1C
  STA $0209

  LDA #$0D
  STA $0205
  LDA #$1D
  STA $020D

  LDA #$0E
  STA $0211 
  LDA #$1E
  STA $0219

  LDA #$0F
  STA $0215
  LDA #$1F
  STA $021D

;boundaries
    LDA $0208
    CLC
    CMP #BOTTOMWALL
    BCS MovetankDownDone

  LDA player_bullet_exist
  CMP #$00
  BNE Ignore2
  ;set front
  LDA #$02
  STA player_bullet_front
  Ignore2:
  LDA #$02
  STA player_front

;COLLISON WITH TANKS 
CLC 
LDA #$01
CMP P1toAi1Collison
BEQ MovetankDownDone

 ;move
  LDA player_y 
  STA $0200
  STA $0204
  STA $0210
  STA $0214
  TAX
  CLC
  ADC #$08
  STA $0208
  STA $020C
  STA $0218
  STA $021C
  INX
  STX player_y



MovetankDownDone:

MoveTankLeft:
    ;check if correct button was pressed 
    LDA buttons1
    AND #TANK_LEFT
    CMP #TANK_LEFT
    BNE MoveTankLeftDone

  ;rotate
  LDA #$04
  STA $0201 
  LDA #$14
  STA $0209

  LDA #$05
  STA $0205
  LDA #$15
  STA $020D

  LDA #$06
  STA $0211 
  LDA #$16
  STA $0219

  LDA #$07
  STA $0215
  LDA #$17
  STA $021D

    ;boundaries
    LDA $0207
    CLC
    SBC #$10
    CMP #LEFTWALL
    BCC MoveTankLeftDone

  LDA player_bullet_exist
  CMP #$00
  BNE Ignore3
  ;set front
  LDA #$03
  STA player_bullet_front
  Ignore3:
    LDA #$03
  STA player_front

;COLLISON WITH TANKS 
CLC 
LDA #$01
CMP P1toAi1Collison
BEQ MoveTankLeftDone

  ;move
  LDA player_x
  STA $0203
  STA $020B
  STA $0213
  STA $021B
  TAX
  CLC
  ADC #$08
  STA $0207
  STA $020F
  STA $0217
  STA $021F
  DEX
  STX player_x



MoveTankLeftDone:



MoveTankRight:
    LDA buttons1
    AND #TANK_RIGHT
    CMP #TANK_RIGHT
    BNE MoveTankRightDone
  
 ;rotate
  LDA #$08
  STA $0201 
  LDA #$18
  STA $0209

  LDA #$09
  STA $0205
  LDA #$19
  STA $020D

  LDA #$0A
  STA $0211 
  LDA #$1A
  STA $0219

  LDA #$0B
  STA $0215
  LDA #$1B
  STA $021D

    ;boundries 
    LDA $0203
    CLC
    ADC #$04
    CMP #RIGHTWALL
    BCS MoveTankRightDone

  LDA player_bullet_exist
  CMP #$00
  BNE Ignore4
  ;set front
  LDA #$01
  STA player_bullet_front
  Ignore4:
  LDA #$01
  STA player_front

  ;COLLISON WITH TANKS 
CLC 
LDA #$01
CMP P1toAi1Collison
BEQ MoveTankRightDone

;move
  LDA player_x ; store player_x ONLY in $0203 and $020B 
  STA $0203
  STA $020B
  STA $0213
  STA $021B
  ;And since it's the main value to work with,
; we need to make a copy of this value to the X register by using the command TAX 
;(Transfer A to X, but actually it's making a copy).
  TAX
  CLC
; Then we are going to add 8, and store into $0207 and $020F.
  ADC #$08
  STA $0207
  STA $020F
  STA $0217
  STA $021F
  INX
  STX player_x
;Now to work with the X register by incrementing it with INX, and store the new value into player_x. 
;When you loop it, it moves the entire sprite group across the screen over and over and over since in 6502 assembly,
; it loops byte values from $00 to $FF over and over.
; https://www.vbforums.com/showthread.php?858773-NES-6502-Programming-Tutorial-Part-4-Sprite-Movement-And-Declaring-Variables


  
MoveTankRightDone: