.include "header.s"

.segment "VECTORS"
  ;; When an NMI happens (once per frame if enabled) the label nmi:
  .addr nmi
  ;; When the processor first turns on or is reset, it will jump to the label reset:
  .addr reset
  ;; External interrupt IRQ (unused)
  .addr 0


; "nes" linker config requires a STARTUP section, even if it's empty
.segment "STARTUP"


; adressing memory (declaring variables) 0x00-0xff, decimal: 0-255
.segment "ZEROPAGE"
buttons1: .res 1 ;joypad1 pressed buttons
buttons2: .res 1 ;joypad2 pressed buttons

player_x: .res 1
player_y: .res 1

player2_x: .res 1
player2_y: .res 1 ;06

ai1_x: .res 1 ;07
ai1_y: .res 1 ;08

player_front: .res 1 ;0 - up, 1 - right, 2 - down, 3 - left
player2_front: .res 1 ;10
ai1_front: .res 1 ;11

player_bullet_front: .res 1
player_bullet_exist: .res 1

player2_bullet_front: .res 1 ;14
player2_bullet_exist: .res 1

ai1_bullet_front: .res 1
ai1_bullet_exist: .res 1

ai1_random_direction: .res 1 ;0 - up, 1 - right, 2 - down, 3 - left

; Main code segement for the program
seed: .res 2       ; initialize 16-bit seed to any value except 0

OAMIndexOffset: .res 1 ;21

P1toAi1Collison: .res 1



.segment "CODE"  
.include "reset.s"





nmi: ;Non-Maskable Interrupt ;DMA copy
  ;.include "Flickering.s"
  LDX #$00 	; Set SPR-RAM address to 0 
  STX $2003 ; set the low byte (00) of the RAM address
  
;lda OAMIndexOffset
;sta OAMADDR
LDA #$02
  STA $4014 ; set the high byte (02) of the RAM address, start the transfer
  lda #0
;sta OAMADDR
;inc OAMIndexOffset 
;inc OAMIndexOffset 
;inc OAMIndexOffset 
;inc OAMIndexOffset 

;bullets movement, spawning bullets, boundaries
.include"BulletP1.s"
.include"BulletP2.s"
.include"BulletAI1.s"

  ;bulletTowallsCollison

  JSR ReadController1
  JSR ReadController1Loop
  JSR ReadController2
  JSR ReadController2Loop
  JSR GameLoop
 ; JSR UpdateSprites



RTI ;return from interrupt


ReadController1:
  LDA #$01
  STA $4016
  LDA #$00
  STA $4016
  LDX #$08
  RTS

ReadController1Loop:
  LDA $4016
  LSR A 
  ROL buttons1 ;what button got pressed 
  DEX
  BNE ReadController1Loop
  RTS
    
ReadController2:
  LDA #$01
  STA $4016
  LDA #$00
  STA $4016
  LDX #$08
ReadController2Loop:
  LDA $4017
  LSR A           
  ROL buttons2   
  DEX
  BNE ReadController2Loop
  RTS 

prng:
	ldy #8     ; iteration count (generates 8 bits)
	lda seed+0
:
	asl        ; shift the register
	rol seed+1
	bcc :+
	eor #$39   ; apply XOR feedback whenever a 1 bit is shifted out
:
	dey
	bne :--
	sta seed+0
	cmp #0     ; reload flags
	rts
	rts

OFFSET:


GameLoop:





.include "Shoot.s"
.include "P2Shoots.s"
.include "AI1Shoots.s"

;.include "P1ToAi1Collisons.s"
.include "TankMovement.s"
.include "Player2Movement.s"
.include "AI.s"

;    LDA player_bullet_exist
 ;   CMP $01
 ;   BNE NoBulletNoProblem

 ;bullet to tank 
.include "BulletToP1Collisons.s"
.include "BulletToP2Collisons.s"
    .include "BulletP1ToAi1Collisons.s"
    .include "BulletP2ToAi1Collisons.s"
      .include "BulletAi1ToP1Collisons.s"
      .include "BulletAi1ToP2Collisons.s"

; bullet to bullet
 .include "BulletAiToBulletP1.s"
 .include "BulletAiToBulletP2.s"
 .include "BulletP1ToBulletP2.s"
 
; tank to tank 
 ;.include "P1ToAi1Collisons.s"


; Offset all tiles 
; .include "OffsetingForward.s"

RTS


.include "assets.s"
.include "backgroundNametable.s" 

; Character memory

.segment "CHARS"
  .incbin "TankPAternTableJanuary23.chr"