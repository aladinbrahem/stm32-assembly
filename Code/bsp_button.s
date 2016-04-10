;************************************************************************************************************
; * File Name   : bsp_led.s
; * Author      : Bryant
; * Date        : Feb-22-2016
; * Description : Led driver file
; *************************************************************************************************************
;Includes -----------------------------------------------------------------------------------------------------
                        INCLUDE stm32f746_hal.s
                                    
                        AREA    BUTTON,CODE,READONLY

;/**************************************************************************************************************
; * Function Name   : bsp_ButtonInit
; * Description     : Configures button on GPIO
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Mar-05-2016
; * Call            : Outside
;****************************************************************************************************************/
bsp_ButtonInit              PROC
                            EXPORT bsp_ButtonInit
                                
                            PUSH{LR}
                            
                            LDR R0,=RCC_AHB1ENR             ; Enable GPIOI port clock(User button is connect with this port)
                            LDR R1,[R0]
                            ORR R1,R1,#0x100
                            STR R1,[R0]
                            
                            LDR R0,=GPIOI_MODER             ; Config GPIOI_Pin1 as general purpose output mode
                            LDR R1,[R0]
                            ORR R1,R1,#0x04
                            STR R1,[R0]
                            
                            LDR R0,=GPIOI_OTYPER            ; Config GPIOI_Pin1 output push-pull
                            LDR R1,[R0]
                            BIC R1,R1,#2
                            STR R1,[R0]
                            
                            LDR R0,=GPIOI_OSPEEDR            ; Config GPIOI_Pin1 in low speed
                            LDR R1,[R0]
                            BIC R1,R1,#0x0c
                            STR R1,[R0]
                            
                            POP {PC}
    
                            ENDP




























                           ALIGN
;****************************************************************END OF FILE***********************************************************
                    
                            END
                                
                                