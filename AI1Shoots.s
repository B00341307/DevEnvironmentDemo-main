ShootBulletAi:
  LDA ai1_bullet_exist
  CMP #$00
  BNE ShootBulletDoneAi ;do not move tank if not equal 


  ;if player2's bullet exist don't creat new one 
    LDA #$00
    CMP ai1_bullet_exist
    BNE ShootBulletDoneAi

    LDA ai1_front
    STA ai1_bullet_front


    ;set ai1_bullet_exist to true
    LDA #$01
    STA ai1_bullet_exist
  
  ;determin in what direction we are shooting 
  LDA ai1_bullet_front
  CMP #$00
  BNE DoNotShootUpAi

  ;ShootUp
  ;get tank y coordinate and sbc 8 
  LDA $238
  SBC #$08 
  STA $248 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $23B 
  ADC #$03 ;perfect
  STA $24B

  ;get bullet tile from pallet table
  LDA #$20
  STA $249

  DoNotShootUpAi:
  ;determin in what direction we are shooting 
  LDA ai1_bullet_front
  CMP #$01
  BNE DoNotShootRightAi

  ;shoot right
  ;get tank y coordinate and sbc 8 
  LDA $238
  ADC #$03
  STA $248 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $23B 
  ADC #$10 ;perfect
  STA $24B

  ;get bullet tile from pallet table
  LDA #$28
  STA $249

  DoNotShootRightAi:

  ;determin in what direction we are shooting 
  LDA ai1_bullet_front
  CMP #$02
  BNE DoNotShootDownAi

  ;Shoot down
  ;get tank y coordinate and sbc 8 
  LDA $238
  ADC #$10
  STA $248 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $23B 
  ADC #$04 
  STA $24B

  ;get bullet tile from pallet table
  LDA #$2C
  STA $249

  DoNotShootDownAi:
  ;determin in what direction we are shooting 
  LDA ai1_bullet_front
  CMP #$03
  BNE DoNotShootLeftAi

  ;Shoot left
  ;get tank y coordinate and sbc 8 
  LDA $238
  ADC #$03
  STA $248 ;store it as bullets y coordinate 

  ;do the same but with x 
  LDA $23B 
  SBC #$07 ;perfect
  STA $24B

  ;get bullet tile from pallet table
  LDA #$24
  STA $249
DoNotShootLeftAi:

  ;choose pallet for bullet 
  LDA #$03
  STA $24A

ShootBulletDoneAi: