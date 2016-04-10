;************************************************************************************************************
; * File Name   : system_stm32f7xx.s
; * Author      : Bryant
; * Date        : Feb-22-2016
; * Description : CMSIS Cortex-M7 Device Peripheral Access Layer System Source File.
; *************************************************************************************************************
;Includes -----------------------------------------------------------------------------------------------------
                                INCLUDE stm32f746_hal.s
                                    
                                AREA    RCC_PRO,CODE,READONLY

VECT_TAB_OFFSET     EQU     0x00 ; Vector Table base offset field. This value must be a multiple of 0x200.
    
;**************************************************************************************************************
; * Function Name   : SystemInit
; * Description     : Setup the microcontroller system
; *                   Initialize the Embedded Flash Interface, the PLL and update the 
; *                   SystemFrequency variable.
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Jan-31-2016
; * Call            : Outside
;***************************************************************************************************************/
SystemInit                  PROC
                            EXPORT SystemInit
                            PUSH {R4-R5,LR}
                            
                            LDR R0,=SCB_CPACR       ; Set CP10 and CP11 Full Access (Float point coprocessor)
                            LDR R1,[R0]
                            MOV R2,#0x03
                            ORR R1,R1,R2,LSL #0x14
                            MOV R2,#0x03
                            ORR R1,R1,R2,LSL #0x16
                            STR R1,[R0]
                            
                            ; Reset the RCC clock configuration to the default reset state 
                            LDR R0,=RCC_CR          ; Internal high-speed clock enable       
                            LDR R1,[R0]
                            ORR R1,#0x01
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CFGR        ; Reset CFGR register       
                            MOV R1,#0x00
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CR          ; (HSEON)HSE clock disable, (CSSON) clock security system disable, (PLLON)Main PLL disable        
                            LDR R1,[R0]
                            MOV32 R2,#0xFEF6FFFF
                            AND R1,R2
                            STR R1,[R0]
                            
                            LDR R0,=RCC_PLLCFGR     ; Set this register context to default value(see reference manual)  
                            MOV32 R1,#0x24003010
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CR          ; (HSEON)HSE clock disable, (CSSON) clock security system disable, (PLLON)Main PLL disable        
                            LDR R1,[R0]
                            BIC R1,#0x40000         ; HSE oscillator clock no bypass (The bits set in 0x40000 is cleared R1)
                            STR R1,[R0]
                        
                            LDR R0,=RCC_CIR         ; Disable all interrupts
                            MOV R1,#0x00000000
                            STR R1,[R0]
                            
                            LDR R0,=SCB_VTOR        ; Vector Table Relocation in Internal FLASH
                            LDR R1,=FLASHAXI_BASE
                            STR R1,[R0]
                            
                            POP {R4-R5,PC}
                            ENDP
                                

;**************************************************************************************************************
; * Function Name   : SCB_EnableICache
; * Description     : The function turns on I-Cache
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Jan-31-2016
; * Call            : Outside
;***************************************************************************************************************/
SCB_EnableICache            PROC
                            EXPORT SCB_EnableICache
                            PUSH {R4-R7,LR}
                            DSB                     ; No instruction in program order after this instruction can execute until this instruction completes
                            ISB                     ; All instructions following the ISB are fetched from cache or memory after the instruction has completed
                            
                            LDR R0,=SCB_ICIALLU     ; Enables L1 instruction cache
                            MOV R1,#0x00
                            STR R1,[R0]
                            LDR R0,=SCB_CCR
                            LDR R1,[R0]
                            ORR R1,#0x20000
                            STR R1,[R0]
                            
                            DSB                     ; No instruction in program order after this instruction can execute until this instruction completes
                            ISB                     ; All instructions following the ISB are fetched from cache or memory after the instruction has completed
                                                       
                            POP {R4-R7,PC}
                            ENDP

;**************************************************************************************************************
; * Function Name   : SCB_EnableICache
; * Description     : The function turns on I-Cache
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Jan-31-2016
; * Call            : Outside
;***************************************************************************************************************/
;SCB_EnableDCache            PROC
;                            EXPORT SCB_EnableDCache
;                            PUSH {R4-R7,LR}
;            
;                            LDR R0,=SCB_CSSELR      ; Enables selection of instruction cache
;                            MOV R1,#0x00
;                            STR R1,[R0]
                            
;                            LDR R0,=SCB_CCSIDR
;                            LDR R1,[R0]
                            
;                            POP {R4-R7,PC}
;                            ENDP



;**************************************************************************************************************
; * Function Name   : HAL_Init
; * Description     : This function is used to initialize the HAL Library; it must be the first 
; *                   instruction to be executed in the main program (before to call any other
; *                   HAL function), it performs the following:
; *                     Configure the Flash prefetch, and instruction cache through ART accelerator.
; *                     Configures the SysTick to generate an interrupt each 1 millisecond,
; *                     which is clocked by the HSI (at this stage, the clock is not yet
; *                     configured and thus the system is running from the internal HSI at 16 MHz).
; *                     Set NVIC Group Priority to 4.
; *                     Calls the HAL_MspInit() callback function defined in user file 
; *                     "stm32f7xx_hal_msp.c" to do the global low level hardware initialization 
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Jan-31-2016
; * Call            : Outside
;***************************************************************************************************************/
HAL_Init                    PROC
                            EXPORT HAL_Init
                         
                            PUSH {R4,LR}
                            
                            LDR R0,=FLASH_ACR               ; Enable ART Accelerator  
                            LDR R1,[R0]
                            ORR R1,R1,#0x200
                            STR R1,[R0]
                            
                            MOV R0,#0x03
                            BL NVIC_SetPriorityGrouping
                            
                            POP {R4,PC}    
                            ENDP


;**************************************************************************************************************
; * Function Name   : NVIC_SetPriorityGrouping
; * Description     : Set Priority Grouping
; * Input Variable  : PriorityGroup : Pass through R0
; *                   NVIC_PRIORITYGROUP_0 : ((uint32_t)0x00000007) 0 bits for pre-emption priority 4 bits for subpriority 
; *                   NVIC_PRIORITYGROUP_1 : ((uint32_t)0x00000006) 1 bits for pre-emption priority 3 bits for subpriority 
; *                   NVIC_PRIORITYGROUP_2 : ((uint32_t)0x00000005) 2 bits for pre-emption priority 2 bits for subpriority 
; *                   NVIC_PRIORITYGROUP_3 : ((uint32_t)0x00000004) 3 bits for pre-emption priority 1 bits for subpriority 
; *                   NVIC_PRIORITYGROUP_4 : ((uint32_t)0x00000003) 4 bits for pre-emption priority 0 bits for subpriority 
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-02-2016
; * Call            : Outside
;***************************************************************************************************************/
NVIC_SetPriorityGrouping    PROC
                            EXPORT NVIC_SetPriorityGrouping
                            PUSH {R4,LR}
                            
                            ANDS R2,R0,#0x07                    ; Only values 0..7 are used 
                            LDR R0,=SCB_AIRCR                   ; Read old register configuration
                            LDR R1,[R0]
                            
                            MOVW R3,#0xF8FF                     ; Clear interrupt priority grouping field
                            AND R1,R1,R3
                            MOV32 R3,#0x5FA00000                ; To write 'AIRCR' register, must write 0x5FA to the highest 16-bit, 
                                                                ; otherwise the processor ignores the write
                            ORR R3,R3,R2,LSL #8
                            ORR R1,R1,R3
                            STR R1,[R0]
                            
                            POP {R4,PC}   
                            
                            ENDP

;**************************************************************************************************************
; * Function Name   : SystemClockConfig
; * Description     : Setup the system clock to 216MHz
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-22-2016
; * Call            : Outside
;***************************************************************************************************************/
SystemClockConfig           PROC
                            EXPORT SystemClockConfig
                            PUSH {LR}
                            
                            BL HSE_Configuration
                            BL HAL_PWREx_EnableOverDrive
                            BL RCC_Configuration
                            
                            POP {PC}
                            ENDP

;**************************************************************************************************************
; * Function Name   : HSE_Configuration
; * Description     : Setup the system clock to 216MHz
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-14-2016
; * Call            : Inside
;***************************************************************************************************************/
; * The system Clock is configured as follow : 
; * System Clock source            = PLL (HSE)
; * SYSCLK(Hz)                     = 216000000
; * HCLK(Hz)                       = 216000000
; * AHB Prescaler                  = 1
; * APB1 Prescaler                 = 4
; * APB2 Prescaler                 = 2
; * HSE Frequency(Hz)              = 25000000
; * PLL_M                          = 25    (f(PLL input) = f(HSE) / PLLM      )  
; * PLL_N                          = 432   (f(VCO)       = f(PLL input) * PLLN)
; * PLL_P                          = 2     (f(PLLCLK)    = f(VCO) / PLLP      )
; * PLL_Q                          = 9     (f(USB OTG FS)= f(VCO) / PLLQ      )  
HSE_Configuration           PROC
                            EXPORT HSE_Configuration
                            PUSH {LR}
                           
                            LDR R0,=RCC_CR                        ; Reset HSEON and HSEBYP bits before configuring the HSE
                            LDR R1,[R0]
                            BIC R1,#0x10000
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CR                        ; Reset HSEON and HSEBYP bits before configuring the HSE
                            LDR R1,[R0]
                            BIC R1,#0x40000
                            STR R1,[R0]
                            
HSE_Enable                  LDR R0,=RCC_CR
                            LDR R1,[R0]
                            ANDS R1,R1,#0x20000
                            BNE HSE_Enable                        ; Wait till HSE is disabled  
                            
                            LDR R0,=RCC_CR                        ; Disable HSEBYP 
                            LDR R1,[R0]
                            BIC R1,#0x40000
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CR                        ; HSE oscillator ON
                            LDR R1,[R0]
                            ORR R1,#0x10000
                            STR R1,[R0]
                                                
HSE_Disable                 LDR R0,=RCC_CR                        
                            LDR R1,[R0]
                            ANDS R1,R1,#0x20000
                            BEQ HSE_Disable                       ; Wait till HSE is enable  
                                          
PLL_Configuration           LDR R0,=RCC_CR                        ; Disable PLL   
                            LDR R1,[R0]
                            BIC R1,R1,#0x1000000
                            STR R1,[R0]
                            
PLL_WaitUnlocked            LDR R0,=RCC_CR                       
                            LDR R1,[R0]
                            ANDS R1,R1,#0x2000000                 ; Wait until PLL is unlocked   
                            BNE PLL_WaitUnlocked
                            
                            MOV R1,#25                            ; Division factor for the main PLLs is 25(1M)
                            MOV R2,#432                           ; Main PLL (PLL) multiplication factor for VCO is 432(432M)
                            ORR R1,R1,R2,LSL #6 
                            ORR R1,R1,#0x400000                   ; HSE oscillator clock selected as PLL and PLLI2S clock entry
                            MOV R2,#9
                            ORR R1,R1,R2,LSL #24
                            
                            LDR R0,=RCC_PLLCFGR
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CR                        ; Enable main PLL
                            LDR R1,[R0]
                            ORR R1,#0x1000000
                            STR R1,[R0]
                                 
PLL_WaitLocked              LDR R0,=RCC_CR
                            LDR R1,[R0]  
                            ANDS R1,#0x2000000
                            BEQ PLL_WaitLocked
                            
                            POP {PC}
                            ENDP
;**************************************************************************************************************
; * Function Name   : HAL_PWREx_EnableOverDrive
; * Description     : Activates the Over-Drive mode.
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-14-2016
; * Call            : Inside
; * Note            : This mode allows the CPU and the core logic to operate at a higher frequency
;  *                  than the normal mode for a given voltage scaling (scale 1, scale 2 or scale 3).   
;  *                  It is recommended to enter or exit Over-drive mode when the application is not running 
;  *                  critical tasks and when the system clock source is either HSI or HSE. 
;  *                  During the Over-drive switch activation, no peripheral clocks should be enabled.   
;  *                  The peripheral clocks must be enabled once the Over-drive mode is activated.   
;***************************************************************************************************************/
HAL_PWREx_EnableOverDrive   PROC
                            EXPORT HAL_PWREx_EnableOverDrive
                                
                            PUSH {LR}    
                            
                            LDR R0,=RCC_APB1ENR                       ; Enable Power interface clock 
                            LDR R1,[R0]
                            MOV R2,#1
                            ORR R1,R1,R2,LSL #28
                            STR R1,[R0]
                            
                            LDR R0,=PWR_CR1                           ; Enable the Over-drive to extend the clock frequency to 216 MHz
                            LDR R1,[R0]
                            ORR R1,R1,#0x10000
                            STR R1,[R0]
                            
                            LDR R0,=PWR_CSR1
                            LDR R1,[R0]
PWR_WaitODRDY                            
                            AND R1,#0x10000                           ; Wait until over-driver mode ready
                            BEQ PWR_WaitODRDY
                            
                            POP {PC}
                            ENDP

;**************************************************************************************************************
; * Function Name   : RCC_Configuration
; * Description     : Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2 clocks dividers
; * Input Variable  : None
; * Return Variable : None
; * Author          : Bryant
; * Create Date     : Feb-22-2016
; * Call            : Inside
;***************************************************************************************************************/
RCC_Configuration           PROC
                            EXPORT RCC_Configuration
                            
                            PUSH {LR}

                            LDR R0,=FLASH_ACR                         ; FLASH Seven Latency cycles
                            LDR R1,[R0]
                            ORR R1,R1,#0x07
                            STR R1,[R0]

                            LDR R0,=RCC_CFGR                          ; System clock not divided as AHB clock                    
                            LDR R1,[R0]
                            MOV R2,#0x00
                            ORR R1,R2,LSL #4
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CFGR                          ; PLL selected as system clock
                            LDR R1,[R0]
                            ORR R1,R1,#0x02
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CFGR                          ; Wait until PLL clock be selected as system clock
                            LDR R1,[R0]
PLL_UsedAsSysClock          
                            ANDS R1,R1,#12
                            CMP R1,#8
                            BNE PLL_UsedAsSysClock
                            
                            LDR R0,=RCC_CFGR                          ; Set APB low-speed clock division factor to 4        
                            LDR R1,[R0]
                            MOV R2,#0x05
                            ORR R1,R2,LSL #10
                            STR R1,[R0]
                            
                            LDR R0,=RCC_CFGR                          ; Set APB low-speed clock division factor to 4        
                            LDR R1,[R0]
                            MOV R2,#0x04
                            ORR R1,R2,LSL #13
                            STR R1,[R0]
                            
                            POP {PC}
                            ENDP
                                
                            ALIGN
;****************************************************************END OF FILE***********************************************************
                    
                            END