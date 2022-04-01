
    LDA $0238
    SBC #$04
    CMP $234
    BCS NoCollisionP2toAI1
    CLC

    LDA $234
    SBC #$04
    CMP $244
    BCS NoCollisionP2toAI1
    CLC

    LDA $023B
    SBC #$04
    CMP $237
    BCS NoCollisionP2toAI1
    CLC

    LDA $237
    SBC #$04
    CMP $0247
    BCS NoCollisionP2toAI1
    CLC

    ;delete bullet
    LDA #$00
    STA player2_bullet_exist
    LDA #$F0
    STA $234
    STA $237

NoCollisionP2toAI1:
CLC


