
  LDA ai1_bullet_exist
  CMP #$01
  BNE BulletAiDoesNotExist

    ;boundaries bullet ai1
    LDA #RIGHTWALL
    CMP $24B 
    BCS DestroyBulletAi
    LDA #$00
    STA ai1_bullet_exist
    LDA #$F0
    STA $248
    STA $24B
     DestroyBulletAi:

     
    LDA  $24B
    CLC
    SBc #$04 
    CMP #LEFTWALL
    BCS DestroyBullet2Ai
    LDA #$00
    STA ai1_bullet_exist
    LDA #$F0
    STA $248
    STA $24B
    DestroyBullet2Ai:
    
    LDA  $248
    CMP #TOPWALL
    BCS DestroyBullet3Ai
    LDA #$00
    STA ai1_bullet_exist
    LDA #$F0
    STA $248
    STA $24B
    DestroyBullet3Ai:

    LDA #BOTTOMWALL
    CMP $248
    BCS DestroyBullet4Ai
    LDA #$00
    STA ai1_bullet_exist
    LDA #$F0
    STA $248
    STA $24B
    DestroyBullet4Ai:

;boundarie end
BulletAiDoesNotExist: 
  LDA ai1_bullet_exist
  CMP #$01
  BNE BulletAiDoesNotExist2

  LDA ai1_bullet_front
  CMP #$00
  BNE TryShootingDownAi

  LDA $248 ;bullets y coordinate 
  STA $248
  TAX 
  CLC
  DEX
  DEX
  STX $248
  TryShootingDownAi:

  LDA ai1_bullet_front
  CMP #$02
  BNE TryShootingRightAi
  LDA $248 ;bullets y coordinate 
  STA $248
  TAX 
  CLC
  INX
  INX
  STX $248
  TryShootingRightAi:

  LDA ai1_bullet_front
  CMP #$01
  BNE TryShootingLeftAi
  LDA $24B ;bullets x coordinate 
  STA $24B
  TAX 
  CLC
  INX
  INX
  STX $24B
  TryShootingLeftAi:

  LDA ai1_bullet_front
  CMP #$03
  BNE BulletAiDoesNotExist2
  LDA $24B ;bullets x coordinate 
  STA $24B
  TAX 
  CLC
  DEX
  DEX
  STX $24B
  BulletAiDoesNotExist2:

  