
    LDA $0224
    SBC #$04
    CMP $248 ;bullet ai1 y
    BCS NoCollisionAi1bulletTOP2
    CLC

    LDA $248 ;bullet ai1 y
    SBC #$04
    CMP $230
    BCS NoCollisionAi1bulletTOP2
    CLC

    LDA $0227
    SBC #$04
    CMP $24B ;bullet ai1 x
    BCS NoCollisionAi1bulletTOP2
    CLC

    LDA $24B ;bullet ai1 x
    SBC #$04
    CMP $0233
    BCS NoCollisionAi1bulletTOP2
    CLC

    ;delete bullet
    LDA #$00
    STA ai1_bullet_exist
    LDA #$F0
    STA $248 ;bullet ai1 y
    STA $24B ;bullet ai1 x

NoCollisionAi1bulletTOP2:
CLC


