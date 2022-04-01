  ;;P1 bullet:
  LDA player_bullet_exist
  CMP #$01
  BNE BulletDoesNotExist

    ;boundaries bullet p1
    LDA #RIGHTWALL 
    CLC
    ADC #$04
    CMP $0223
    BCS DestroyBullet
    LDA #$00
    STA player_bullet_exist
    LDA #$F0
    STA $0220
    STA $0223
    DestroyBullet:

    LDA  $0223
    CLC
    SBc #$04 
    CMP #LEFTWALL
    BCS DestroyBullet2
    LDA #$00
    STA player_bullet_exist
    LDA #$F0
    STA $0220
    STA $0223
    DestroyBullet2:
    
    LDA  $0220
    CMP #TOPWALL
    BCS DestroyBullet3
    LDA #$00
    STA player_bullet_exist
    LDA #$F0
    STA $0220
    STA $0223
    DestroyBullet3:

    LDA #BOTTOMWALL
    CMP $0220
    BCS DestroyBullet4
    LDA #$00
    STA player_bullet_exist
    LDA #$F0
    STA $0220
    STA $0223
    DestroyBullet4:

  
BulletDoesNotExist:
  LDA player_bullet_exist
  CMP #$01
  BNE BulletDoesNotExist2
;boundarie end

  LDA player_bullet_front
  CMP #$00
  BNE TryShootingDown

  LDA $0220 ;bullets y coordinate 
  STA $0220
  TAX 
  CLC
  DEX
  DEX
  STX $0220
  TryShootingDown:

  LDA player_bullet_front
  CMP #$02
  BNE TryShootingRight
  LDA $0220 ;bullets y coordinate 
  STA $0220
  TAX 
  CLC
  INX
  INX
  STX $0220
  TryShootingRight:

  LDA player_bullet_front
  CMP #$01
  BNE TryShootingLeft
  LDA $0223 ;bullets x coordinate 
  STA $0223
  TAX 
  CLC
  INX
  INX
  STX $0223
  TryShootingLeft:

  LDA player_bullet_front
  CMP #$03
  BNE BulletDoesNotExist2
  LDA $0223 ;bullets x coordinate 
  STA $0223
  TAX 
  CLC
  DEX
  DEX
  STX $0223
BulletDoesNotExist2:

  