    
    LDA $0238 ;ai1 y
    SBC #$04
    CMP $0220 ;bullet y
    BCS NoCollisionP1toAi1
    CLC

    LDA $0220 ;bullet y
    SBC #$04
    CMP $244
    BCS NoCollisionP1toAi1
    CLC

    LDA $023B
    SBC #$04
    CMP $0223
    BCS NoCollisionP1toAi1
    CLC

    LDA $0223
    SBC #$04
    CMP $0247
    BCS NoCollisionP1toAi1
    CLC

    ;delete bullet
    LDA #$00
    STA player_bullet_exist
    LDA #$F0
    STA $0220
    STA $0223

NoCollisionP1toAi1:
CLC


