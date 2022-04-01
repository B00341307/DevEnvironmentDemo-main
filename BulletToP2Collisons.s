

    LDA $0224
    SBC #$04
    CMP $0220
    BCS NoCollision
    CLC

    LDA $0220
    SBC #$04
    CMP $230
    BCS NoCollision
    CLC

    LDA $0227
    SBC #$04
    CMP $0223
    BCS NoCollision
    CLC

    LDA $0223
    SBC #$04
    CMP $0233
    BCS NoCollision
    CLC

   ;change color
      LDA #$02
      STA $0226
      STA $022A
      STA $022E
      STA $0232

    ;delete bullet
    LDA #$00
    STA player_bullet_exist
    LDA #$F0
    STA $0220
    STA $0223

NoCollision:
CLC


