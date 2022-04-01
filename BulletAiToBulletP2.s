
    LDA $0234 ;bullet p2 y
    SBC #$02
    CMP $248 ;bullet ai1 y
    BCS NoCollisionbulletAi1TObulletP2
    CLC

    LDA $248 ;bullet ai1 y
    SBC #$02
    CMP $0234 ;bullet p2 y
    BCS NoCollisionbulletAi1TObulletP2
    CLC

    LDA $0237 ; bullet p2 x
    SBC #$02
    CMP $24B ;bullet ai1 x
    BCS NoCollisionbulletAi1TObulletP2
    CLC

    LDA $24B ;bullet ai1 x
    SBC #$02
    CMP $0237 ; bullet p2 x
    BCS NoCollisionbulletAi1TObulletP2
    CLC


    ;delete bullet
    LDA #$00
    STA ai1_bullet_exist
    STA player2_bullet_exist
    LDA #$F0
    STA $248 ;bullet ai1 y
    STA $24B ;bullet ai1 x
    STA $0234
    STA $0237


NoCollisionbulletAi1TObulletP2:
CLC


