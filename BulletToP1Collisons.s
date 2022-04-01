
    LDA $200
    SBC #$04
    CMP $234
    BCS NoCollisionP1
    CLC

    LDA $234
    SBC #$04
    CMP $20C
    BCS NoCollisionP1
    CLC

    LDA $203
    SBC #$04
    CMP $237
    BCS NoCollisionP1
    CLC

    LDA $237
    SBC #$04
    CMP $20F
    BCS NoCollisionP1
    CLC


   ;change color
   ;   LDA #$02
   ;   STA $202
   ;   STA $0208
   ;   STA $020A
   ;   STA $020E

    ;delete bullet
    LDA #$00
    STA player2_bullet_exist
    LDA #$F0
    STA $234
    STA $237

NoCollisionP1:
CLC


