
  LDA player2_bullet_exist
  CMP #$01
  BNE BulletP2DoesNotExist

    ;boundaries bullet p1
    LDA #RIGHTWALL
    CMP $237 
    BCS DestroyBulletP2
    LDA #$00
    STA player2_bullet_exist
    LDA #$F0
    STA $234
    STA $237
     DestroyBulletP2:

     
    LDA  $237
    CLC
    SBc #$04 
    CMP #LEFTWALL
    BCS DestroyBullet2P2
    LDA #$00
    STA player2_bullet_exist
    LDA #$F0
    STA $234
    STA $237
    DestroyBullet2P2:
    
    LDA  $234
    CMP #TOPWALL
    BCS DestroyBullet3P2
    LDA #$00
    STA player2_bullet_exist
    LDA #$F0
    STA $234
    STA $237
    DestroyBullet3P2:

    LDA #BOTTOMWALL
    CMP $234
    BCS DestroyBullet4P2
    LDA #$00
    STA player2_bullet_exist
    LDA #$F0
    STA $234
    STA $237
    DestroyBullet4P2:

;boundarie end
BulletP2DoesNotExist: 
  LDA player2_bullet_exist
  CMP #$01
  BNE BulletP2DoesNotExist2

  LDA player2_bullet_front
  CMP #$00
  BNE TryShootingDownP2

  LDA $234 ;bullets y coordinate 
  STA $234
  TAX 
  CLC
  DEX
  DEX
  STX $234
  TryShootingDownP2:

  LDA player2_bullet_front
  CMP #$02
  BNE TryShootingRightP2
  LDA $234 ;bullets y coordinate 
  STA $234
  TAX 
  CLC
  INX
  INX
  STX $234
  TryShootingRightP2:

  LDA player2_bullet_front
  CMP #$01
  BNE TryShootingLeftP2
  LDA $237 ;bullets x coordinate 
  STA $237
  TAX 
  CLC
  INX
  INX
  STX $237
  TryShootingLeftP2:

  LDA player2_bullet_front
  CMP #$03
  BNE BulletP2DoesNotExist2
  LDA $237 ;bullets x coordinate 
  STA $237
  TAX 
  CLC
  DEX
  DEX
  STX $237
  BulletP2DoesNotExist2:

  