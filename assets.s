tank: 
  .byte $D0, $00, $00, $50 ;y, tile 0, no of pallet!! ,x
  .byte $D0, $01, $00, $58 ;y = 8, 1, no of palette!!, x = 10
  .byte $D8, $10, $00, $50 ; tile 15
  .byte $D8, $11, $00, $58 ; tile 1

  .byte $D0, $02, $01, $50 
  .byte $D0, $03, $01, $58 
  .byte $D8, $12, $01, $50
  .byte $D8, $13, $01, $58  

  tank2: 
  .byte $D0, $40, $03, $90 ;y, tile 0, no of pallet!! ,x
  .byte $D0, $41, $03, $98 ;y = 8, 1, no of palette!!, x = 10
  .byte $D8, $50, $03, $90 ; tile 15
  .byte $D8, $51, $03, $98 ; tile 1

  tank3: 
  .byte $17, $66, $02, $A0 ;y, tile , att ,x
  .byte $17, $67, $02, $A8 
  .byte $1F, $76, $02, $A0
  .byte $1F, $77, $02, $A8 

    ai2: 
  .byte $D0, $66, $03, $A2 ;y, tile , att ,x
  .byte $D0, $67, $03, $AA 
  .byte $D8, $76, $03, $A2
  .byte $D8, $77, $03, $AA 

   ai3: 
  .byte $D0, $66, $00, $40 ;y, tile , att ,x
  .byte $D0, $67, $00, $48 
  .byte $D8, $76, $00, $40
  .byte $D8, $77, $00, $48 

palettes:
  ; Background Palette
  .byte $0f, $05, $26, $10 ; bricks; RED, ORANGE, GREY 
  .byte $10, $10, $10, $10 ;grey grey grey ; frame
  .byte $0f, $0f, $0f, $0f ; black black black
  .byte $10, $20, $3D, $2D ; white, light grey, dark grey

  ; Sprite Palette
  .byte $0f, $17, $28, $39 ; above tank
  .byte $0f, $27, $2B, $0f ; below tank
  .byte $0f, $05, $26, $10 ;bullet + bricks; RED, ORANGE, GREY 
  .byte $0f, $11, $21, $31 ; blue ; tank 2



 



 


