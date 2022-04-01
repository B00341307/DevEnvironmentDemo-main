.segment "HEADER"
 
  ; .byte "NES", $1A      ; iNES header identifier

  .byte $4E, $45, $53, $1A
  
  .byte 2               ; 2x 16KB PRG code
  .byte 1               ; 1x  8KB CHR data
  .byte $01, $00        ; mapper 0, vertical mirroring

  


;The PPU exposes eight memory-mapped registers to the CPU. 
;These nominally sit at $2000 through $2007 in the CPU's address space
; - Nes Dev Wiki
PPUCTRL     = $2000
PPUMASK     = $2001
PPUSTATUS   = $2002
OAMADDR     = $2003
OAMDATA     = $2004
PPUADDR     = $2006
PPUDATA     = $2007

APUIRQ      = $4010
OAMDMA      = $4014
JOYPAD1     = $4016

UP = %00001000
DOWN = %00000100
LEFT = %00000010
RIGHT = %00000001

.struct point_t
    x_pos  .byte
    y_pos  .byte
.endstruct


.scope EntityType
    NoEntity = 0
    PlayerType = 1
    Bullet = 2
    FlyBy = 3
.endscope

.struct Entity
    xpos .byte
    ypos .byte
    type .byte
.endstruct



TANK_UP = %00001000
TANK_DOWN = %00000100
TANK_LEFT = %00000010
TANK_RIGHT = %00000001
TANK_SHOOT = %10000000 ;A

.define PRESS_A        #%00000001
.define PRESS_B        #%00000010
.define PRESS_SELECT   #%00000100
.define PRESS_START    #%00001000
.define PRESS_UP       #%00010000
.define PRESS_DOWN     #%00100000
.define PRESS_LEFT     #%01000000
.define PRESS_RIGHT    #%10000000


RIGHTWALL      = $D4
TOPWALL        = $0C
BOTTOMWALL     = $D7
LEFTWALL       = $08


