ShootBullet:
  LDA buttons1
  AND #TANK_SHOOT 
  CMP #TANK_SHOOT 
  BNE ShootBulletDone ;do not move tank if not equal 


  ;if player's bullet exist don't creat new one 
    LDA #$00
    CMP player_bullet_exist
    BNE ShootBulletDone

    LDA player_front
    STA player_bullet_front


    ;set player_bullet_exist to true
    LDA #$01
    STA player_bullet_exist
  
  ;determin in what direction we are shooting 
  LDA player_bullet_front
  CMP #$00
  BNE DoNotShootUp

  ;ShootUp
  ;get tank y coordinate and sbc 8 
  LDA $0200
  SBC #$08 
  STA $0220 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $0203 
  ADC #$03 ;perfect
  STA $0223

  ;get bullet tile from pallet table
  LDA #$20
  STA $0221

  DoNotShootUp:
  ;determin in what direction we are shooting 
  LDA player_bullet_front
  CMP #$01
  BNE DoNotShootRight

  ;shoot right
  ;get tank y coordinate and sbc 8 
  LDA $0200
  ADC #$03
  STA $0220 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $0203 
  ADC #$10 ;perfect
  STA $0223

  ;get bullet tile from pallet table
  LDA #$28
  STA $0221

  DoNotShootRight:

  ;determin in what direction we are shooting 
  LDA player_bullet_front
  CMP #$02
  BNE DoNotShootDown

  ;Shoot down
  ;get tank y coordinate and sbc 8 
  LDA $0200
  ADC #$10
  STA $0220 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $0203 
  ADC #$04 
  STA $0223

  ;get bullet tile from pallet table
  LDA #$2C
  STA $0221

  DoNotShootDown:
  ;determin in what direction we are shooting 
  LDA player_bullet_front
  CMP #$03
  BNE DoNotShootLeft

  ;Shoot left
  ;get tank y coordinate and sbc 8 
  LDA $0200
  ADC #$03
  STA $0220 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $0203 
  SBC #$07 ;perfect
  STA $0223

  ;get bullet tile from pallet table
  LDA #$24
  STA $0221
DoNotShootLeft:

  ;choose pallet for bullet 
  LDA #$03
  STA $0222

ShootBulletDone: