
    LDA $200 ;tank 1 far right y
    SBC #$04
    CMP $248 ;bullet ai1 y
    BCS NoCollisionAi1bulletTOP1
    CLC

    LDA $248 ;bullet ai1 y
    SBC #$04
    CMP $20C ; tank 1 far left y
    BCS NoCollisionAi1bulletTOP1
    CLC

    LDA $203
    SBC #$04
    CMP $24B ;bullet ai1 x
    BCS NoCollisionAi1bulletTOP1
    CLC

    LDA $24B ;bullet ai1 x
    SBC #$04
    CMP $20F ;tank 1 far right x
    BCS NoCollisionAi1bulletTOP1
    CLC

    ;delete bullet
    LDA #$00
    STA ai1_bullet_exist
    LDA #$F0
    STA $248 ;bullet ai1 y
    STA $24B ;bullet ai1 x

NoCollisionAi1bulletTOP1:
CLC


