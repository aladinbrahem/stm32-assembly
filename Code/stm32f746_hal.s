;*******************************************************************************************************************************************************
;* File Name          : stm32f746_map.s
;* Author             : Bryant
;* Version            : V1.0.0
;* Date               : 31-Jan-2016
;* Description        : Define all stm32f746 relative peripheral address
;*******************************************************************************************************************************************************


;********************************************Peripheral_memory_map**************************************************************************************
RAMITCM_BASE                EQU     0x00000000                      ; Base address of :16KB RAM reserved for CPU execution/instruction accessible over ITCM    
FLASHITCM_BASE              EQU     0x00200000                      ; Base address of :  up to 1 MB   embedded FLASH memory  accessible over ITCM                                       
FLASHAXI_BASE               EQU     0x08000000                      ; Base address of :   up to 1 MB   embedded FLASH memory accessible over AXI                                        
RAMDTCM_BASE                EQU     0x20000000                      ; Base address of : 64KB system data RAM accessible over DTCM                              
SRAM1_BASE                  EQU     0x20010000                      ; Base address of : 240KB RAM1 accessible over AXI/AHB                                     
SRAM2_BASE                  EQU     0x2004C000                      ; Base address of : 16KB RAM2 accessible over AXI/AHB                                      
PERIPH_BASE                 EQU     0x40000000                      ; Base address of : AHB/ABP Peripherals                                                    
BKPSRAM_BASE                EQU     0x40024000                      ; Base address of : Backup SRAM  4 KB                                                        
QSPI_BASE                   EQU     0x90000000                      ; Base address of : QSPI memories  accessible over AXI                                     
FMC_R_BASE                  EQU     0xA0000000                      ; Base address of : FMC Control registers                                                  
QSPI_R_BASE                 EQU     0xA0001000                      ; Base address of : QSPI Control  registers                                                
FLASH_END                   EQU     0x080FFFFF                      ; FLASH end address  

;*********************************************************Legacy define********************************************************************************* 
FLASH_BASE                  EQU	    FLASHAXI_BASE

;***********************************************************Cortex-M7 Core Peripherals****************************************************************** 
SCS_BASE                    EQU      0xE000E000                     ; System Control Space Base Address   
ITM_BASE                    EQU      0xE0000000                     ; ITM Base Address                    
DWT_BASE                    EQU      0xE0001000                     ; DWT Base Address                    
TPI_BASE                    EQU      0xE0040000                     ; TPI Base Address                    
CoreDebug_BASE              EQU      0xE000EDF0                     ; Core Debug Base Address             

;**********************************************************System control block************************************************************************* 
SCB_BASE                    EQU      SCS_BASE +  0x0D00             ; System Control Block Base Address   
SCB_CPUID                   EQU      SCB_BASE +  0x0000             ; Offset: 0x000 (R/ )  CPUID Base Register                                    
SCB_ICSR                    EQU      SCB_BASE +  0x0004             ; Offset: 0x004 (R/W)  Interrupt Control and State Register                    
SCB_VTOR                    EQU      SCB_BASE +  0x0008             ; Offset: 0x008 (R/W)  Vector Table Offset Register                           
SCB_AIRCR                   EQU      SCB_BASE +  0x000C             ; Offset: 0x00C (R/W)  Application Interrupt and Reset Control Register        
SCB_SCR                     EQU      SCB_BASE +  0x0010             ; Offset: 0x010 (R/W)  System Control Register                                 
SCB_CCR                     EQU      SCB_BASE +  0x0014             ; Offset: 0x014 (R/W)  Configuration Control Register                          
SCB_HPR1                    EQU      SCB_BASE +  0x0018             ; Offset: 0x018 (R/W)  System Handlers Priority Registers (4-7)   
SCB_SHPR2                   EQU      SCB_BASE +  0x001C             ; Offset: 0x01C (R/W)  System Handlers Priority Registers (8-11) 
SCB_SHPR3                   EQU      SCB_BASE +  0x0020             ; Offset: 0x020 (R/W)  System Handlers Priority Registers (12-15) 
SCB_SHCSR                   EQU      SCB_BASE +  0x0024             ; Offset: 0x024 (R/W)  System Handler Control and State Register               
SCB_CFSR                    EQU      SCB_BASE +  0x0028             ; Offset: 0x028 (R/W)  Configurable Fault Status Register                      
SCB_HFSR                    EQU      SCB_BASE +  0x002C             ; Offset: 0x02C (R/W)  HardFault Status Register                              
SCB_DFSR                    EQU      SCB_BASE +  0x0030             ; Offset: 0x030 (R/W)  Debug Fault Status Register                            
SCB_MMFAR                   EQU      SCB_BASE +  0x0034             ; Offset: 0x034 (R/W)  MemManage Fault Address Register                        
SCB_BFAR                    EQU      SCB_BASE +  0x0038             ; Offset: 0x038 (R/W)  BusFault Address Register                               
SCB_AFSR                    EQU      SCB_BASE +  0x003C             ; Offset: 0x03C (R/W)  Auxiliary Fault Status Register                        

SCB_CLIDR                   EQU      SCB_BASE +  0x0078             ; Offset: 0x078 (R/ )  Cache Level ID register                                  
SCB_CTR                     EQU      SCB_BASE +  0x007C             ; Offset: 0x07C (R/ )  Cache Type register                                      
SCB_CCSIDR                  EQU      SCB_BASE +  0x0080             ; Offset: 0x080 (R/ )  Cache Size ID Register                                   
SCB_CSSELR                  EQU      SCB_BASE +  0x0084             ; Offset: 0x084 (R/W)  Cache Size Selection Register                            
SCB_CPACR                   EQU      SCB_BASE +  0x0088             ; Offset: 0x088 (R/W)  Coprocessor Access Control Register                    

SCB_STIR                    EQU      SCB_BASE  +  0x0200            ; Offset: 0x200 ( /W)  Software Triggered Interrupt Register  

SCB_MVFR0                   EQU      SCB_BASE  +  0x0240            ; Offset: 0x240 (R/ )  Media and VFP Feature Register 0                        
SCB_MVFR1                   EQU      SCB_BASE  +  0x0244            ; Offset: 0x244 (R/ )  Media and VFP Feature Register 1                        
SCB_MVFR2                   EQU      SCB_BASE  +  0x0248            ; Offset: 0x248 (R/ )  Media and VFP Feature Register 2   

SCB_ICIALLU                 EQU      SCB_BASE  +  0x0250            ; Offset: 0x250 ( /W)  I-Cache Invalidate All to PoU                         
SCB_ICIMVAU                 EQU      SCB_BASE  +  0x0258            ; Offset: 0x258 ( /W)  I-Cache Invalidate by MVA to PoU                         
SCB_DCIMVAC                 EQU      SCB_BASE  +  0x025C            ; Offset: 0x25C ( /W)  D-Cache Invalidate by MVA to PoC                         
SCB_DCISW                   EQU      SCB_BASE  +  0x0260            ; Offset: 0x260 ( /W)  D-Cache Invalidate by Set-way                            
SCB_DCCMVAU                 EQU      SCB_BASE  +  0x0264            ; Offset: 0x264 ( /W)  D-Cache Clean by MVA to PoU                              
SCB_DCCMVAC                 EQU      SCB_BASE  +  0x0268            ; Offset: 0x268 ( /W)  D-Cache Clean by MVA to PoC                              
SCB_DCCSW                   EQU      SCB_BASE  +  0x026C            ; Offset: 0x26C ( /W)  D-Cache Clean by Set-way                                 
SCB_DCCIMVAC                EQU      SCB_BASE  +  0x0270            ; Offset: 0x270 ( /W)  D-Cache Clean and Invalidate by MVA to PoC               
SCB_DCCISW                  EQU      SCB_BASE  +  0x0274            ; Offset: 0x274 ( /W)  D-Cache Clean and Invalidate by Set-way                

SCB_ITCMCR                  EQU      SCB_BASE  +  0x0290            ; Offset: 0x290 (R/W)  Instruction Tightly-Coupled Memory Control Register     
SCB_DTCMCR                  EQU      SCB_BASE  +  0x0294            ; Offset: 0x294 (R/W)  Data Tightly-Coupled Memory Control Registers           
SCB_AHBPCR                  EQU      SCB_BASE  +  0x0298            ; Offset: 0x298 (R/W)  AHBP Control Register                                   
SCB_CACR                    EQU      SCB_BASE  +  0x029C            ; Offset: 0x29C (R/W)  L1 Cache Control Register                               
SCB_AHBSCR                  EQU      SCB_BASE  +  0x02A0            ; Offset: 0x2A0 (R/W)  AHB Slave Control Register                                   
SCB_ABFSR                   EQU      SCB_BASE  +  0x02A8            ; Offset: 0x2A8 (R/W)  Auxiliary Bus Fault Status Register                   


;**************************************************************System timer***************************************************************************** 
SysTick_BASE                EQU      SCS_BASE +  0x0010             ; SysTick Base Address                
SysTick_CTRL                EQU      SysTick_BASE + 0x0000          ; Offset: 0x000 (R/W)  SysTick Control and Status Register    
SysTick_LOAD                EQU      SysTick_BASE + 0x0004          ; Offset: 0x004 (R/W)  SysTick Reload Value Register          
SysTick_VAL                 EQU      SysTick_BASE + 0x0008          ; Offset: 0x008 (R/W)  SysTick Current Value Register         
SysTick_CALIB               EQU      SysTick_BASE + 0x000C          ; Offset: 0x00C (R/ )  SysTick Calibration Register         

;************************************************Nested Vectored Interrupt Controller******************************************************************* 
NVIC_BASE                   EQU      SCS_BASE +  0x0100             ; NVIC Base Address                   
NVIC_ISER0                  EQU      NVIC_BASE + 0x0000             ; Offset: 0x000 (R/W)  Interrupt Set Enable Register                   
NVIC_ISER1                  EQU      NVIC_BASE + 0x0004             ; Offset: 0x004 (R/W)  Interrupt Set Enable Register                   
NVIC_ISER2                  EQU      NVIC_BASE + 0x0008             ; Offset: 0x008 (R/W)  Interrupt Set Enable Register                   
NVIC_ISER3                  EQU      NVIC_BASE + 0x000C             ; Offset: 0x00C (R/W)  Interrupt Set Enable Register                   
NVIC_ISER4                  EQU      NVIC_BASE + 0x0010             ; Offset: 0x010 (R/W)  Interrupt Set Enable Register                   
NVIC_ISER5                  EQU      NVIC_BASE + 0x0014             ; Offset: 0x014 (R/W)  Interrupt Set Enable Register                   
NVIC_ISER6                  EQU      NVIC_BASE + 0x0018             ; Offset: 0x018 (R/W)  Interrupt Set Enable Register                   
NVIC_ISER7                  EQU      NVIC_BASE + 0x001C             ; Offset: 0x01C (R/W)  Interrupt Set Enable Register                   

NVIC_ICER0                  EQU      NVIC_BASE + 0x0080             ; Offset: 0x080 (R/W)  Interrupt Clear Enable Register                 
NVIC_ICER1                  EQU      NVIC_BASE + 0x0084             ; Offset: 0x084 (R/W)  Interrupt Clear Enable Register                 
NVIC_ICER2                  EQU      NVIC_BASE + 0x0088             ; Offset: 0x088 (R/W)  Interrupt Clear Enable Register                 
NVIC_ICER3                  EQU      NVIC_BASE + 0x008C             ; Offset: 0x08C (R/W)  Interrupt Clear Enable Register                 
NVIC_ICER4                  EQU      NVIC_BASE + 0x0090             ; Offset: 0x090 (R/W)  Interrupt Clear Enable Register                 
NVIC_ICER5                  EQU      NVIC_BASE + 0x0094             ; Offset: 0x094 (R/W)  Interrupt Clear Enable Register                 
NVIC_ICER6                  EQU      NVIC_BASE + 0x0098             ; Offset: 0x098 (R/W)  Interrupt Clear Enable Register                 
NVIC_ICER7                  EQU      NVIC_BASE + 0x009C             ; Offset: 0x09C (R/W)  Interrupt Clear Enable Register                 

NVIC_ISPR0                  EQU      NVIC_BASE + 0x0100             ; Offset: 0x100 (R/W)  Interrupt Set Pending Register                 
NVIC_ISPR1                  EQU      NVIC_BASE + 0x0104             ; Offset: 0x104 (R/W)  Interrupt Set Pending Register                 
NVIC_ISPR2                  EQU      NVIC_BASE + 0x0108             ; Offset: 0x108 (R/W)  Interrupt Set Pending Register                 
NVIC_ISPR3                  EQU      NVIC_BASE + 0x010C             ; Offset: 0x10C (R/W)  Interrupt Set Pending Register                 
NVIC_ISPR4                  EQU      NVIC_BASE + 0x0110             ; Offset: 0x110 (R/W)  Interrupt Set Pending Register                 
NVIC_ISPR5                  EQU      NVIC_BASE + 0x0114             ; Offset: 0x114 (R/W)  Interrupt Set Pending Register                 
NVIC_ISPR6                  EQU      NVIC_BASE + 0x0118             ; Offset: 0x118 (R/W)  Interrupt Set Pending Register                 
NVIC_ISPR7                  EQU      NVIC_BASE + 0x011C             ; Offset: 0x11C (R/W)  Interrupt Set Pending Register                 
  
NVIC_ICPR0                  EQU      NVIC_BASE + 0x0180             ; Offset: 0x180 (R/W)  Interrupt Clear Pending Register                
NVIC_ICPR1                  EQU      NVIC_BASE + 0x0184             ; Offset: 0x184 (R/W)  Interrupt Clear Pending Register                
NVIC_ICPR2                  EQU      NVIC_BASE + 0x0188             ; Offset: 0x188 (R/W)  Interrupt Clear Pending Register                
NVIC_ICPR3                  EQU      NVIC_BASE + 0x018C             ; Offset: 0x18C (R/W)  Interrupt Clear Pending Register                
NVIC_ICPR4                  EQU      NVIC_BASE + 0x0190             ; Offset: 0x190 (R/W)  Interrupt Clear Pending Register                
NVIC_ICPR5                  EQU      NVIC_BASE + 0x0194             ; Offset: 0x194 (R/W)  Interrupt Clear Pending Register                
NVIC_ICPR6                  EQU      NVIC_BASE + 0x0198             ; Offset: 0x198 (R/W)  Interrupt Clear Pending Register                
NVIC_ICPR7                  EQU      NVIC_BASE + 0x019C             ; Offset: 0x19C (R/W)  Interrupt Clear Pending Register                
 
NVIC_IABR0                  EQU      NVIC_BASE + 0x0200             ; Offset: 0x200 (R/W)  Interrupt Active bit Register                   
NVIC_IABR1                  EQU      NVIC_BASE + 0x0204             ; Offset: 0x204 (R/W)  Interrupt Active bit Register                   
NVIC_IABR2                  EQU      NVIC_BASE + 0x0208             ; Offset: 0x208 (R/W)  Interrupt Active bit Register                   
NVIC_IABR3                  EQU      NVIC_BASE + 0x020C             ; Offset: 0x20C (R/W)  Interrupt Active bit Register                   
NVIC_IABR4                  EQU      NVIC_BASE + 0x0210             ; Offset: 0x210 (R/W)  Interrupt Active bit Register                   
NVIC_IABR5                  EQU      NVIC_BASE + 0x0214             ; Offset: 0x214 (R/W)  Interrupt Active bit Register                   
NVIC_IABR6                  EQU      NVIC_BASE + 0x0218             ; Offset: 0x218 (R/W)  Interrupt Active bit Register                   
NVIC_IABR7                  EQU      NVIC_BASE + 0x021C             ; Offset: 0x21C (R/W)  Interrupt Active bit Register                   

NVIC_IPR0                   EQU      NVIC_BASE + 0x0300             ; Offset: 0x0300 (R/W)  Interrupt Priority Register  
NVIC_IPR1                   EQU      NVIC_BASE + 0x0301             ; Offset: 0x0301 (R/W)  Interrupt Priority Register  
NVIC_IPR2                   EQU      NVIC_BASE + 0x0302             ; Offset: 0x0302 (R/W)  Interrupt Priority Register      
NVIC_IPR3                   EQU      NVIC_BASE + 0x0303             ; Offset: 0x0303 (R/W)  Interrupt Priority Register 
NVIC_IPR4                   EQU      NVIC_BASE + 0x0304             ; Offset: 0x0304 (R/W)  Interrupt Priority Register 
NVIC_IPR5                   EQU      NVIC_BASE + 0x0305             ; Offset: 0x0305 (R/W)  Interrupt Priority Register 
NVIC_IPR6                   EQU      NVIC_BASE + 0x0306             ; Offset: 0x0306 (R/W)  Interrupt Priority Register 
NVIC_IPR7                   EQU      NVIC_BASE + 0x0307             ; Offset: 0x0307 (R/W)  Interrupt Priority Register 
NVIC_IPR8                   EQU      NVIC_BASE + 0x0308             ; Offset: 0x0308 (R/W)  Interrupt Priority Register 
NVIC_IPR9                   EQU      NVIC_BASE + 0x0309             ; Offset: 0x0309 (R/W)  Interrupt Priority Register 
NVIC_IPR10                  EQU      NVIC_BASE + 0x030A             ; Offset: 0x030A (R/W)  Interrupt Priority Register 
NVIC_IPR11                  EQU      NVIC_BASE + 0x030B             ; Offset: 0x030B (R/W)  Interrupt Priority Register 
NVIC_IPR12                  EQU      NVIC_BASE + 0x030C             ; Offset: 0x030C (R/W)  Interrupt Priority Register 
NVIC_IPR13                  EQU      NVIC_BASE + 0x030D             ; Offset: 0x030D (R/W)  Interrupt Priority Register    
NVIC_IPR14                  EQU      NVIC_BASE + 0x030E             ; Offset: 0x030E (R/W)  Interrupt Priority Register 
NVIC_IPR15                  EQU      NVIC_BASE + 0x030F             ; Offset: 0x030F (R/W)  Interrupt Priority Register 
NVIC_IPR16                  EQU      NVIC_BASE + 0x0310             ; Offset: 0x0310 (R/W)  Interrupt Priority Register 
NVIC_IPR17                  EQU      NVIC_BASE + 0x0311             ; Offset: 0x0311 (R/W)  Interrupt Priority Register 
NVIC_IPR18                  EQU      NVIC_BASE + 0x0312             ; Offset: 0x0312 (R/W)  Interrupt Priority Register 
NVIC_IPR19                  EQU      NVIC_BASE + 0x0313             ; Offset: 0x0313 (R/W)  Interrupt Priority Register 
NVIC_IPR20                  EQU      NVIC_BASE + 0x0314             ; Offset: 0x0314 (R/W)  Interrupt Priority Register 
NVIC_IPR21                  EQU      NVIC_BASE + 0x0315             ; Offset: 0x0315 (R/W)  Interrupt Priority Register 
NVIC_IPR22                  EQU      NVIC_BASE + 0x0316             ; Offset: 0x0316 (R/W)  Interrupt Priority Register 
NVIC_IPR23                  EQU      NVIC_BASE + 0x0317             ; Offset: 0x0317 (R/W)  Interrupt Priority Register 
NVIC_IPR24                  EQU      NVIC_BASE + 0x0318             ; Offset: 0x0318 (R/W)  Interrupt Priority Register 
NVIC_IPR25                  EQU      NVIC_BASE + 0x0319             ; Offset: 0x0319 (R/W)  Interrupt Priority Register 
NVIC_IPR26                  EQU      NVIC_BASE + 0x031A             ; Offset: 0x031A (R/W)  Interrupt Priority Register     
NVIC_IPR27                  EQU      NVIC_BASE + 0x031B             ; Offset: 0x031B (R/W)  Interrupt Priority Register     
NVIC_IPR28                  EQU      NVIC_BASE + 0x031C             ; Offset: 0x031C (R/W)  Interrupt Priority Register 
NVIC_IPR29                  EQU      NVIC_BASE + 0x031D             ; Offset: 0x031D (R/W)  Interrupt Priority Register 
NVIC_IPR30                  EQU      NVIC_BASE + 0x031E             ; Offset: 0x031E (R/W)  Interrupt Priority Register 
NVIC_IPR31                  EQU      NVIC_BASE + 0x031F             ; Offset: 0x031F (R/W)  Interrupt Priority Register 
NVIC_IPR32                  EQU      NVIC_BASE + 0x0320             ; Offset: 0x0320 (R/W)  Interrupt Priority Register 
NVIC_IPR33                  EQU      NVIC_BASE + 0x0321             ; Offset: 0x0321 (R/W)  Interrupt Priority Register 
NVIC_IPR34                  EQU      NVIC_BASE + 0x0322             ; Offset: 0x0322 (R/W)  Interrupt Priority Register 
NVIC_IPR35                  EQU      NVIC_BASE + 0x0323             ; Offset: 0x0323 (R/W)  Interrupt Priority Register     
NVIC_IPR36                  EQU      NVIC_BASE + 0x0324             ; Offset: 0x0324 (R/W)  Interrupt Priority Register 
NVIC_IPR37                  EQU      NVIC_BASE + 0x0325             ; Offset: 0x0325 (R/W)  Interrupt Priority Register 
NVIC_IPR38                  EQU      NVIC_BASE + 0x0326             ; Offset: 0x0326 (R/W)  Interrupt Priority Register 
NVIC_IPR39                  EQU      NVIC_BASE + 0x0327             ; Offset: 0x0327 (R/W)  Interrupt Priority Register 
NVIC_IPR40                  EQU      NVIC_BASE + 0x0328             ; Offset: 0x0328 (R/W)  Interrupt Priority Register 
NVIC_IPR41                  EQU      NVIC_BASE + 0x0329             ; Offset: 0x0329 (R/W)  Interrupt Priority Register 
NVIC_IPR42                  EQU      NVIC_BASE + 0x032A             ; Offset: 0x032A (R/W)  Interrupt Priority Register 
NVIC_IPR43                  EQU      NVIC_BASE + 0x032B             ; Offset: 0x032B (R/W)  Interrupt Priority Register 
NVIC_IPR44                  EQU      NVIC_BASE + 0x032C             ; Offset: 0x032C (R/W)  Interrupt Priority Register 
NVIC_IPR45                  EQU      NVIC_BASE + 0x032D             ; Offset: 0x032D (R/W)  Interrupt Priority Register 
NVIC_IPR46                  EQU      NVIC_BASE + 0x032E             ; Offset: 0x032E (R/W)  Interrupt Priority Register 
NVIC_IPR47                  EQU      NVIC_BASE + 0x032F             ; Offset: 0x032F (R/W)  Interrupt Priority Register 
NVIC_IPR48                  EQU      NVIC_BASE + 0x0330             ; Offset: 0x0330 (R/W)  Interrupt Priority Register 
NVIC_IPR49                  EQU      NVIC_BASE + 0x0331             ; Offset: 0x0331 (R/W)  Interrupt Priority Register 
NVIC_IPR50                  EQU      NVIC_BASE + 0x0332             ; Offset: 0x0332 (R/W)  Interrupt Priority Register              
NVIC_IPR51                  EQU      NVIC_BASE + 0x0333             ; Offset: 0x0333 (R/W)  Interrupt Priority Register     
NVIC_IPR52                  EQU      NVIC_BASE + 0x0334             ; Offset: 0x0334 (R/W)  Interrupt Priority Register     
NVIC_IPR53                  EQU      NVIC_BASE + 0x0335             ; Offset: 0x0335 (R/W)  Interrupt Priority Register 
NVIC_IPR54                  EQU      NVIC_BASE + 0x0336             ; Offset: 0x0336 (R/W)  Interrupt Priority Register 
NVIC_IPR55                  EQU      NVIC_BASE + 0x0337             ; Offset: 0x0337 (R/W)  Interrupt Priority Register     
NVIC_IPR56                  EQU      NVIC_BASE + 0x0338             ; Offset: 0x0338 (R/W)  Interrupt Priority Register 
NVIC_IPR57                  EQU      NVIC_BASE + 0x0339             ; Offset: 0x0339 (R/W)  Interrupt Priority Register 
NVIC_IPR58                  EQU      NVIC_BASE + 0x033A             ; Offset: 0x033A (R/W)  Interrupt Priority Register 
NVIC_IPR59                  EQU      NVIC_BASE + 0x033B             ; Offset: 0x033B (R/W)  Interrupt Priority Register 
NVIC_IPR60                  EQU      NVIC_BASE + 0x033C             ; Offset: 0x033C (R/W)  Interrupt Priority Register 
NVIC_IPR61                  EQU      NVIC_BASE + 0x033D             ; Offset: 0x033D (R/W)  Interrupt Priority Register 
NVIC_IPR62                  EQU      NVIC_BASE + 0x033E             ; Offset: 0x033E (R/W)  Interrupt Priority Register 
NVIC_IPR63                  EQU      NVIC_BASE + 0x033F             ; Offset: 0x033F (R/W)  Interrupt Priority Register 
NVIC_IPR64                  EQU      NVIC_BASE + 0x0340             ; Offset: 0x0340 (R/W)  Interrupt Priority Register 
NVIC_IPR65                  EQU      NVIC_BASE + 0x0341             ; Offset: 0x0341 (R/W)  Interrupt Priority Register 
NVIC_IPR66                  EQU      NVIC_BASE + 0x0342             ; Offset: 0x0342 (R/W)  Interrupt Priority Register 
NVIC_IPR67                  EQU      NVIC_BASE + 0x0343             ; Offset: 0x0343 (R/W)  Interrupt Priority Register 
NVIC_IPR68                  EQU      NVIC_BASE + 0x0344             ; Offset: 0x0344 (R/W)  Interrupt Priority Register 
NVIC_IPR69                  EQU      NVIC_BASE + 0x0345             ; Offset: 0x0345 (R/W)  Interrupt Priority Register 
NVIC_IPR70                  EQU      NVIC_BASE + 0x0346             ; Offset: 0x0346 (R/W)  Interrupt Priority Register 
NVIC_IPR71                  EQU      NVIC_BASE + 0x0347             ; Offset: 0x0347 (R/W)  Interrupt Priority Register 
NVIC_IPR72                  EQU      NVIC_BASE + 0x0348             ; Offset: 0x0348 (R/W)  Interrupt Priority Register 
NVIC_IPR73                  EQU      NVIC_BASE + 0x0349             ; Offset: 0x0349 (R/W)  Interrupt Priority Register 
NVIC_IPR74                  EQU      NVIC_BASE + 0x034A             ; Offset: 0x034A (R/W)  Interrupt Priority Register 
NVIC_IPR75                  EQU      NVIC_BASE + 0x034B             ; Offset: 0x034B (R/W)  Interrupt Priority Register 
NVIC_IPR76                  EQU      NVIC_BASE + 0x034C             ; Offset: 0x034C (R/W)  Interrupt Priority Register 
NVIC_IPR77                  EQU      NVIC_BASE + 0x034D             ; Offset: 0x034D (R/W)  Interrupt Priority Register 
NVIC_IPR78                  EQU      NVIC_BASE + 0x034E             ; Offset: 0x034E (R/W)  Interrupt Priority Register 
NVIC_IPR79                  EQU      NVIC_BASE + 0x034F             ; Offset: 0x034F (R/W)  Interrupt Priority Register 
NVIC_IPR80                  EQU      NVIC_BASE + 0x0350             ; Offset: 0x0350 (R/W)  Interrupt Priority Register 
NVIC_IPR81                  EQU      NVIC_BASE + 0x0351             ; Offset: 0x0351 (R/W)  Interrupt Priority Register 
NVIC_IPR82                  EQU      NVIC_BASE + 0x0352             ; Offset: 0x0352 (R/W)  Interrupt Priority Register     
NVIC_IPR83                  EQU      NVIC_BASE + 0x0353             ; Offset: 0x0353 (R/W)  Interrupt Priority Register 
NVIC_IPR84                  EQU      NVIC_BASE + 0x0354             ; Offset: 0x0354 (R/W)  Interrupt Priority Register 
NVIC_IPR85                  EQU      NVIC_BASE + 0x0355             ; Offset: 0x0355 (R/W)  Interrupt Priority Register 
NVIC_IPR86                  EQU      NVIC_BASE + 0x0356             ; Offset: 0x0356 (R/W)  Interrupt Priority Register 
NVIC_IPR87                  EQU      NVIC_BASE + 0x0357             ; Offset: 0x0357 (R/W)  Interrupt Priority Register 
NVIC_IPR88                  EQU      NVIC_BASE + 0x0358             ; Offset: 0x0358 (R/W)  Interrupt Priority Register 
NVIC_IPR89                  EQU      NVIC_BASE + 0x0359             ; Offset: 0x0359 (R/W)  Interrupt Priority Register 
NVIC_IPR90                  EQU      NVIC_BASE + 0x035A             ; Offset: 0x035A (R/W)  Interrupt Priority Register 
NVIC_IPR91                  EQU      NVIC_BASE + 0x035B             ; Offset: 0x035B (R/W)  Interrupt Priority Register 
NVIC_IPR92                  EQU      NVIC_BASE + 0x035C             ; Offset: 0x035C (R/W)  Interrupt Priority Register 
NVIC_IPR93                  EQU      NVIC_BASE + 0x035D             ; Offset: 0x035D (R/W)  Interrupt Priority Register 
NVIC_IPR94                  EQU      NVIC_BASE + 0x035E             ; Offset: 0x035E (R/W)  Interrupt Priority Register 
NVIC_IPR95                  EQU      NVIC_BASE + 0x035F             ; Offset: 0x035F (R/W)  Interrupt Priority Register 
NVIC_IPR96                  EQU      NVIC_BASE + 0x0360             ; Offset: 0x0360 (R/W)  Interrupt Priority Register 
NVIC_IPR97                  EQU      NVIC_BASE + 0x0361             ; Offset: 0x0361 (R/W)  Interrupt Priority Register    
NVIC_IPR98                  EQU      NVIC_BASE + 0x0362             ; Offset: 0x0362 (R/W)  Interrupt Priority Register 
NVIC_IPR99                  EQU      NVIC_BASE + 0x0363             ; Offset: 0x0363 (R/W)  Interrupt Priority Register 
NVIC_IPR100                 EQU      NVIC_BASE + 0x0364             ; Offset: 0x0364 (R/W)  Interrupt Priority Register 
NVIC_IPR101                 EQU      NVIC_BASE + 0x0365             ; Offset: 0x0365 (R/W)  Interrupt Priority Register     
NVIC_IPR102                 EQU      NVIC_BASE + 0x0366             ; Offset: 0x0366 (R/W)  Interrupt Priority Register 
NVIC_IPR103                 EQU      NVIC_BASE + 0x0367             ; Offset: 0x0367 (R/W)  Interrupt Priority Register 
NVIC_IPR104                 EQU      NVIC_BASE + 0x0368             ; Offset: 0x0368 (R/W)  Interrupt Priority Register 
NVIC_IPR105                 EQU      NVIC_BASE + 0x0369             ; Offset: 0x0369 (R/W)  Interrupt Priority Register 
NVIC_IPR106                 EQU      NVIC_BASE + 0x036A             ; Offset: 0x036A (R/W)  Interrupt Priority Register 
NVIC_IPR107                 EQU      NVIC_BASE + 0x036B             ; Offset: 0x036B (R/W)  Interrupt Priority Register     
NVIC_IPR108                 EQU      NVIC_BASE + 0x036C             ; Offset: 0x036C (R/W)  Interrupt Priority Register     
NVIC_IPR109                 EQU      NVIC_BASE + 0x036D             ; Offset: 0x036D (R/W)  Interrupt Priority Register 
NVIC_IPR110                 EQU      NVIC_BASE + 0x036E             ; Offset: 0x036E (R/W)  Interrupt Priority Register 
NVIC_IPR111                 EQU      NVIC_BASE + 0x036F             ; Offset: 0x036F (R/W)  Interrupt Priority Register 
NVIC_IPR112                 EQU      NVIC_BASE + 0x0370             ; Offset: 0x0370 (R/W)  Interrupt Priority Register     
NVIC_IPR113                 EQU      NVIC_BASE + 0x0371             ; Offset: 0x0371 (R/W)  Interrupt Priority Register 
NVIC_IPR114                 EQU      NVIC_BASE + 0x0372             ; Offset: 0x0372 (R/W)  Interrupt Priority Register 
NVIC_IPR115                 EQU      NVIC_BASE + 0x0373             ; Offset: 0x0373 (R/W)  Interrupt Priority Register     
NVIC_IPR116                 EQU      NVIC_BASE + 0x0374             ; Offset: 0x0374 (R/W)  Interrupt Priority Register     
NVIC_IPR117                 EQU      NVIC_BASE + 0x0375             ; Offset: 0x0375 (R/W)  Interrupt Priority Register 
NVIC_IPR118                 EQU      NVIC_BASE + 0x0376             ; Offset: 0x0376 (R/W)  Interrupt Priority Register 
NVIC_IPR119                 EQU      NVIC_BASE + 0x0377             ; Offset: 0x0377 (R/W)  Interrupt Priority Register 
NVIC_IPR120                 EQU      NVIC_BASE + 0x0378             ; Offset: 0x0378 (R/W)  Interrupt Priority Register 
NVIC_IPR121                 EQU      NVIC_BASE + 0x0379             ; Offset: 0x0379 (R/W)  Interrupt Priority Register 
NVIC_IPR122                 EQU      NVIC_BASE + 0x037A             ; Offset: 0x037A (R/W)  Interrupt Priority Register 
NVIC_IPR123                 EQU      NVIC_BASE + 0x037B             ; Offset: 0x037B (R/W)  Interrupt Priority Register 
NVIC_IPR124                 EQU      NVIC_BASE + 0x037C             ; Offset: 0x037C (R/W)  Interrupt Priority Register 
NVIC_IPR125                 EQU      NVIC_BASE + 0x037D             ; Offset: 0x037D (R/W)  Interrupt Priority Register 
NVIC_IPR126                 EQU      NVIC_BASE + 0x037E             ; Offset: 0x037E (R/W)  Interrupt Priority Register 
NVIC_IPR127                 EQU      NVIC_BASE + 0x037F             ; Offset: 0x037F (R/W)  Interrupt Priority Register 
NVIC_IPR128                 EQU      NVIC_BASE + 0x0380             ; Offset: 0x0380 (R/W)  Interrupt Priority Register     
NVIC_IPR129                 EQU      NVIC_BASE + 0x0381             ; Offset: 0x0381 (R/W)  Interrupt Priority Register     
NVIC_IPR130                 EQU      NVIC_BASE + 0x0382             ; Offset: 0x0382 (R/W)  Interrupt Priority Register 
NVIC_IPR131                 EQU      NVIC_BASE + 0x0383             ; Offset: 0x0383 (R/W)  Interrupt Priority Register 
NVIC_IPR132                 EQU      NVIC_BASE + 0x0384             ; Offset: 0x0384 (R/W)  Interrupt Priority Register 
NVIC_IPR133                 EQU      NVIC_BASE + 0x0385             ; Offset: 0x0385 (R/W)  Interrupt Priority Register 
NVIC_IPR134                 EQU      NVIC_BASE + 0x0386             ; Offset: 0x0386 (R/W)  Interrupt Priority Register 
NVIC_IPR135                 EQU      NVIC_BASE + 0x0387             ; Offset: 0x0387 (R/W)  Interrupt Priority Register 
NVIC_IPR136                 EQU      NVIC_BASE + 0x0388             ; Offset: 0x0388 (R/W)  Interrupt Priority Register 
NVIC_IPR137                 EQU      NVIC_BASE + 0x0389             ; Offset: 0x0389 (R/W)  Interrupt Priority Register 
NVIC_IPR138                 EQU      NVIC_BASE + 0x038A             ; Offset: 0x038A (R/W)  Interrupt Priority Register 
NVIC_IPR139                 EQU      NVIC_BASE + 0x038B             ; Offset: 0x038B (R/W)  Interrupt Priority Register 
NVIC_IPR140                 EQU      NVIC_BASE + 0x038C             ; Offset: 0x038C (R/W)  Interrupt Priority Register 
NVIC_IPR141                 EQU      NVIC_BASE + 0x038D             ; Offset: 0x038D (R/W)  Interrupt Priority Register 
NVIC_IPR142                 EQU      NVIC_BASE + 0x038E             ; Offset: 0x038E (R/W)  Interrupt Priority Register 
NVIC_IPR143                 EQU      NVIC_BASE + 0x038F             ; Offset: 0x038F (R/W)  Interrupt Priority Register 
NVIC_IPR144                 EQU      NVIC_BASE + 0x0390             ; Offset: 0x0390 (R/W)  Interrupt Priority Register 
NVIC_IPR145                 EQU      NVIC_BASE + 0x0391             ; Offset: 0x0391 (R/W)  Interrupt Priority Register 
NVIC_IPR146                 EQU      NVIC_BASE + 0x0392             ; Offset: 0x0392 (R/W)  Interrupt Priority Register 
NVIC_IPR147                 EQU      NVIC_BASE + 0x0393             ; Offset: 0x0393 (R/W)  Interrupt Priority Register 
NVIC_IPR148                 EQU      NVIC_BASE + 0x0394             ; Offset: 0x0394 (R/W)  Interrupt Priority Register 
NVIC_IPR149                 EQU      NVIC_BASE + 0x0395             ; Offset: 0x0395 (R/W)  Interrupt Priority Register 
NVIC_IPR150                 EQU      NVIC_BASE + 0x0396             ; Offset: 0x0396 (R/W)  Interrupt Priority Register 
NVIC_IPR151                 EQU      NVIC_BASE + 0x0397             ; Offset: 0x0397 (R/W)  Interrupt Priority Register 
NVIC_IPR152                 EQU      NVIC_BASE + 0x0398             ; Offset: 0x0398 (R/W)  Interrupt Priority Register 
NVIC_IPR153                 EQU      NVIC_BASE + 0x0399             ; Offset: 0x0399 (R/W)  Interrupt Priority Register 
NVIC_IPR154                 EQU      NVIC_BASE + 0x039A             ; Offset: 0x039A (R/W)  Interrupt Priority Register 
NVIC_IPR155                 EQU      NVIC_BASE + 0x039B             ; Offset: 0x039B (R/W)  Interrupt Priority Register 
NVIC_IPR156                 EQU      NVIC_BASE + 0x039C             ; Offset: 0x039C (R/W)  Interrupt Priority Register 
NVIC_IPR157                 EQU      NVIC_BASE + 0x039D             ; Offset: 0x039D (R/W)  Interrupt Priority Register 
NVIC_IPR158                 EQU      NVIC_BASE + 0x039E             ; Offset: 0x039E (R/W)  Interrupt Priority Register 
NVIC_IPR159                 EQU      NVIC_BASE + 0x039F             ; Offset: 0x039F (R/W)  Interrupt Priority Register 
NVIC_IPR160                 EQU      NVIC_BASE + 0x03A0             ; Offset: 0x03A0 (R/W)  Interrupt Priority Register 
NVIC_IPR161                 EQU      NVIC_BASE + 0x03A1             ; Offset: 0x03A1 (R/W)  Interrupt Priority Register 
NVIC_IPR162                 EQU      NVIC_BASE + 0x03A2             ; Offset: 0x03A2 (R/W)  Interrupt Priority Register 
NVIC_IPR163                 EQU      NVIC_BASE + 0x03A3             ; Offset: 0x03A3 (R/W)  Interrupt Priority Register 
NVIC_IPR164                 EQU      NVIC_BASE + 0x03A4             ; Offset: 0x03A4 (R/W)  Interrupt Priority Register 
NVIC_IPR165                 EQU      NVIC_BASE + 0x03A5             ; Offset: 0x03A5 (R/W)  Interrupt Priority Register 
NVIC_IPR166                 EQU      NVIC_BASE + 0x03A6             ; Offset: 0x03A6 (R/W)  Interrupt Priority Register 
NVIC_IPR167                 EQU      NVIC_BASE + 0x03A7             ; Offset: 0x03A7 (R/W)  Interrupt Priority Register 
NVIC_IPR168                 EQU      NVIC_BASE + 0x03A8             ; Offset: 0x03A8 (R/W)  Interrupt Priority Register 
NVIC_IPR169                 EQU      NVIC_BASE + 0x03A9             ; Offset: 0x03A9 (R/W)  Interrupt Priority Register 
NVIC_IPR170                 EQU      NVIC_BASE + 0x03AA             ; Offset: 0x03AA (R/W)  Interrupt Priority Register 
NVIC_IPR171                 EQU      NVIC_BASE + 0x03AB             ; Offset: 0x03AB (R/W)  Interrupt Priority Register 
NVIC_IPR172                 EQU      NVIC_BASE + 0x03AC             ; Offset: 0x03AC (R/W)  Interrupt Priority Register     
NVIC_IPR173                 EQU      NVIC_BASE + 0x03AD             ; Offset: 0x03AD (R/W)  Interrupt Priority Register 
NVIC_IPR174                 EQU      NVIC_BASE + 0x03AE             ; Offset: 0x03AE (R/W)  Interrupt Priority Register 
NVIC_IPR175                 EQU      NVIC_BASE + 0x03AF             ; Offset: 0x03AF (R/W)  Interrupt Priority Register 
NVIC_IPR176                 EQU      NVIC_BASE + 0x03B0             ; Offset: 0x03B0 (R/W)  Interrupt Priority Register 
NVIC_IPR177                 EQU      NVIC_BASE + 0x03B1             ; Offset: 0x03B1 (R/W)  Interrupt Priority Register 
NVIC_IPR178                 EQU      NVIC_BASE + 0x03B2             ; Offset: 0x03B2 (R/W)  Interrupt Priority Register 
NVIC_IPR179                 EQU      NVIC_BASE + 0x03B3             ; Offset: 0x03B3 (R/W)  Interrupt Priority Register 
NVIC_IPR180                 EQU      NVIC_BASE + 0x03B4             ; Offset: 0x03B4 (R/W)  Interrupt Priority Register 
NVIC_IPR181                 EQU      NVIC_BASE + 0x03B5             ; Offset: 0x03B5 (R/W)  Interrupt Priority Register 
NVIC_IPR182                 EQU      NVIC_BASE + 0x03B6             ; Offset: 0x03B6 (R/W)  Interrupt Priority Register 
NVIC_IPR183                 EQU      NVIC_BASE + 0x03B7             ; Offset: 0x03B7 (R/W)  Interrupt Priority Register 
NVIC_IPR184                 EQU      NVIC_BASE + 0x03B8             ; Offset: 0x03B8 (R/W)  Interrupt Priority Register    
NVIC_IPR185                 EQU      NVIC_BASE + 0x03B9             ; Offset: 0x03B9 (R/W)  Interrupt Priority Register 
NVIC_IPR186                 EQU      NVIC_BASE + 0x03BA             ; Offset: 0x03BA (R/W)  Interrupt Priority Register 
NVIC_IPR187                 EQU      NVIC_BASE + 0x03BB             ; Offset: 0x03BB (R/W)  Interrupt Priority Register 
NVIC_IPR188                 EQU      NVIC_BASE + 0x03BC             ; Offset: 0x03BC (R/W)  Interrupt Priority Register 
NVIC_IPR189                 EQU      NVIC_BASE + 0x03BD             ; Offset: 0x03BD (R/W)  Interrupt Priority Register     
NVIC_IPR190                 EQU      NVIC_BASE + 0x03BE             ; Offset: 0x03BE (R/W)  Interrupt Priority Register 
NVIC_IPR191                 EQU      NVIC_BASE + 0x03BF             ; Offset: 0x03BF (R/W)  Interrupt Priority Register 
NVIC_IPR192                 EQU      NVIC_BASE + 0x03C0             ; Offset: 0x03C0 (R/W)  Interrupt Priority Register     
NVIC_IPR193                 EQU      NVIC_BASE + 0x03C1             ; Offset: 0x03C1 (R/W)  Interrupt Priority Register     
NVIC_IPR194                 EQU      NVIC_BASE + 0x03C2             ; Offset: 0x03C2 (R/W)  Interrupt Priority Register 
NVIC_IPR195                 EQU      NVIC_BASE + 0x03C3             ; Offset: 0x03C3 (R/W)  Interrupt Priority Register 
NVIC_IPR196                 EQU      NVIC_BASE + 0x03C4             ; Offset: 0x03C4 (R/W)  Interrupt Priority Register 
NVIC_IPR197                 EQU      NVIC_BASE + 0x03C5             ; Offset: 0x03C5 (R/W)  Interrupt Priority Register 
NVIC_IPR198                 EQU      NVIC_BASE + 0x03C6             ; Offset: 0x03C6 (R/W)  Interrupt Priority Register 
NVIC_IPR199                 EQU      NVIC_BASE + 0x03C7             ; Offset: 0x03C7 (R/W)  Interrupt Priority Register 
NVIC_IPR200                 EQU      NVIC_BASE + 0x03C8             ; Offset: 0x03C8 (R/W)  Interrupt Priority Register 
NVIC_IPR201                 EQU      NVIC_BASE + 0x03C9             ; Offset: 0x03C9 (R/W)  Interrupt Priority Register 
NVIC_IPR202                 EQU      NVIC_BASE + 0x03CA             ; Offset: 0x03CA (R/W)  Interrupt Priority Register 
NVIC_IPR203                 EQU      NVIC_BASE + 0x03CB             ; Offset: 0x03CB (R/W)  Interrupt Priority Register 
NVIC_IPR204                 EQU      NVIC_BASE + 0x03CC             ; Offset: 0x03CC (R/W)  Interrupt Priority Register 
NVIC_IPR205                 EQU      NVIC_BASE + 0x03CD             ; Offset: 0x03CD (R/W)  Interrupt Priority Register 
NVIC_IPR206                 EQU      NVIC_BASE + 0x03CE             ; Offset: 0x03CE (R/W)  Interrupt Priority Register 
NVIC_IPR207                 EQU      NVIC_BASE + 0x03CF             ; Offset: 0x03CF (R/W)  Interrupt Priority Register     
NVIC_IPR208                 EQU      NVIC_BASE + 0x03D0             ; Offset: 0x03D0 (R/W)  Interrupt Priority Register 
NVIC_IPR209                 EQU      NVIC_BASE + 0x03D1             ; Offset: 0x03D1 (R/W)  Interrupt Priority Register 
NVIC_IPR210                 EQU      NVIC_BASE + 0x03D2             ; Offset: 0x03D2 (R/W)  Interrupt Priority Register 
NVIC_IPR211                 EQU      NVIC_BASE + 0x03D3             ; Offset: 0x03D3 (R/W)  Interrupt Priority Register 
NVIC_IPR212                 EQU      NVIC_BASE + 0x03D4             ; Offset: 0x03D4 (R/W)  Interrupt Priority Register 
NVIC_IPR213                 EQU      NVIC_BASE + 0x03D5             ; Offset: 0x03D5 (R/W)  Interrupt Priority Register     
NVIC_IPR214                 EQU      NVIC_BASE + 0x03D6             ; Offset: 0x03D6 (R/W)  Interrupt Priority Register 
NVIC_IPR215                 EQU      NVIC_BASE + 0x03D7             ; Offset: 0x03D7 (R/W)  Interrupt Priority Register 
NVIC_IPR216                 EQU      NVIC_BASE + 0x03D8             ; Offset: 0x03D8 (R/W)  Interrupt Priority Register 
NVIC_IPR217                 EQU      NVIC_BASE + 0x03D9             ; Offset: 0x03D9 (R/W)  Interrupt Priority Register 
NVIC_IPR218                 EQU      NVIC_BASE + 0x03DA             ; Offset: 0x03DA (R/W)  Interrupt Priority Register 
NVIC_IPR219                 EQU      NVIC_BASE + 0x03DB             ; Offset: 0x03DB (R/W)  Interrupt Priority Register     
NVIC_IPR220                 EQU      NVIC_BASE + 0x03DC             ; Offset: 0x03DC (R/W)  Interrupt Priority Register     
NVIC_IPR221                 EQU      NVIC_BASE + 0x03DD             ; Offset: 0x03DD (R/W)  Interrupt Priority Register 
NVIC_IPR222                 EQU      NVIC_BASE + 0x03DE             ; Offset: 0x03DE (R/W)  Interrupt Priority Register 
NVIC_IPR223                 EQU      NVIC_BASE + 0x03DF             ; Offset: 0x03DF (R/W)  Interrupt Priority Register 
NVIC_IPR224                 EQU      NVIC_BASE + 0x03E0             ; Offset: 0x03E0 (R/W)  Interrupt Priority Register 
NVIC_IPR225                 EQU      NVIC_BASE + 0x03E1             ; Offset: 0x03E1 (R/W)  Interrupt Priority Register 
NVIC_IPR226                 EQU      NVIC_BASE + 0x03E2             ; Offset: 0x03E2 (R/W)  Interrupt Priority Register 
NVIC_IPR227                 EQU      NVIC_BASE + 0x03E3             ; Offset: 0x03E3 (R/W)  Interrupt Priority Register 
NVIC_IPR228                 EQU      NVIC_BASE + 0x03E4             ; Offset: 0x03E4 (R/W)  Interrupt Priority Register 
NVIC_IPR229                 EQU      NVIC_BASE + 0x03E5             ; Offset: 0x03E5 (R/W)  Interrupt Priority Register 
NVIC_IPR230                 EQU      NVIC_BASE + 0x03E6             ; Offset: 0x03E6 (R/W)  Interrupt Priority Register 
NVIC_IPR231                 EQU      NVIC_BASE + 0x03E7             ; Offset: 0x03E7 (R/W)  Interrupt Priority Register 
NVIC_IPR232                 EQU      NVIC_BASE + 0x03E8             ; Offset: 0x03E8 (R/W)  Interrupt Priority Register 
NVIC_IPR233                 EQU      NVIC_BASE + 0x03E9             ; Offset: 0x03E9 (R/W)  Interrupt Priority Register 
NVIC_IPR234                 EQU      NVIC_BASE + 0x03EA             ; Offset: 0x03EA (R/W)  Interrupt Priority Register 
NVIC_IPR235                 EQU      NVIC_BASE + 0x03EB             ; Offset: 0x03EB (R/W)  Interrupt Priority Register 
NVIC_IPR236                 EQU      NVIC_BASE + 0x03EC             ; Offset: 0x03EC (R/W)  Interrupt Priority Register 
NVIC_IPR237                 EQU      NVIC_BASE + 0x03ED             ; Offset: 0x03ED (R/W)  Interrupt Priority Register 
NVIC_IPR238                 EQU      NVIC_BASE + 0x03EE             ; Offset: 0x03EE (R/W)  Interrupt Priority Register 
NVIC_IPR239                 EQU      NVIC_BASE + 0x03EF             ; Offset: 0x03EF (R/W)  Interrupt Priority Register    

NVIC_STIR                   EQU      NVIC_BASE + 0x0E00             ; Offset: 0xE00 ( /W)  Software Trigger Interrupt Register      




;************************************************************System timer******************************************************************************* 

;*************************************************************Peripheral memory map*********************************************************************

APB1PERIPH_BASE             EQU     PERIPH_BASE
APB2PERIPH_BASE             EQU     PERIPH_BASE     + 0x00010000  
AHB1PERIPH_BASE             EQU     PERIPH_BASE     + 0x00020000  
AHB2PERIPH_BASE             EQU     PERIPH_BASE     + 0x10000000  

;***************************************************************APB1 peripherals************************************************************************

;***************************************************************TIM2 peripherals************************************************************************
TIM2_BASE                   EQU     APB1PERIPH_BASE + 0x0000  
TIM2_CR1                    EQU     TIM2_BASE  + 0x0000             ; TIM2 control register 1,                                      Address offset: 0x00  
TIM2_CR2                    EQU     TIM2_BASE  + 0x0004             ; TIM2 control register 2,                                      Address offset: 0x04  
TIM2_SMCR                   EQU     TIM2_BASE  + 0x0008             ; TIM2 slave mode control register,                             Address offset: 0x08  
TIM2_DIER                   EQU     TIM2_BASE  + 0x000C             ; TIM2 DMA/interrupt enable register,                           Address offset: 0x0C  
TIM2_SR                     EQU     TIM2_BASE  + 0x0010             ; TIM2 status register,                                         Address offset: 0x10  
TIM2_EGR                    EQU     TIM2_BASE  + 0x0014             ; TIM2 event generation register,                               Address offset: 0x14  
TIM2_CCMR1                  EQU     TIM2_BASE  + 0x0018             ; TIM2 capture/compare mode register 1,                         Address offset: 0x18  
TIM2_CCMR2                  EQU     TIM2_BASE  + 0x001C             ; TIM2 capture/compare mode register 2,                         Address offset: 0x1C  
TIM2_CCER                   EQU     TIM2_BASE  + 0x0020             ; TIM2 capture/compare enable register,                         Address offset: 0x20  
TIM2_CNT                    EQU     TIM2_BASE  + 0x0024             ; TIM2 counter register,                                        Address offset: 0x24  
TIM2_PSC                    EQU     TIM2_BASE  + 0x0028             ; TIM2 prescaler,                                               Address offset: 0x28  
TIM2_ARR                    EQU     TIM2_BASE  + 0x002C             ; TIM2 auto-reload register,                                    Address offset: 0x2C  
TIM2_CCR1                   EQU     TIM2_BASE  + 0x0034             ; TIM2 capture/compare register 1,                              Address offset: 0x34  
TIM2_CCR2                   EQU     TIM2_BASE  + 0x0038             ; TIM2 capture/compare register 2,                              Address offset: 0x38  
TIM2_CCR3                   EQU     TIM2_BASE  + 0x003C             ; TIM2 capture/compare register 3,                              Address offset: 0x3C  
TIM2_CCR4                   EQU     TIM2_BASE  + 0x0040             ; TIM2 capture/compare register 4,                              Address offset: 0x40  
TIM2_DCR                    EQU     TIM2_BASE  + 0x0048             ; TIM2 DMA control register,                                    Address offset: 0x48  
TIM2_DMAR                   EQU     TIM2_BASE  + 0x004C             ; TIM2 DMA address for full transfer,                           Address offset: 0x4C  
TIM2_OR                     EQU     TIM2_BASE  + 0x0050             ; TIM2 option register,                                         Address offset: 0x50  

;***************************************************************TIM3 peripherals************************************************************************
TIM3_BASE                   EQU     APB1PERIPH_BASE + 0x0400 
TIM3_CR1                    EQU     TIM3_BASE  + 0x0000             ; TIM3 control register 1,                                      Address offset: 0x00  
TIM3_CR2                    EQU     TIM3_BASE  + 0x0004             ; TIM3 control register 2,                                      Address offset: 0x04  
TIM3_SMCR                   EQU     TIM3_BASE  + 0x0008             ; TIM3 slave mode control register,                             Address offset: 0x08  
TIM3_DIER                   EQU     TIM3_BASE  + 0x000C             ; TIM3 DMA/interrupt enable register,                           Address offset: 0x0C  
TIM3_SR                     EQU     TIM3_BASE  + 0x0010             ; TIM3 status register,                                         Address offset: 0x10  
TIM3_EGR                    EQU     TIM3_BASE  + 0x0014             ; TIM3 event generation register,                               Address offset: 0x14  
TIM3_CCMR1                  EQU     TIM3_BASE  + 0x0018             ; TIM3 capture/compare mode register 1,                         Address offset: 0x18  
TIM3_CCMR2                  EQU     TIM3_BASE  + 0x001C             ; TIM3 capture/compare mode register 2,                         Address offset: 0x1C  
TIM3_CCER                   EQU     TIM3_BASE  + 0x0020             ; TIM3 capture/compare enable register,                         Address offset: 0x20  
TIM3_CNT                    EQU     TIM3_BASE  + 0x0024             ; TIM3 counter register,                                        Address offset: 0x24  
TIM3_PSC                    EQU     TIM3_BASE  + 0x0028             ; TIM3 prescaler,                                               Address offset: 0x28  
TIM3_ARR                    EQU     TIM3_BASE  + 0x002C             ; TIM3 auto-reload register,                                    Address offset: 0x2C  
TIM3_CCR1                   EQU     TIM3_BASE  + 0x0034             ; TIM3 capture/compare register 1,                              Address offset: 0x34  
TIM3_CCR2                   EQU     TIM3_BASE  + 0x0038             ; TIM3 capture/compare register 2,                              Address offset: 0x38  
TIM3_CCR3                   EQU     TIM3_BASE  + 0x003C             ; TIM3 capture/compare register 3,                              Address offset: 0x3C  
TIM3_CCR4                   EQU     TIM3_BASE  + 0x0040             ; TIM3 capture/compare register 4,                              Address offset: 0x40  
TIM3_DCR                    EQU     TIM3_BASE  + 0x0048             ; TIM3 DMA control register,                                    Address offset: 0x48  
TIM3_DMAR                   EQU     TIM3_BASE  + 0x004C             ; TIM3 DMA address for full transfer,                           Address offset: 0x4C  


;***************************************************************TIM4 peripherals************************************************************************
TIM4_BASE                   EQU     APB1PERIPH_BASE + 0x0800  
TIM4_CR1                    EQU     TIM4_BASE  + 0x0000             ; TIM4 control register 1,                                      Address offset: 0x00  
TIM4_CR2                    EQU     TIM4_BASE  + 0x0004             ; TIM4 control register 2,                                      Address offset: 0x04  
TIM4_SMCR                   EQU     TIM4_BASE  + 0x0008             ; TIM4 slave mode control register,                             Address offset: 0x08  
TIM4_DIER                   EQU     TIM4_BASE  + 0x000C             ; TIM4 DMA/interrupt enable register,                           Address offset: 0x0C  
TIM4_SR                     EQU     TIM4_BASE  + 0x0010             ; TIM4 status register,                                         Address offset: 0x10  
TIM4_EGR                    EQU     TIM4_BASE  + 0x0014             ; TIM4 event generation register,                               Address offset: 0x14  
TIM4_CCMR1                  EQU     TIM4_BASE  + 0x0018             ; TIM4 capture/compare mode register 1,                         Address offset: 0x18  
TIM4_CCMR2                  EQU     TIM4_BASE  + 0x001C             ; TIM4 capture/compare mode register 2,                         Address offset: 0x1C  
TIM4_CCER                   EQU     TIM4_BASE  + 0x0020             ; TIM4 capture/compare enable register,                         Address offset: 0x20  
TIM4_CNT                    EQU     TIM4_BASE  + 0x0024             ; TIM4 counter register,                                        Address offset: 0x24  
TIM4_PSC                    EQU     TIM4_BASE  + 0x0028             ; TIM4 prescaler,                                               Address offset: 0x28  
TIM4_ARR                    EQU     TIM4_BASE  + 0x002C             ; TIM4 auto-reload register,                                    Address offset: 0x2C  
TIM4_CCR1                   EQU     TIM4_BASE  + 0x0034             ; TIM4 capture/compare register 1,                              Address offset: 0x34  
TIM4_CCR2                   EQU     TIM4_BASE  + 0x0038             ; TIM4 capture/compare register 2,                              Address offset: 0x38  
TIM4_CCR3                   EQU     TIM4_BASE  + 0x003C             ; TIM4 capture/compare register 3,                              Address offset: 0x3C  
TIM4_CCR4                   EQU     TIM4_BASE  + 0x0040             ; TIM4 capture/compare register 4,                              Address offset: 0x40  
TIM4_DCR                    EQU     TIM4_BASE  + 0x0048             ; TIM4 DMA control register,                                    Address offset: 0x48  
TIM4_DMAR                   EQU     TIM4_BASE  + 0x004C             ; TIM4 DMA address for full transfer,                           Address offset: 0x4C  


;***************************************************************TIM5 peripherals************************************************************************
TIM5_BASE                   EQU     APB1PERIPH_BASE + 0x0C00 
TIM5_CR1                    EQU     TIM5_BASE  + 0x0000             ; TIM5 control register 1,                                      Address offset: 0x00  
TIM5_CR2                    EQU     TIM5_BASE  + 0x0004             ; TIM5 control register 2,                                      Address offset: 0x04  
TIM5_SMCR                   EQU     TIM5_BASE  + 0x0008             ; TIM5 slave mode control register,                             Address offset: 0x08  
TIM5_DIER                   EQU     TIM5_BASE  + 0x000C             ; TIM5 DMA/interrupt enable register,                           Address offset: 0x0C  
TIM5_SR                     EQU     TIM5_BASE  + 0x0010             ; TIM5 status register,                                         Address offset: 0x10  
TIM5_EGR                    EQU     TIM5_BASE  + 0x0014             ; TIM5 event generation register,                               Address offset: 0x14  
TIM5_CCMR1                  EQU     TIM5_BASE  + 0x0018             ; TIM5 capture/compare mode register 1,                         Address offset: 0x18  
TIM5_CCMR2                  EQU     TIM5_BASE  + 0x001C             ; TIM5 capture/compare mode register 2,                         Address offset: 0x1C  
TIM5_CCER                   EQU     TIM5_BASE  + 0x0020             ; TIM5 capture/compare enable register,                         Address offset: 0x20  
TIM5_CNT                    EQU     TIM5_BASE  + 0x0024             ; TIM5 counter register,                                        Address offset: 0x24  
TIM5_PSC                    EQU     TIM5_BASE  + 0x0028             ; TIM5 prescaler,                                               Address offset: 0x28  
TIM5_ARR                    EQU     TIM5_BASE  + 0x002C             ; TIM5 auto-reload register,                                    Address offset: 0x2C  
TIM5_CCR1                   EQU     TIM5_BASE  + 0x0034             ; TIM5 capture/compare register 1,                              Address offset: 0x34  
TIM5_CCR2                   EQU     TIM5_BASE  + 0x0038             ; TIM5 capture/compare register 2,                              Address offset: 0x38  
TIM5_CCR3                   EQU     TIM5_BASE  + 0x003C             ; TIM5 capture/compare register 3,                              Address offset: 0x3C  
TIM5_CCR4                   EQU     TIM5_BASE  + 0x0040             ; TIM5 capture/compare register 4,                              Address offset: 0x40  
TIM5_DCR                    EQU     TIM5_BASE  + 0x0048             ; TIM5 DMA control register,                                    Address offset: 0x48  
TIM5_DMAR                   EQU     TIM5_BASE  + 0x004C             ; TIM5 DMA address for full transfer,                           Address offset: 0x4C  
TIM5_OR                     EQU     TIM5_BASE  + 0x0050             ; TIM5 option register,                                         Address offset: 0x50  

;***************************************************************TIM6 peripherals************************************************************************
TIM6_BASE                   EQU     APB1PERIPH_BASE + 0x1000  

;***************************************************************TIM7 peripherals************************************************************************
TIM7_BASE                   EQU     APB1PERIPH_BASE + 0x1400  

;**************************************************************TIM12 peripherals************************************************************************
TIM12_BASE                  EQU     APB1PERIPH_BASE + 0x1800  

;**************************************************************TIM13 peripherals************************************************************************
TIM13_BASE                  EQU     APB1PERIPH_BASE + 0x1C00  

;**************************************************************TIM14 peripherals************************************************************************
TIM14_BASE                  EQU     APB1PERIPH_BASE + 0x2000  


LPTIM1_BASE                 EQU     APB1PERIPH_BASE + 0x2400  
RTC_BASE                    EQU     APB1PERIPH_BASE + 0x2800  
WWDG_BASE                   EQU     APB1PERIPH_BASE + 0x2C00  
IWDG_BASE                   EQU     APB1PERIPH_BASE + 0x3000  
SPI2_BASE                   EQU     APB1PERIPH_BASE + 0x3800  
SPI3_BASE                   EQU     APB1PERIPH_BASE + 0x3C00  
SPDIFRX_BASE                EQU     APB1PERIPH_BASE + 0x4000  
USART2_BASE                 EQU     APB1PERIPH_BASE + 0x4400  
USART3_BASE                 EQU     APB1PERIPH_BASE + 0x4800  
UART4_BASE                  EQU     APB1PERIPH_BASE + 0x4C00  
UART5_BASE                  EQU     APB1PERIPH_BASE + 0x5000  
I2C1_BASE                   EQU     APB1PERIPH_BASE + 0x5400  
I2C2_BASE                   EQU     APB1PERIPH_BASE + 0x5800  
I2C3_BASE                   EQU     APB1PERIPH_BASE + 0x5C00  
I2C4_BASE                   EQU     APB1PERIPH_BASE + 0x6000  
CAN1_BASE                   EQU     APB1PERIPH_BASE + 0x6400  
CAN2_BASE                   EQU     APB1PERIPH_BASE + 0x6800  
CEC_BASE                    EQU     APB1PERIPH_BASE + 0x6C00  
    
PWR_BASE                    EQU     APB1PERIPH_BASE + 0x7000  
PWR_CR1                     EQU     PWR_BASE        + 0x0000    
PWR_CSR1                    EQU     PWR_BASE        + 0x0004    
PWR_CR2                     EQU     PWR_BASE        + 0x0008
PWR_CSR2                    EQU     PWR_BASE        + 0x000C

DAC_BASE                    EQU     APB1PERIPH_BASE + 0x7400  
UART7_BASE                  EQU     APB1PERIPH_BASE + 0x7800  
UART8_BASE                  EQU     APB1PERIPH_BASE + 0x7C00  

;***************************************************************APB2 peripherals************************************************************************

;***************************************************************TIM1 peripherals************************************************************************
TIM1_BASE                   EQU     APB2PERIPH_BASE + 0x0000  
TIM1_CR1                    EQU     TIM1_BASE  + 0x0000             ; TIM1 control register 1,                                      Address offset: 0x00  
TIM1_CR2                    EQU     TIM1_BASE  + 0x0004             ; TIM1 control register 2,                                      Address offset: 0x04  
TIM1_SMCR                   EQU     TIM1_BASE  + 0x0008             ; TIM1 slave mode control register,                             Address offset: 0x08  
TIM1_DIER                   EQU     TIM1_BASE  + 0x000C             ; TIM1 DMA/interrupt enable register,                           Address offset: 0x0C  
TIM1_SR                     EQU     TIM1_BASE  + 0x0010             ; TIM1 status register,                                         Address offset: 0x10  
TIM1_EGR                    EQU     TIM1_BASE  + 0x0014             ; TIM1 event generation register,                               Address offset: 0x14  
TIM1_CCMR1                  EQU     TIM1_BASE  + 0x0018             ; TIM1 capture/compare mode register 1,                         Address offset: 0x18  
TIM1_CCMR2                  EQU     TIM1_BASE  + 0x001C             ; TIM1 capture/compare mode register 2,                         Address offset: 0x1C  
TIM1_CCER                   EQU     TIM1_BASE  + 0x0020             ; TIM1 capture/compare enable register,                         Address offset: 0x20  
TIM1_CNT                    EQU     TIM1_BASE  + 0x0024             ; TIM1 counter register,                                        Address offset: 0x24  
TIM1_PSC                    EQU     TIM1_BASE  + 0x0028             ; TIM1 prescaler,                                               Address offset: 0x28  
TIM1_ARR                    EQU     TIM1_BASE  + 0x002C             ; TIM1 auto-reload register,                                    Address offset: 0x2C 
TIM1_RCR                    EQU     TIM1_BASE  + 0x002C             ; TIM1 repetition counter register,                             Address offset: 0x30  
TIM1_CCR1                   EQU     TIM1_BASE  + 0x0034             ; TIM1 capture/compare register 1,                              Address offset: 0x34  
TIM1_CCR2                   EQU     TIM1_BASE  + 0x0038             ; TIM1 capture/compare register 2,                              Address offset: 0x38  
TIM1_CCR3                   EQU     TIM1_BASE  + 0x003C             ; TIM1 capture/compare register 3,                              Address offset: 0x3C  
TIM1_CCR4                   EQU     TIM1_BASE  + 0x0040             ; TIM1 capture/compare register 4,                              Address offset: 0x40  
TIM1_BDTR                   EQU     TIM1_BASE  + 0x0040             ; TIM1 break and dead-time register,                            Address offset: 0x44  
TIM1_DCR                    EQU     TIM1_BASE  + 0x0048             ; TIM1 DMA control register,                                    Address offset: 0x48  
TIM1_DMAR                   EQU     TIM1_BASE  + 0x004C             ; TIM1 DMA address for full transfer,                           Address offset: 0x4C  
TIM1_OR                     EQU     TIM1_BASE  + 0x0050             ; TIM1 option register,                                         Address offset: 0x50  
TIM1_CCMR3                  EQU     TIM1_BASE  + 0x0054             ; TIM1 capture/compare mode register3,                          Address offset: 0x54  
TIM1_CCR5                   EQU     TIM1_BASE  + 0x0058             ; TIM1 capture/compare mode register5,                          Address offset: 0x58  
TIM1_CCR6                   EQU     TIM1_BASE  + 0x005C             ; TIM1 capture/compare mode register6,                          Address offset: 0x5C  

;***************************************************************TIM8 peripherals************************************************************************
TIM8_BASE                   EQU     APB2PERIPH_BASE + 0x0400  
TIM8_CR1                    EQU     TIM8_BASE  + 0x0000             ; TIM8 control register 1,                                      Address offset: 0x00  
TIM8_CR2                    EQU     TIM8_BASE  + 0x0004             ; TIM8 control register 2,                                      Address offset: 0x04  
TIM8_SMCR                   EQU     TIM8_BASE  + 0x0008             ; TIM8 slave mode control register,                             Address offset: 0x08  
TIM8_DIER                   EQU     TIM8_BASE  + 0x000C             ; TIM8 DMA/interrupt enable register,                           Address offset: 0x0C  
TIM8_SR                     EQU     TIM8_BASE  + 0x0010             ; TIM8 status register,                                         Address offset: 0x10  
TIM8_EGR                    EQU     TIM8_BASE  + 0x0014             ; TIM8 event generation register,                               Address offset: 0x14  
TIM8_CCMR1                  EQU     TIM8_BASE  + 0x0018             ; TIM8 capture/compare mode register 1,                         Address offset: 0x18  
TIM8_CCMR2                  EQU     TIM8_BASE  + 0x001C             ; TIM8 capture/compare mode register 2,                         Address offset: 0x1C  
TIM8_CCER                   EQU     TIM8_BASE  + 0x0020             ; TIM8 capture/compare enable register,                         Address offset: 0x20  
TIM8_CNT                    EQU     TIM8_BASE  + 0x0024             ; TIM8 counter register,                                        Address offset: 0x24  
TIM8_PSC                    EQU     TIM8_BASE  + 0x0028             ; TIM8 prescaler,                                               Address offset: 0x28  
TIM8_ARR                    EQU     TIM8_BASE  + 0x002C             ; TIM8 auto-reload register,                                    Address offset: 0x2C 
TIM8_RCR                    EQU     TIM8_BASE  + 0x002C             ; TIM8 repetition counter register,                             Address offset: 0x30  
TIM8_CCR1                   EQU     TIM8_BASE  + 0x0034             ; TIM8 capture/compare register 1,                              Address offset: 0x34  
TIM8_CCR2                   EQU     TIM8_BASE  + 0x0038             ; TIM8 capture/compare register 2,                              Address offset: 0x38  
TIM8_CCR3                   EQU     TIM8_BASE  + 0x003C             ; TIM8 capture/compare register 3,                              Address offset: 0x3C  
TIM8_CCR4                   EQU     TIM8_BASE  + 0x0040             ; TIM8 capture/compare register 4,                              Address offset: 0x40  
TIM8_BDTR                   EQU     TIM8_BASE  + 0x0040             ; TIM8 break and dead-time register,                            Address offset: 0x44  
TIM8_DCR                    EQU     TIM8_BASE  + 0x0048             ; TIM8 DMA control register,                                    Address offset: 0x48  
TIM8_DMAR                   EQU     TIM8_BASE  + 0x004C             ; TIM8 DMA address for full transfer,                           Address offset: 0x4C  
TIM8_CCMR3                  EQU     TIM8_BASE  + 0x0054             ; TIM8 capture/compare mode register3,                          Address offset: 0x54  
TIM8_CCR5                   EQU     TIM8_BASE  + 0x0058             ; TIM8 capture/compare mode register5,                          Address offset: 0x58  
TIM8_CCR6                   EQU     TIM8_BASE  + 0x005C             ; TIM8 capture/compare mode register6,                          Address offset: 0x5C  


USART1_BASE                 EQU     APB2PERIPH_BASE + 0x1000  
USART6_BASE                 EQU     APB2PERIPH_BASE + 0x1400  
ADC1_BASE                   EQU     APB2PERIPH_BASE + 0x2000  
ADC2_BASE                   EQU     APB2PERIPH_BASE + 0x2100  
ADC3_BASE                   EQU     APB2PERIPH_BASE + 0x2200  
ADC_BASE                    EQU     APB2PERIPH_BASE + 0x2300  
SDMMC1_BASE                 EQU     APB2PERIPH_BASE + 0x2C00  
SPI1_BASE                   EQU     APB2PERIPH_BASE + 0x3000  
SPI4_BASE                   EQU     APB2PERIPH_BASE + 0x3400  
SYSCFG_BASE                 EQU     APB2PERIPH_BASE + 0x3800  
EXTI_BASE                   EQU     APB2PERIPH_BASE + 0x3C00  

TIM9_BASE                   EQU     APB2PERIPH_BASE + 0x4000  
TIM10_BASE                  EQU     APB2PERIPH_BASE + 0x4400  
TIM11_BASE                  EQU     APB2PERIPH_BASE + 0x4800  
SPI5_BASE                   EQU     APB2PERIPH_BASE + 0x5000  
SPI6_BASE                   EQU     APB2PERIPH_BASE + 0x5400 

;***************************************************************SAI1 peripherals************************************************************************
SAI1_BASE                   EQU     APB2PERIPH_BASE + 0x5800  
SAI2_BASE                   EQU     APB2PERIPH_BASE + 0x5C00  
SAI1_Block_A_BASE           EQU     SAI1_BASE       + 0x004  
SAI1_Block_B_BASE           EQU     SAI1_BASE       + 0x024  
SAI2_Block_A_BASE           EQU     SAI2_BASE       + 0x004  
SAI2_Block_B_BASE           EQU     SAI2_BASE       + 0x024  

;***************************************************************LTDC peripherals************************************************************************
LTDC_BASE                   EQU     APB2PERIPH_BASE + 0x6800  
LTDC_Layer1_BASE            EQU     LTDC_BASE       + 0x84  
LTDC_Layer2_BASE            EQU     LTDC_BASE       + 0x104   


;***************************************************************AHB1 peripherals************************************************************************

;**************************************************************GPIOA peripherals************************************************************************
GPIOA_BASE                  EQU     AHB1PERIPH_BASE + 0x0000 
GPIOA_MODER                 EQU     GPIOA_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOA_OTYPER                EQU     GPIOA_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOA_OSPEEDR               EQU     GPIOA_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOA_PUPDR                 EQU     GPIOA_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOA_IDR                   EQU     GPIOA_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOA_ODR                   EQU     GPIOA_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOA_BSRR                  EQU     GPIOA_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOA_LCKR                  EQU     GPIOA_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOA_AFRL                  EQU     GPIOA_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOA_AFRH                  EQU     GPIOA_BASE + 0x0024

;**************************************************************GPIOB peripherals************************************************************************
GPIOB_BASE                  EQU     AHB1PERIPH_BASE + 0x0400  
GPIOB_MODER                 EQU     GPIOB_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOB_OTYPER                EQU     GPIOB_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOB_OSPEEDR               EQU     GPIOB_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOB_PUPDR                 EQU     GPIOB_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOB_IDR                   EQU     GPIOB_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOB_ODR                   EQU     GPIOB_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOB_BSRR                  EQU     GPIOB_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOB_LCKR                  EQU     GPIOB_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOB_AFRL                  EQU     GPIOB_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOB_AFRH                  EQU     GPIOB_BASE + 0x0024

;**************************************************************GPIOC peripherals************************************************************************
GPIOC_BASE                  EQU     AHB1PERIPH_BASE + 0x0800  
GPIOC_MODER                 EQU     GPIOC_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOC_OTYPER                EQU     GPIOC_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOC_OSPEEDR               EQU     GPIOC_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOC_PUPDR                 EQU     GPIOC_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOC_IDR                   EQU     GPIOC_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOC_ODR                   EQU     GPIOC_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOC_BSRR                  EQU     GPIOC_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOC_LCKR                  EQU     GPIOC_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOC_AFRL                  EQU     GPIOC_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOC_AFRH                  EQU     GPIOC_BASE + 0x0024

;**************************************************************GPIOD peripherals************************************************************************
GPIOD_BASE                  EQU     AHB1PERIPH_BASE + 0x0C00
GPIOD_MODER                 EQU     GPIOD_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOD_OTYPER                EQU     GPIOD_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOD_OSPEEDR               EQU     GPIOD_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOD_PUPDR                 EQU     GPIOD_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOD_IDR                   EQU     GPIOD_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOD_ODR                   EQU     GPIOD_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOD_BSRR                  EQU     GPIOD_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOD_LCKR                  EQU     GPIOD_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOD_AFRL                  EQU     GPIOD_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOD_AFRH                  EQU     GPIOD_BASE + 0x0024

;**************************************************************GPIOE peripherals************************************************************************
GPIOE_BASE                  EQU     AHB1PERIPH_BASE + 0x1000  
GPIOE_MODER                 EQU     GPIOE_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOE_OTYPER                EQU     GPIOE_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOE_OSPEEDR               EQU     GPIOE_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOE_PUPDR                 EQU     GPIOE_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOE_IDR                   EQU     GPIOE_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOE_ODR                   EQU     GPIOE_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOE_BSRR                  EQU     GPIOE_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOE_LCKR                  EQU     GPIOE_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOE_AFRL                  EQU     GPIOE_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOE_AFRH                  EQU     GPIOE_BASE + 0x0024

;**************************************************************GPIOF peripherals************************************************************************
GPIOF_BASE                  EQU     AHB1PERIPH_BASE + 0x1400 
GPIOF_MODER                 EQU     GPIOF_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOF_OTYPER                EQU     GPIOF_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOF_OSPEEDR               EQU     GPIOF_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOF_PUPDR                 EQU     GPIOF_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOF_IDR                   EQU     GPIOF_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOF_ODR                   EQU     GPIOF_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOF_BSRR                  EQU     GPIOF_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOF_LCKR                  EQU     GPIOF_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOF_AFRL                  EQU     GPIOF_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOF_AFRH                  EQU     GPIOF_BASE + 0x0024

;**************************************************************GPIOG peripherals************************************************************************
GPIOG_BASE                  EQU     AHB1PERIPH_BASE + 0x1800 
GPIOG_MODER                 EQU     GPIOG_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOG_OTYPER                EQU     GPIOG_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOG_OSPEEDR               EQU     GPIOG_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOG_PUPDR                 EQU     GPIOG_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOG_IDR                   EQU     GPIOG_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOG_ODR                   EQU     GPIOG_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOG_BSRR                  EQU     GPIOG_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOG_LCKR                  EQU     GPIOG_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOG_AFRL                  EQU     GPIOG_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOG_AFRH                  EQU     GPIOG_BASE + 0x0024

;**************************************************************GPIOH peripherals************************************************************************
GPIOH_BASE                  EQU     AHB1PERIPH_BASE + 0x1C00  
GPIOH_MODER                 EQU     GPIOH_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOH_OTYPER                EQU     GPIOH_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOH_OSPEEDR               EQU     GPIOH_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOH_PUPDR                 EQU     GPIOH_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOH_IDR                   EQU     GPIOH_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOH_ODR                   EQU     GPIOH_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOH_BSRR                  EQU     GPIOH_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOH_LCKR                  EQU     GPIOH_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOH_AFRL                  EQU     GPIOH_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOH_AFRH                  EQU     GPIOH_BASE + 0x0024


;**************************************************************GPIOI peripherals************************************************************************
GPIOI_BASE                  EQU     AHB1PERIPH_BASE + 0x2000  
GPIOI_MODER                 EQU     GPIOI_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOI_OTYPER                EQU     GPIOI_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOI_OSPEEDR               EQU     GPIOI_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOI_PUPDR                 EQU     GPIOI_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOI_IDR                   EQU     GPIOI_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOI_ODR                   EQU     GPIOI_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOI_BSRR                  EQU     GPIOI_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOI_LCKR                  EQU     GPIOI_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOI_AFRL                  EQU     GPIOI_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOI_AFRH                  EQU     GPIOI_BASE + 0x0024

;**************************************************************GPIOJ peripherals************************************************************************
GPIOJ_BASE                  EQU     AHB1PERIPH_BASE + 0x2400  
GPIOJ_MODER                 EQU     GPIOJ_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOJ_OTYPER                EQU     GPIOJ_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOJ_OSPEEDR               EQU     GPIOJ_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOJ_PUPDR                 EQU     GPIOJ_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOJ_IDR                   EQU     GPIOJ_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOJ_ODR                   EQU     GPIOJ_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOJ_BSRR                  EQU     GPIOJ_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOJ_LCKR                  EQU     GPIOJ_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOJ_AFRL                  EQU     GPIOJ_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOJ_AFRH                  EQU     GPIOJ_BASE + 0x0024

;**************************************************************GPIOK peripherals************************************************************************
GPIOK_BASE                  EQU     AHB1PERIPH_BASE + 0x2800  
GPIOK_MODER                 EQU     GPIOK_BASE + 0x0000             ; GPIO port mode register,                                      Address offset: 0x00                         
GPIOK_OTYPER                EQU     GPIOK_BASE + 0x0004             ; GPIO port output type register,                               Address offset: 0x04       
GPIOK_OSPEEDR               EQU     GPIOK_BASE + 0x0008             ; GPIO port output speed register,                              Address offset: 0x08       
GPIOK_PUPDR                 EQU     GPIOK_BASE + 0x000C             ; GPIO port pull-up/pull-down register,                         Address offset: 0x0C       
GPIOK_IDR                   EQU     GPIOK_BASE + 0x0010             ; GPIO port input data register,                                Address offset: 0x10       
GPIOK_ODR                   EQU     GPIOK_BASE + 0x0014             ; GPIO port output data register,                               Address offset: 0x14       
GPIOK_BSRR                  EQU     GPIOK_BASE + 0x0018             ; GPIO port bit set/reset register,                             Address offset: 0x18                
GPIOK_LCKR                  EQU     GPIOK_BASE + 0x001C             ; GPIO port configuration lock register,                        Address offset: 0x1C       
GPIOK_AFRL                  EQU     GPIOK_BASE + 0x0020             ; GPIO alternate function registers,                            Address offset: 0x20-0x24         
GPIOK_AFRH                  EQU     GPIOK_BASE + 0x0024

;**************************************************************CRC peripherals**************************************************************************

CRC_BASE                    EQU     AHB1PERIPH_BASE + 0x3000  

;**************************************************************Reset and Clock Control******************************************************************

RCC_BASE                    EQU     AHB1PERIPH_BASE + 0x3800  
RCC_CR                      EQU     RCC_BASE + 0x0000               ; RCC clock control register,                                   Address offset: 0x00  
RCC_PLLCFGR                 EQU     RCC_BASE + 0x0004               ; RCC PLL configuration register,                               Address offset: 0x04   
RCC_CFGR                    EQU     RCC_BASE + 0x0008               ; RCC clock configuration register,                             Address offset: 0x08  
RCC_CIR                     EQU     RCC_BASE + 0x000C               ; RCC clock interrupt register,                                 Address offset: 0x0C  
RCC_AHB1RSTR                EQU     RCC_BASE + 0x0010               ; RCC AHB1 peripheral reset register,                           Address offset: 0x10  
RCC_AHB2RSTR                EQU     RCC_BASE + 0x0014               ; RCC AHB2 peripheral reset register,                           Address offset: 0x14  
RCC_AHB3RSTR                EQU     RCC_BASE + 0x0018               ; RCC AHB3 peripheral reset register,                           Address offset: 0x18  
RCC_APB1RSTR                EQU     RCC_BASE + 0x0020               ; RCC APB1 peripheral reset register,                           Address offset: 0x20  
RCC_APB2RSTR                EQU     RCC_BASE + 0x0024               ; RCC APB2 peripheral reset register,                           Address offset: 0x24  
RCC_AHB1ENR                 EQU     RCC_BASE + 0x0030               ; RCC AHB1 peripheral clock register,                           Address offset: 0x30  
RCC_AHB2ENR                 EQU     RCC_BASE + 0x0034               ; RCC AHB2 peripheral clock register,                           Address offset: 0x34  
RCC_AHB3ENR                 EQU     RCC_BASE + 0x0038               ; RCC AHB3 peripheral clock register,                           Address offset: 0x38  
RCC_APB1ENR                 EQU     RCC_BASE + 0x0040               ; RCC APB1 peripheral clock enable register,                    Address offset: 0x40  
RCC_APB2ENR                 EQU     RCC_BASE + 0x0044               ; RCC APB2 peripheral clock enable register,                    Address offset: 0x44  
RCC_AHB1LPENR               EQU     RCC_BASE + 0x0050               ; RCC AHB1 peripheral clock enable in low power mode register,  Address offset: 0x50  
RCC_AHB2LPENR               EQU     RCC_BASE + 0x0054               ; RCC AHB2 peripheral clock enable in low power mode register,  Address offset: 0x54  
RCC_AHB3LPENR               EQU     RCC_BASE + 0x0058               ; RCC AHB3 peripheral clock enable in low power mode register,  Address offset: 0x58  
RCC_APB1LPENR               EQU     RCC_BASE + 0x0060               ; RCC APB1 peripheral clock enable in low power mode register,  Address offset: 0x60  
RCC_APB2LPENR               EQU     RCC_BASE + 0x0064               ; RCC APB2 peripheral clock enable in low power mode register,  Address offset: 0x64  
RCC_BDCR                    EQU     RCC_BASE + 0x0070               ; RCC Backup domain control register,                           Address offset: 0x70  
RCC_CSR                     EQU     RCC_BASE + 0x0074               ; RCC clock control & status register,                          Address offset: 0x74  
RCC_SSCGR                   EQU     RCC_BASE + 0x0080               ; RCC spread spectrum clock generation register,                Address offset: 0x80  
RCC_PLLI2SCFGR              EQU     RCC_BASE + 0x0084               ; RCC PLLI2S configuration register,                            Address offset: 0x84  
RCC_PLLSAICFGR              EQU     RCC_BASE + 0x0088               ; RCC PLLSAI configuration register,                            Address offset: 0x88  
RCC_DCKCFGR1                EQU     RCC_BASE + 0x008C               ; RCC Dedicated Clocks configuration register1,                 Address offset: 0x8C  
RCC_DCKCFGR2                EQU     RCC_BASE + 0x0090               ; RCC Dedicated Clocks configuration register 2,                Address offset: 0x90  


;**************************************************************FLASH peripherals************************************************************************
FLASH_R_BASE                EQU     AHB1PERIPH_BASE + 0x3C00  
FLASH_ACR                   EQU     FLASH_R_BASE + 0x0000           ; FLASH access control register,                                Address offset: 0x00  
FLASH_KEYR                  EQU     FLASH_R_BASE + 0x0004           ; FLASH key register,                                           Address offset: 0x04  
FLASH_OPTKEYR               EQU     FLASH_R_BASE + 0x0008           ; FLASH option key register,                                    Address offset: 0x08  
FLASH_SR                    EQU     FLASH_R_BASE + 0x000C           ; FLASH status register,                                        Address offset: 0x0C  
FLASH_CR                    EQU     FLASH_R_BASE + 0x0010           ; FLASH control register,                                       Address offset: 0x10  
FLASH_OPTCR                 EQU     FLASH_R_BASE + 0x0014           ; FLASH option control register ,                               Address offset: 0x14   
FLASH_OPTCR1                EQU     FLASH_R_BASE + 0x0018           ; FLASH option control register 1 ,                             Address offset: 0x18  


;**************************************************************DMA1 peripherals*************************************************************************
DMA1_BASE                   EQU     AHB1PERIPH_BASE + 0x6000  
DMA1_Stream0_BASE           EQU     DMA1_BASE + 0x010  
DMA1_Stream1_BASE           EQU     DMA1_BASE + 0x028  
DMA1_Stream2_BASE           EQU     DMA1_BASE + 0x040  
DMA1_Stream3_BASE           EQU     DMA1_BASE + 0x058  
DMA1_Stream4_BASE           EQU     DMA1_BASE + 0x070  
DMA1_Stream5_BASE           EQU     DMA1_BASE + 0x088  
DMA1_Stream6_BASE           EQU     DMA1_BASE + 0x0A0  
DMA1_Stream7_BASE           EQU     DMA1_BASE + 0x0B8  

;**************************************************************DMA2 peripherals*************************************************************************
DMA2_BASE                   EQU     AHB1PERIPH_BASE + 0x6400  
DMA2_Stream0_BASE           EQU     DMA2_BASE + 0x010  
DMA2_Stream1_BASE           EQU     DMA2_BASE + 0x028  
DMA2_Stream2_BASE           EQU     DMA2_BASE + 0x040  
DMA2_Stream3_BASE           EQU     DMA2_BASE + 0x058  
DMA2_Stream4_BASE           EQU     DMA2_BASE + 0x070  
DMA2_Stream5_BASE           EQU     DMA2_BASE + 0x088  
DMA2_Stream6_BASE           EQU     DMA2_BASE + 0x0A0  
DMA2_Stream7_BASE           EQU     DMA2_BASE + 0x0B8  

;***************************************************************ETH peripherals*************************************************************************
ETH_BASE                    EQU     AHB1PERIPH_BASE + 0x8000  
ETH_MAC_BASE                EQU     ETH_BASE  
ETH_MMC_BASE                EQU     ETH_BASE + 0x0100  
ETH_PTP_BASE                EQU     ETH_BASE + 0x0700  
ETH_DMA_BASE                EQU     ETH_BASE + 0x1000  

;***************************************************************DMA2D peripherals***********************************************************************
DMA2D_BASE                  EQU     AHB1PERIPH_BASE + 0xB000  

;***************************************************************AHB2 peripherals************************************************************************
DCMI_BASE                   EQU     AHB2PERIPH_BASE + 0x50000  
RNG_BASE                    EQU     AHB2PERIPH_BASE + 0x60800  

;*************************************************************FMC Bankx registers base address**********************************************************
FMC_Bank1_R_BASE            EQU     FMC_R_BASE + 0x0000  
FMC_Bank1E_R_BASE           EQU     FMC_R_BASE + 0x0104  
FMC_Bank3_R_BASE            EQU     FMC_R_BASE + 0x0080  
FMC_Bank5_6_R_BASE          EQU     FMC_R_BASE + 0x0140  

;*************************************************************Debug MCU registers base address**********************************************************
DBGMCU_BASE                 EQU     0xE0042000  

;*************************************************************USB MCU registers base address************************************************************
USB_OTG_HS_PERIPH_BASE      EQU     0x40040000  
USB_OTG_FS_PERIPH_BASE      EQU     0x50000000  


;*************************************************************STM32 specific Interrupt Numbers**********************************************************
WWDG_IRQn                   EQU     0                               ; Window WatchDog Interrupt                                         
PVD_IRQn                    EQU     1                               ; PVD through EXTI Line detection Interrupt                         
TAMP_STAMP_IRQn             EQU     2                               ; Tamper and TimeStamp interrupts through the EXTI line             
RTC_WKUP_IRQn               EQU     3                               ; RTC Wakeup interrupt through the EXTI line                        
FLASH_IRQn                  EQU     4                               ; FLASH global Interrupt                                            
RCC_IRQn                    EQU     5                               ; RCC global Interrupt                                              
EXTI0_IRQn                  EQU     6                               ; EXTI Line0 Interrupt                                              
EXTI1_IRQn                  EQU     7                               ; EXTI Line1 Interrupt                                              
EXTI2_IRQn                  EQU     8                               ; EXTI Line2 Interrupt                                              
EXTI3_IRQn                  EQU     9                               ; EXTI Line3 Interrupt                                              
EXTI4_IRQn                  EQU     10                              ; EXTI Line4 Interrupt                                              
DMA1_Stream0_IRQn           EQU     11                              ; DMA1 Stream 0 global Interrupt                                    
DMA1_Stream1_IRQn           EQU     12                              ; DMA1 Stream 1 global Interrupt                                    
DMA1_Stream2_IRQn           EQU     13                              ; DMA1 Stream 2 global Interrupt                                    
DMA1_Stream3_IRQn           EQU     14                              ; DMA1 Stream 3 global Interrupt                                    
DMA1_Stream4_IRQn           EQU     15                              ; DMA1 Stream 4 global Interrupt                                    
DMA1_Stream5_IRQn           EQU     16                              ; DMA1 Stream 5 global Interrupt                                    
DMA1_Stream6_IRQn           EQU     17                              ; DMA1 Stream 6 global Interrupt                                    
ADC_IRQn                    EQU     18                              ; ADC1, ADC2 and ADC3 global Interrupts                             
CAN1_TX_IRQn                EQU     19                              ; CAN1 TX Interrupt                                                 
CAN1_RX0_IRQn               EQU     20                              ; CAN1 RX0 Interrupt                                                
CAN1_RX1_IRQn               EQU     21                              ; CAN1 RX1 Interrupt                                                
CAN1_SCE_IRQn               EQU     22                              ; CAN1 SCE Interrupt                                                
EXTI9_5_IRQn                EQU     23                              ; External Line[9:5] Interrupts                                     
TIM1_BRK_TIM9_IRQn          EQU     24                              ; TIM1 Break interrupt and TIM9 global interrupt                    
TIM1_UP_TIM10_IRQn          EQU     25                              ; TIM1 Update Interrupt and TIM10 global interrupt                  
TIM1_TRG_COM_TIM11_IRQn     EQU     26                              ; TIM1 Trigger and Commutation Interrupt and TIM11 global interrupt 
TIM1_CC_IRQn                EQU     27                              ; TIM1 Capture Compare Interrupt                                    
TIM2_IRQn                   EQU     28                              ; TIM2 global Interrupt                                             
TIM3_IRQn                   EQU     29                              ; TIM3 global Interrupt                                             
TIM4_IRQn                   EQU     30                              ; TIM4 global Interrupt                                             
I2C1_EV_IRQn                EQU     31                              ; I2C1 Event Interrupt                                              
I2C1_ER_IRQn                EQU     32                              ; I2C1 Error Interrupt                                              
I2C2_EV_IRQn                EQU     33                              ; I2C2 Event Interrupt                                              
I2C2_ER_IRQn                EQU     34                              ; I2C2 Error Interrupt                                                
SPI1_IRQn                   EQU     35                              ; SPI1 global Interrupt                                             
SPI2_IRQn                   EQU     36                              ; SPI2 global Interrupt                                             
USART1_IRQn                 EQU     37                              ; USART1 global Interrupt                                           
USART2_IRQn                 EQU     38                              ; USART2 global Interrupt                                           
USART3_IRQn                 EQU     39                              ; USART3 global Interrupt                                           
EXTI15_10_IRQn              EQU     40                              ; External Line[15:10] Interrupts                                   
RTC_Alarm_IRQn              EQU     41                              ; RTC Alarm   A and B   through EXTI Line Interrupt                   
OTG_FS_WKUP_IRQn            EQU     42                              ; USB OTG FS Wakeup through EXTI line interrupt                         
TIM8_BRK_TIM12_IRQn         EQU     43                              ; TIM8 Break Interrupt and TIM12 global interrupt                   
TIM8_UP_TIM13_IRQn          EQU     44                              ; TIM8 Update Interrupt and TIM13 global interrupt                  
TIM8_TRG_COM_TIM14_IRQn     EQU     45                              ; TIM8 Trigger and Commutation Interrupt and TIM14 global interrupt 
TIM8_CC_IRQn                EQU     46                              ; TIM8 Capture Compare Interrupt                                    
DMA1_Stream7_IRQn           EQU     47                              ; DMA1 Stream7 Interrupt                                            
FMC_IRQn                    EQU     48                              ; FMC global Interrupt                                              
SDMMC1_IRQn                 EQU     49                              ; SDMMC1 global Interrupt                                             
TIM5_IRQn                   EQU     50                              ; TIM5 global Interrupt                                             
SPI3_IRQn                   EQU     51                              ; SPI3 global Interrupt                                             
UART4_IRQn                  EQU     52                              ; UART4 global Interrupt                                            
UART5_IRQn                  EQU     53                              ; UART5 global Interrupt                                            
TIM6_DAC_IRQn               EQU     54                              ; TIM6 global and DAC1&2 underrun error  interrupts                 
TIM7_IRQn                   EQU     55                              ; TIM7 global interrupt                                             
DMA2_Stream0_IRQn           EQU     56                              ; DMA2 Stream 0 global Interrupt                                    
DMA2_Stream1_IRQn           EQU     57                              ; DMA2 Stream 1 global Interrupt                                    
DMA2_Stream2_IRQn           EQU     58                              ; DMA2 Stream 2 global Interrupt                                    
DMA2_Stream3_IRQn           EQU     59                              ; DMA2 Stream 3 global Interrupt                                    
DMA2_Stream4_IRQn           EQU     60                              ; DMA2 Stream 4 global Interrupt                                    
ETH_IRQn                    EQU     61                              ; Ethernet global Interrupt                                         
ETH_WKUP_IRQn               EQU     62                              ; Ethernet Wakeup through EXTI line Interrupt                       
CAN2_TX_IRQn                EQU     63                              ; CAN2 TX Interrupt                                                 
CAN2_RX0_IRQn               EQU     64                              ; CAN2 RX0 Interrupt                                                
CAN2_RX1_IRQn               EQU     65                              ; CAN2 RX1 Interrupt                                                
CAN2_SCE_IRQn               EQU     66                              ; CAN2 SCE Interrupt                                                
OTG_FS_IRQn                 EQU     67                              ; USB OTG FS global Interrupt                                       
DMA2_Stream5_IRQn           EQU     68                              ; DMA2 Stream 5 global interrupt                                    
DMA2_Stream6_IRQn           EQU     69                              ; DMA2 Stream 6 global interrupt                                    
DMA2_Stream7_IRQn           EQU     70                              ; DMA2 Stream 7 global interrupt                                    
USART6_IRQn                 EQU     71                              ; USART6 global interrupt                                           
I2C3_EV_IRQn                EQU     72                              ; I2C3 event interrupt                                              
I2C3_ER_IRQn                EQU     73                              ; I2C3 error interrupt                                              
OTG_HS_EP1_OUT_IRQn         EQU     74                              ; USB OTG HS End Point 1 Out global interrupt                       
OTG_HS_EP1_IN_IRQn          EQU     75                              ; USB OTG HS End Point 1 In global interrupt                        
OTG_HS_WKUP_IRQn            EQU     76                              ; USB OTG HS Wakeup through EXTI interrupt                          
OTG_HS_IRQn                 EQU     77                              ; USB OTG HS global interrupt                                       
DCMI_IRQn                   EQU     78                              ; DCMI global interrupt                                             
RNG_IRQn                    EQU     80                              ; RNG global interrupt                                              
FPU_IRQn                    EQU     81                              ; FPU global interrupt                                              
UART7_IRQn                  EQU     82                              ; UART7 global interrupt                                            
UART8_IRQn                  EQU     83                              ; UART8 global interrupt                                            
SPI4_IRQn                   EQU     84                              ; SPI4 global Interrupt                                             
SPI5_IRQn                   EQU     85                              ; SPI5 global Interrupt                                             
SPI6_IRQn                   EQU     86                              ; SPI6 global Interrupt                                             
SAI1_IRQn                   EQU     87                              ; SAI1 global Interrupt                                             
LTDC_IRQn                   EQU     88                              ; LTDC global Interrupt                                             
LTDC_ER_IRQn                EQU     89                              ; LTDC Error global Interrupt                                       
DMA2D_IRQn                  EQU     90                              ; DMA2D global Interrupt                                            
SAI2_IRQn                   EQU     91                              ; SAI2 global Interrupt                                             
QUADSPI_IRQn                EQU     92                              ; Quad SPI global interrupt                                         
LPTIM1_IRQn                 EQU     93                              ; LP TIM1 interrupt                                                 
CEC_IRQn                    EQU     94                              ; HDMI-CEC global Interrupt                                         
I2C4_EV_IRQn                EQU     95                              ; I2C4 Event Interrupt                                              
I2C4_ER_IRQn                EQU     96                              ; I2C4 Error Interrupt                                              
SPDIF_RX_IRQn               EQU     97                              ; SPDIF-RX global Interrupt                                         


;********************************************************************END OF FILE************************************************************************
                    
                            END
