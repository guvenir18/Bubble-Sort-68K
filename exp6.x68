START:      ORG    $2000
            ;; part 1 starts here
            MOVE.B #0, D2       ; i = 0
            LEA SPACE, A1
            LEA ARR, A2         ; load start address of array
LOOP_PRINT  MOVE.B (A2)+, D1    ; D1 = ARR[i] then increment address    
            MOVE.B #3, D0       ; trap code for
            TRAP #15            ; printing integer at D1.L
            MOVE.B #14, D0      ; trap code for
            TRAP #15            ; printing a space
            ADDI.B #1, D2       ; i++
            CMP #8, D2          ; compare i with 8 ( Change if array size changes, D2 = size)
            BNE     LOOP_PRINT  ; branch if i != 8
            ;; part 1 ends here            
            
            ;; part 2 starts here
BUBBLE_EXC  LEA ARR, A2
            MOVE.B #0, D3       ; loop index
            MOVE.B #0, D4       ; # of swaps
BUBBLE      MOVE.B (A2)+, D1    ; arr[i]
            MOVE.B (A2), D2     ; arr[i+1]
            CMP D2, D1          ; compare 
            BLT BUBBLE_2        ; if arr[i] < arr[i+1] then branch to BUBBLE_2
SWAP        MOVE.B D2, -(A2)    ; swap numbers.    
            ADDA #1, A2
            MOVE.B D1, (A2)
            ADDI.B #1, D4       ; swaps++       
BUBBLE_2    ADDI.B #1, D3       ; index++
            CMP #7, D3          ; Change this according to array size. ( D3 = size - 1)
            BNE BUBBLE          
            CMP #0, D4          ; Check # of swaps
            BNE BUBBLE_EXC      ; If no swaps have been made finish sorting               
            ;; part2 ends here
            
            MOVE.B #13, D0      
            TRAP #15            
            
            ;; print sorted array
            MOVE.B #0, D2       ; i = 0
            LEA SPACE, A1
            LEA ARR, A2         ; load start address of array
LOOP_PRINT2 MOVE.B (A2)+, D1    ; D1 = ARR[i] then increment address    
            MOVE.B #3, D0       ; trap code for
            TRAP #15            ; printing integer at D1.L
            MOVE.B #14, D0      ; trap code for
            TRAP #15            ; printing a space
            ADDI.B #1, D2       ; i++
            CMP #8, D2          ; compare i with 8 ( Change if array size changes, D2 = size)
            BNE     LOOP_PRINT2  ; branch if i != 8
            
            MOVE.B  #9, D0
            TRAP #15
            
; Note: Current array size is 8. If it is changed, change #7 at line 36 to Size - 1 and 54, 18 to size.
SPACE       DC.B ' ',0
ARR         DC.B $23, $42, $54, $44, $33, $90, $86, $49
            END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
