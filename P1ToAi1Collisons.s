    
  LDA #$00
STA P1toAi1Collison

    LDA $0224 ;ai y
    SBC #$06
    CMP $0200 ;tank 1 y left
    BCS NoCollisionP1toA11
    CLC

    LDA $020C ;tank 1 y left
    SBC #$04
    CMP $230 ;ai y
    BCS NoCollisionP1toA11
    CLC

    LDA $0227 ;ai1 x
    SBC #$04
    CMP $0203 ; p1 x
    BCS NoCollisionP1toA11
    CLC

    LDA $020F ; p1 x
    SBC #$04
    CMP $0233 ;ai1 x
    BCS NoCollisionP1toA11
    CLC

LDA #$01
STA P1toAi1Collison

NoCollisionP1toA11:


