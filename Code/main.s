;************************************************************************************************************
; * File Name   : main.s
; * Author      : Bryant
; * Version     : V1.0.0
; * Date        : Feb-22-2016
; * Description : Main file of this project
; *************************************************************************************************************
;Includes -----------------------------------------------------------------------------------------------------                                   
                           AREA    MAIN,CODE,READONLY


                           EXTERN g_timerFlag 
;**************************************************************************************************************
; * Function Name   : main
; * Description     : main function body
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-23-2016
; * Call            : Outside
;***************************************************************************************************************/
MAIN_FUNCTION               PROC
                            EXPORT MAIN_FUNCTION
                            IMPORT HAL_Init
                            IMPORT SystemClockConfig
                            IMPORT bsp_LedInit
                            IMPORT bsp_TimerInit
                            IMPORT bsp_TimerInit
                            IMPORT bsp_LedToggle
                            PUSH {LR}
                            BL HAL_Init
                            BL SystemClockConfig
                            BL bsp_LedInit
                            BL bsp_TimerInit
WHILE
                            LDR R0,=g_timerFlag
                            LDR R1,[R0]
                            CMP R1,#1
                            BNE WHILE
                            LDR R0,=g_timerFlag
                            MOV R1,#0
                            STR R1,[R0]
                            BL bsp_LedToggle
                            B WHILE
                            POP {PC}
                            ENDP



                            

                            ALIGN
;****************************************************************END OF FILE***********************************************************
                    
                            END