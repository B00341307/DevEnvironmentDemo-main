
;;;;;;;;;;;;;;;;;;

MoveTank3Up:
 ;0 - up, 1 - right, 2 - down, 3 - left
  LDA seed
  CMP #$C0
  bcc MoveTank3UpDone ;do not move tank if not equal 

  ;rotate
  LDA #$60
  STA $239
  LDA #$70
  STA $241

  LDA #$61
  STA $23D 
  LDA #$71
  STA $245

;boundaries
   LDA $238 ;y coordinate of top left sprite of Tank
   SEC
   SBC #$04
   CMP #TOPWALL
   BCC MoveTank3UpWall

  LDA ai1_bullet_exist
  CMP #$00
  BNE Ignore111
  ;set front
  LDA #$00
  STA ai1_bullet_front
  Ignore111:
  LDA #$00
  STA ai1_front

;move
  LDA ai1_y 
  STA $0238
  STA $23C
  TAX
  CLC
  ADC #$08
  STA $240
  STA $244
  DEX
  STX ai1_y



  MoveTank3UpWall:
   LDA $238 ;y coordinate of top left sprite of Tank
   SEC
   SBC #$04
   CMP #TOPWALL
   BCS MoveTank3UpDone
   JSR prng

   MoveTank3UpDone:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MoveTank3Down:
 ;0 - up, 1 - right, 2 - down, 3 - left
  LDA seed
  CMP #$C0
  bcs Movetank3DownDone
  LDA seed
  CMP #$80
  bcc Movetank3DownDone

 ;rotate
  LDA #$66
  STA $239 
  LDA #$76
  STA $241

  LDA #$67
  STA $23D
  LDA #$77
  STA $245

;boundaries
    LDA $240
    CLC
    CMP #BOTTOMWALL
    BCS Movetank3DownWall

  LDA ai1_bullet_exist
  CMP #$00
  BNE Ignore222
  ;set front
  LDA #$02
  STA ai1_bullet_front
  Ignore222:
  LDA #$02
  STA ai1_front

 ;move
  LDA ai1_y 
  STA $238
  STA $23C
  TAX
  CLC
  ADC #$08
  STA $240
  STA $244
  INX
  STX ai1_y




  Movetank3DownWall:  
    LDA $240
    CLC
    CMP #BOTTOMWALL
   BCC Movetank3DownDone
   JSR prng

Movetank3DownDone:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MoveTank3Left:
 ;0 - up, 1 - right, 2 - down, 3 - left
  LDA seed
  CMP #$80
  bcs MoveTank3LeftDone
  LDA seed
  CMP #$40
  BCC MoveTank3LeftDone

  ;rotate
  LDA #$62
  STA $239 
  LDA #$72
  STA $241

  LDA #$63
  STA $23D
  LDA #$73
  STA $245

    ;boundaries
    LDA $23F
    CLC
    SBC #$10
    CMP #LEFTWALL
    BCC MoveTank3LeftWall

  LDA ai1_bullet_exist
  CMP #$00
  BNE Ignore333
  ;set front
  LDA #$03
  STA ai1_bullet_front
  Ignore333:
    LDA #$03
  STA ai1_front

  ;move
  LDA ai1_x
  STA $23B
  STA $243
  TAX
  CLC
  ADC #$08
  STA $23F
  STA $247
  DEX
  STX ai1_x

MoveTank3LeftWall:
    ;boundaries
    LDA $23F
    CLC
    SBC #$10
    CMP #LEFTWALL
    BCS MoveTank3LeftDone
    jsr prng

MoveTank3LeftDone:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MoveTank3Right:
 ;0 - up, 1 - right, 2 - down, 3 - left
  LDA seed
  CMP #$40
  BCS MoveTank3RightDone

 ;rotate
  LDA #$64
  STA $239 
  LDA #$74
  STA $241

  LDA #$65
  STA $23D
  LDA #$75
  STA $245
  
    ;boundries 
    LDA $23B
    CLC
    ADC #$04
    CMP #RIGHTWALL
    BCS MoveTank3RightWAll

  LDA ai1_bullet_exist
  CMP #$00
  BNE Ignore444
  ;set front
  LDA #$01
  STA ai1_bullet_front
  Ignore444:
  LDA #$01
  STA ai1_front
;move
  LDA ai1_x ; store player2_x ONLY in $23B and $243 
  STA $23B
  STA $243
  TAX
  CLC
  ADC #$08
  STA $23F
  STA $247
  INX
  STX ai1_x



MoveTank3RightWAll:
    ;boundaries
    LDA $23B
    CLC
    ADC #$04
    CMP #RIGHTWALL
    BCC MoveTank3RightDone
    jsr prng
MoveTank3RightDone: