
    LDA $0234 ;bullet p2 y
    SBC #$02
    CMP $0220 ;bullet tank 1 y
    BCS NoCollisionbulletP1TObulletP2
    CLC

    LDA $0220 ;bullet tank 1 y
    SBC #$02
    CMP $0234 ;bullet p2 y
    BCS NoCollisionbulletP1TObulletP2
    CLC

    LDA $0237 ; bullet p2 x
    SBC #$02
    CMP $0223 ; bullet p1 x
    BCS NoCollisionbulletP1TObulletP2
    CLC

    LDA $0223 ; bullet p1 x
    SBC #$02
    CMP $0237 ; bullet p2 x
    BCS NoCollisionbulletP1TObulletP2
    CLC


    ;delete bullet
    LDA #$00
    STA player_bullet_exist
    STA player2_bullet_exist
    LDA #$F0
    STA $0220 ;bullet tank 1 y
    STA $0223 ; bullet p1 x
    STA $0234
    STA $0237


NoCollisionbulletP1TObulletP2:
CLC


