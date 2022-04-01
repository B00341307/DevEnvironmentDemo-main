
    LDA $0220 ;bullet tank 1 y
    SBC #$02
    CMP $248 ;bullet ai1 y
    BCS NoCollisionbulletAi1TObulletP1
    CLC

    LDA $248 ;bullet ai1 y
    SBC #$02
    CMP $220 ;;bullet tank 1 y
    BCS NoCollisionbulletAi1TObulletP1
    CLC

    LDA $0223 ; bullet p1 x
    SBC #$02
    CMP $24B ;bullet ai1 x
    BCS NoCollisionbulletAi1TObulletP1
    CLC

    LDA $24B ;bullet ai1 x
    SBC #$02
    CMP $0223
    BCS NoCollisionbulletAi1TObulletP1
    CLC

    ;delete bullet
    LDA #$00
    STA ai1_bullet_exist
    STA player_bullet_exist
    LDA #$F0
    STA $248 ;bullet ai1 y
    STA $24B ;bullet ai1 x
    STA $0220
    STA $0223


NoCollisionbulletAi1TObulletP1:
CLC


