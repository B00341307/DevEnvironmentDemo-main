MoveTank2Up:
 ;check if correct button was pressed 
  LDA buttons2 ;variable that stores signal from controller 
  AND #TANK_UP ;constant that stores %00010000
  CMP #TANK_UP ;compare buttons1 to #Tank_up  
  BNE MoveTank2UpDone ;do not move tank if not equal 

  ;rotate
  LDA #$40
  STA $0225
  LDA #$50
  STA $022D

  LDA #$41
  STA $0229 
  LDA #$51
  STA $0231

;boundaries
   LDA $224 ;y coordinate of top left sprite of Tank
   SEC
   SBC #$04
   CMP #TOPWALL
   BCC MoveTank2UpDone

  LDA player_bullet_exist
  CMP #$00
  BNE Ignore11
  ;set front
  LDA #$00
  STA player_bullet_front
  Ignore11:
  LDA #$00
  STA player2_front

;move
  LDA player2_y 
  STA $0224
  STA $0228
  TAX
  CLC
  ADC #$08
  STA $022C
  STA $0230
  DEX
  STX player2_y



MoveTank2UpDone:

MoveTank2Down:
 ;check if correct button was pressed 
    LDA buttons2    
    AND #TANK_DOWN
    CMP #TANK_DOWN
    BNE Movetank2DownDone

 ;rotate
  LDA #$46
  STA $225 
  LDA #$56
  STA $22D

  LDA #$47
  STA $229
  LDA #$57
  STA $231

;boundaries
    LDA $022C
    CLC
    CMP #BOTTOMWALL
    BCS Movetank2DownDone

  LDA player_bullet_exist
  CMP #$00
  BNE Ignore22
  ;set front
  LDA #$02
  STA player_bullet_front
  Ignore22:
  LDA #$02
  STA player2_front

 ;move
  LDA player2_y 
  STA $224
  STA $0228
  TAX
  CLC
  ADC #$08
  STA $022C
  STA $0230
  INX
  STX player2_y



Movetank2DownDone:

MoveTank2Left:
    ;check if correct button was pressed 
    LDA buttons2
    AND #TANK_LEFT
    CMP #TANK_LEFT
    BNE MoveTank2LeftDone

  ;rotate
  LDA #$42
  STA $225 
  LDA #$52
  STA $22D

  LDA #$43
  STA $229
  LDA #$53
  STA $231

    ;boundaries
    LDA $22B
    CLC
    SBC #$10
    CMP #LEFTWALL
    BCC MoveTank2LeftDone

  LDA player_bullet_exist
  CMP #$00
  BNE Ignore33
  ;set front
  LDA #$03
  STA player_bullet_front
  Ignore33:
    LDA #$03
  STA player2_front

  ;move
  LDA player2_x
  STA $227
  STA $22F
  TAX
  CLC
  ADC #$08
  STA $22B
  STA $233
  DEX
  STX player2_x



MoveTank2LeftDone:



MoveTank2Right:
    LDA buttons2
    AND #TANK_RIGHT
    CMP #TANK_RIGHT
    BNE MoveTank2RightDone


 ;rotate
  LDA #$44
  STA $225 
  LDA #$54
  STA $22D

  LDA #$45
  STA $229
  LDA #$55
  STA $231

    ;boundries 
    LDA $227
    CLC
    ADC #$04
    CMP #RIGHTWALL
    BCS MoveTank2RightDone

  LDA player_bullet_exist
  CMP #$00
  BNE Ignore44
  ;set front
  LDA #$01
  STA player_bullet_front
  Ignore44:
  LDA #$01
  STA player2_front
;move
  LDA player2_x ; store player2_x ONLY in $227 and $22F 
  STA $227
  STA $22F
  ;And since it's the main value to work with,
; we need to make a copy of this value to the X register by using the command TAX 
;(Transfer A to X, but actually it's making a copy).
  TAX
  CLC
; Then we are going to add 8, and store into $22B and $233.
  ADC #$08
  STA $22B
  STA $233
  INX
  STX player2_x
  
;Now to work with the X register by incrementing it with INX, and store the new value into player2_x. 
;When you loop it, it moves the entire sprite group across the screen over and over and over since in 6502 assembly,
; it loops byte values from $00 to $FF over and over.
; https://www.vbforums.com/showthread.php?858773-NES-6502-Programming-Tutorial-Part-4-Sprite-Movement-And-Declaring-Variables


MoveTank2RightDone: