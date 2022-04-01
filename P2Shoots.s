ShootBulletP2:
  LDA buttons2
  AND #TANK_SHOOT 
  CMP #TANK_SHOOT 
  BNE ShootBulletDoneP2 ;do not move tank if not equal 


  ;if player2's bullet exist don't creat new one 
    LDA #$00
    CMP player2_bullet_exist
    BNE ShootBulletDoneP2

    LDA player2_front
    STA player2_bullet_front


    ;set player2_bullet_exist to true
    LDA #$01
    STA player2_bullet_exist
  
  ;determin in what direction we are shooting 
  LDA player2_bullet_front
  CMP #$00
  BNE DoNotShootUpP2

  ;ShootUp
  ;get tank y coordinate and sbc 8 
  LDA $224
  SBC #$08 
  STA $234 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $227 
  ADC #$03 ;perfect
  STA $237

  ;get bullet tile from pallet table
  LDA #$20
  STA $235

  DoNotShootUpP2:
  ;determin in what direction we are shooting 
  LDA player2_bullet_front
  CMP #$01
  BNE DoNotShootRightP2

  ;shoot right
  ;get tank y coordinate and sbc 8 
  LDA $224
  ADC #$03
  STA $234 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $227 
  ADC #$10 ;perfect
  STA $237

  ;get bullet tile from pallet table
  LDA #$28
  STA $235

  DoNotShootRightP2:

  ;determin in what direction we are shooting 
  LDA player2_bullet_front
  CMP #$02
  BNE DoNotShootDownP2

  ;Shoot down
  ;get tank y coordinate and sbc 8 
  LDA $224
  ADC #$10
  STA $234 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $227 
  ADC #$04 
  STA $237

  ;get bullet tile from pallet table
  LDA #$2C
  STA $235

  DoNotShootDownP2:
  ;determin in what direction we are shooting 
  LDA player2_bullet_front
  CMP #$03
  BNE DoNotShootLeftP2

  ;Shoot left
  ;get tank y coordinate and sbc 8 
  LDA $224
  ADC #$03
  STA $234 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $227 
  SBC #$07 ;perfect
  STA $237

  ;get bullet tile from pallet table
  LDA #$24
  STA $235
DoNotShootLeftP2:

  ;choose pallet for bullet 
  LDA #$03
  STA $236

ShootBulletDoneP2: