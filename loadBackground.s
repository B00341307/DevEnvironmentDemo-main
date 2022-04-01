;.include "walls.s"
LoadBackground:
  LDA $2002             ; read PPU status to reset the high/low latch
  LDA #$20
  STA $2006             ; write the high byte of $2000 address
  LDA #$00
  STA $2006             ; write the low byte of $2000 address
  LDX #$00              ; start out at 0
LoadBackgroundLoop:
  LDA background, x     ; load data from address (background + the value in x)
  STA $2007             ; write to PPU
  INX                   ; X = X + 1
  CPX #$80              ; Compare X to hex $80, decimal 128 - copying 128 bytes
  BNE LoadBackgroundLoop  ; Branch to LoadBackgroundLoop if compare was Not Equal to zero
              
    LDX #$00                      ; if compare was equal to 128, keep going down
LoadBackgroundLoop2:
  LDA background2, x     
  STA $2007            
  INX                
  CPX #$80            
  BNE LoadBackgroundLoop2 

   LDX #$00                      
LoadBackgroundLoop3:
  LDA background3, x     
  STA $2007            
  INX                
  CPX #$80            
  BNE LoadBackgroundLoop3  

     LDX #$00                      
LoadBackgroundLoop4:
  LDA background4, x     
  STA $2007            
  INX                
  CPX #$80            
  BNE LoadBackgroundLoop4  

LDX #$00                      
LoadBackgroundLoop5:
  LDA background5, x     
  STA $2007            
  INX                
  CPX #$80            
  BNE LoadBackgroundLoop5  

  LDX #$00                      
LoadBackgroundLoop6:
  LDA background6, x     
  STA $2007            
  INX                
  CPX #$80            
  BNE LoadBackgroundLoop6  

    LDX #$00                      
LoadBackgroundLoop7:
  LDA background7, x     
  STA $2007            
  INX                
  CPX #$80            
  BNE LoadBackgroundLoop7  


      LDX #$00                      
LoadBackgroundLoop8:
  LDA background8, x     
  STA $2007            
  INX                
  CPX #$20            
  BNE LoadBackgroundLoop8


  ;;hello test \/
; fill video RAM with "Hello World" msg
;HelloVRAM: 
; set PPU address to name table A (row 1, col 1)
;	LDA $2021
 ; STA $2007
;	ldy #0		; set Y counter to 0

;loop:
	;lda asccii,y	; get next character
 ;       beq ENDME	; is 0? exit loop
;	sta $2007	; store+advance PPU
 ;       iny		; next character
;	bne loop	; loop
;ENDME:
     ;   rts		; return to caller



  ;;hello test /\
