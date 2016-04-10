;************************************************************************************************************
; * File Name   : bsp_led.s
; * Author      : Bryant
; * Date        : Feb-22-2016
; * Description : Led driver file
; *************************************************************************************************************
;Includes -----------------------------------------------------------------------------------------------------
                        INCLUDE stm32f746_hal.s
                                    
                        AREA    LED_PROC,CODE,READONLY

;/**************************************************************************************************************
; * Function Name   : bsp_LedInit
; * Description     : Configures LED on GPIO
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-23-2016
; * Call            : Outside
;****************************************************************************************************************/
bsp_LedInit             PROC
                        EXPORT bsp_LedInit
                        PUSH {LR}
                        
                        LDR R0,=RCC_AHB1ENR             ; Enable GPIOI port clock
                        LDR R1,[R0]
                        ORR R1,R1,#0x100
                        STR R1,[R0]
                        
                        LDR R0,=GPIOI_MODER             ; Config GPIOI_Pin1 as general purpose output mode
                        LDR R1,[R0]
                        ORR R1,R1,#0x04
                        STR R1,[R0]
                        
                        LDR R0,=GPIOI_OTYPER            ; Config GPIOI_Pin1 output push-pull(Led is connect with this pin)
                        LDR R1,[R0]
                        BIC R1,R1,#2
                        STR R1,[R0]
                        
                        LDR R0,=GPIOI_OSPEEDR            ; Config GPIOI_Pin1 in low speed
                        LDR R1,[R0]
                        BIC R1,R1,#0x0c
                        STR R1,[R0]
                        
                        
                        POP {PC}
                        ENDP

;/***************************************************************************************************************
; * Function Name   : bsp_LedOn
; * Description     : Turn on a specific led
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-24-2016
; * Call            : Outside
;****************************************************************************************************************/
bsp_LedOn               PROC
                        EXPORT bsp_LedOn
                        PUSH {LR}
                        
                        LDR R0,=GPIOI_ODR
                        LDR R1,[R0]
                        ORR R1,R1,#2
                        STR R1,[R0]
                        
                        POP {PC}
                        ENDP

;/***************************************************************************************************************
; * Function Name   : bsp_LedOff
; * Description     : Turn off a specific led
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-24-2016
; * Call            : Outside
;****************************************************************************************************************/
bsp_LedOff              PROC
                        EXPORT bsp_LedOff
                        PUSH {LR}
                        
                        LDR R0,=GPIOI_ODR
                        LDR R1,[R0]
                        AND R1,R1,#0xFD
                        STR R1,[R0]
                        
                        POP {PC}
                        ENDP

;/***************************************************************************************************************
; * Function Name   : bsp_LedToggle
; * Description     : Turn off a specific led
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-24-2016
; * Call            : Outside
;****************************************************************************************************************/
bsp_LedToggle           PROC
                        EXPORT bsp_LedToggle
                        PUSH {LR}
                        
                        LDR R0,=GPIOI_ODR
                        LDR R1,[R0]
                        
                        EOR R1,R1,#0x02
                        STR R1,[R0]
                        
                        POP {PC}
                        ENDP




                           ALIGN
;****************************************************************END OF FILE***********************************************************
                    
                            END