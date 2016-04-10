;***************************************************************************************************************
; * File Name   : bsp_timer.s
; * Author      : Bryant
; * Date        : Mar-24-2016
; * Description : Timer driver file
;***************************************************************************************************************
;Includes ------------------------------------------------------------------------------------------------------
                        INCLUDE stm32f746_hal.s
                        AREA PARAMETER,DATA, READWRITE
g_timerFlag             DCB 0  
                        EXPORT g_timerFlag
g_timerCounter          DCB 0
                        AREA TIEMR_PROC, CODE, READONLY


;/**************************************************************************************************************
; * Function Name   : bsp_TimerInit
; * Description     : Configures LED on GPIO
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Mar-27-2016
; * Call            : Outside
;****************************************************************************************************************/
bsp_TimerInit          PROC
                       EXPORT bsp_TimerInit
                       PUSH {LR}    
                       
                       LDR R0,=g_timerCounter
                       MOV R1,#0
                       STR R1,[R0]
                       
                       LDR R0,=g_timerFlag
                       MOV R1,#0
                       STR R1,[R0]
                       
                       LDR R0,=RCC_APB1ENR                  ; Enable TIM3 clock
                       LDR R1,[R0]
                       ORR R1,R1,#0x02
                       STR R1,[R0]
                       
                       LDR R0,=TIM3_IRQn                    ; Enable TIM3 interrupt
                       LDR R1,=NVIC_ISER0
                       LDR R2,[R1]
                       MOV R3,#1
                       LSL R3,R3,R0
                       ORR R2,R2,R3
                       STR R2,[R1]
                       
                       LDR R0,=TIM3_ARR                     ; Set the Auto-reload value 
                       MOV R1,#199
                       STR R1,[R0]
                       
                       LDR R0,=TIM3_PSC                     ; Set the Prescaler value
                       MOV R1,#10799
                       STR R1,[R0]
                       
                       LDR R0,=TIM3_EGR                     ; Generate an update event to reload the Prescaler value immediately
                       LDR R1,[R0]
                       ORR R1,R1,#0x01
                       STR R1,[R0]
                       
                       LDR R0,=TIM3_DIER                    ; Enable the TIM Update interrupt
                       LDR R1,[R0]
                       ORR R1,R1,#0x01
                       STR R1,[R0]
                       
                       LDR R0,=TIM3_CR1                     ; Enable TIM3 Peripheral
                       LDR R1,[R0]
                       ORR R1,R1,#0x01
                       STR R1,[R0]
                       
                       POP {PC}    
                       ENDP
                                    
                                    
                                    
                                    
;/**************************************************************************************************************
; * Function Name   : TIM3_IRQHandler
; * Description     : This function handles TIM3 global interrupt request.
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Mar-27-2016
; * Call            : Outside
;****************************************************************************************************************/                                    
TIM3_IRQHandler     PROC
                    EXPORT  TIM3_IRQHandler    
                    IMPORT bsp_LedToggle 
                    PUSH {LR}
                    
                    LDR R0,=TIM3_SR                         ; Clear interrupt flag
                    LDR R1,[R0]
                    MOV R2,#1
                    BIC R1,R2
                    STR R1,[R0]
                                       
                    LDR R0,=g_timerCounter
                    LDR R1,[R0]
                    ADD R1,R1,#1
                    STR R1,[R0]
                    CMP R1,#50
                    BNE TimerFlag
                    LDR R0,=g_timerCounter
                    MOV R1,#0
                    STR R1,[R0]
                    LDR R0,=g_timerFlag
                    MOV R1,#1
                    STR R1,[R0]
TimerFlag                    
                    POP {PC}
                    ENDP                                    
                                    
                                    
                                                 
                    NOP             
                    END      



                    
;****************************************************************END OF FILE***********************************************************
                    
                            