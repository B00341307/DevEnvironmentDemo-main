reset:
    SEI ; disable IRQs
    CLD ; disable decimal mode

    LDX #$40
    STX $4017 ; disable APU frame IRQ

    LDX #$FF
    TXS
    INX

    STX PPUCTRL ; disable NMI
    STX PPUMASK ; disable rendering
    STX APUIRQ  ; disable DMC IRQs

;; first wait for vblank to make sure PPU is ready
vblankwait1:
  bit $2002
  bpl vblankwait1

    TXA

clear_memory: ;;initializing the full 2k of memory
  lda #$00
  sta $0000, x
  sta $0100, x
  sta $0200, x
  sta $0300, x
  sta $0400, x
  sta $0500, x
  sta $0600, x
  sta $0700, x
  inx
  bne clear_memory ;;loop

;; second wait for vblank, PPU is ready after this
vblankwait2:
  bit $2002
  bpl vblankwait2

    LDA #$02
    STA $4014
    NOP

    ; $3F00
    LDA #$3F
    STA $2006
    LDA #$00
    STA $2006

    LDX #$00



LoadPalettes:
    LDA palettes, X
    STA $2007 
    INX
    CPX #$20
    BNE LoadPalettes

    LDX #$00


LoadTank:
    LDA tank, X ; load data from address (tank +  x)
    STA $0200, X ;tankSprite, X   
    INX
    CPX #$20  ;hex 20 = dec 32, hex 10 = dec 16
    BNE LoadTank
    LDX #$00

  ;  $D0, $00, $00, $50 





LoadTank2:
    LDA tank2, X ; load data from address (tank +  x)
    ;STA tankSprite, X
    STA $0224, X
    INX
    CPX #$10  ;hex 20 = dec 32, hex 10 = dec 16
    BNE LoadTank2
    LDX #$00

    LoadTank3:
    LDA tank3, X ; load data from address (tank +  x)
    ;STA tankSprite, X
    STA $0238, X
    INX
    CPX #$10  ;hex 20 = dec 32, hex 10 = dec 16
    BNE LoadTank3
    LDX #$00

    LoadAI2:
    LDA ai2, X ; load data from address (tank +  x)
    ;STA tankSprite, X
    STA $024C, X
    INX
    CPX #$10  ;hex 20 = dec 32, hex 10 = dec 16
    BNE LoadAI2
    LDX #$00

        LoadAI3:
    LDA ai3, X ; load data from address (tank +  x)
    ;STA tankSprite, X
    STA $0260, X
    INX
    CPX #$10  ;hex 20 = dec 32, hex 10 = dec 16
    BNE LoadAI3
    LDX #$00


.include"loadBackground.s"


LoadAttribute:
  LDA $2002             ; read PPU status to reset the high/low latch
  LDA #$23
  STA $2006             ; write the high byte of $23C0 address
  LDA #$C0
  STA $2006             ; write the low byte of $23C0 address
  LDX #$00              ; start out at 0
LoadAttributeLoop:
  LDA attribute, x      ; load data from address (attribute + the value in x)
  STA $2007             ; write to PPU
  INX                   ; X = X + 1
  CPX #$80              ; Compare X to hex $08, decimal 8 - copying 8 bytes
  BNE LoadAttributeLoop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA $24C
    LDX $260
    STA $260
    STX $24C

    LDA $24D
    LDX $261
    STA $261
    STX $24D

    LDA $24E
    LDX $262
    STA $262
    STX $24E

    LDA $24F
    LDX $263
    STA $263
    STX $24F
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 CLI ;enable interapts

 enable_rendering:
  LDA #%10010000 ; enable sprites, enable background
  STA PPUCTRL
  lda #%00011110 	; Enable Sprites
  sta PPUMASK

;And to tell the PPU that we are not doing any scrolling at the end of NMI:
  LDA #$00
STA $2005
STA $2005


;Initializning zero pages variabkes
  lda $0203
  sta player_x
  lda $0200
  sta player_y

  lda $0227
  sta player2_x
  lda $0224
  sta player2_y

  lda $023B
  sta ai1_x
  lda $0238
  sta ai1_y

  lda #$00
  sta player_front
  STA player_bullet_exist
  sta player2_front
  STA player2_bullet_exist
  sta ai1_bullet_exist
  sta ai1_bullet_front
  

  lda #$02
  STA ai1_front

 lda #$CB
  STA seed


;0 - up, 1 - right, 2 - down, 3 - left
LDA #$02
STA ai1_random_direction
;jsr prng

LDA #$00
STA OAMIndexOffset
STA P1toAi1Collison


  
    
Loop:
    JMP Loop


