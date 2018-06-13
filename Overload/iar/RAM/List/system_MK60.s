///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Mar/2018  21:10:49
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\workspace\LPLD_OSKinetis_V3\lib\CPU\system_MK60.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EW3597.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\lib\CPU\system_MK60.c -D LPLD_K60 -D
//        USE_K60DZ10 -lCN
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\RAM\List -lB
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\RAM\List -o
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\RAM\Obj --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "D:\Program Files\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\app\ -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\CPU\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\common\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\HW\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\FatFs\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\FatFs\option\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\common\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\driver\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\descriptor\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\class\
//        -Ol -I "D:\Program Files\IAR Systems\Embedded Workbench
//        8.0\arm\CMSIS\Include\" -D ARM_MATH_CM4)
//    Locale       =  C
//    List file    =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\RAM\List\system_MK60.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_PLL_Setup
        EXTERN LPLD_UART_Init
        EXTERN __aeabi_memcpy4
        EXTERN common_relocate
        EXTERN g_bus_clock
        EXTERN g_core_clock
        EXTERN g_flash_clock
        EXTERN g_flexbus_clock
        EXTERN printf

        PUBLIC DefaultISR
        PUBLIC HardFault_Handler
        PUBLIC SystemCoreClock
        PUBLIC SystemCoreClockUpdate
        PUBLIC SystemInit

// D:\workspace\LPLD_OSKinetis_V3\lib\CPU\system_MK60.c
//    1 /**
//    2  * @file system_MK60.c
//    3  * @version 1.2.1[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief MK60系列单片机系统配置文件
//    6  *
//    7  * 更改建议:禁止修改
//    8  *
//    9  * 该代码提供系统配置函数以及一个储存系统主频的全局变量。
//   10  * 配置函数主要负责建立系统各模块的时钟。
//   11  * 代码还实现常见的系统中断函数。
//   12  *
//   13  * 版权所有:北京拉普兰德电子技术有限公司
//   14  * http://www.lpld.cn
//   15  * mail:support@lpld.cn
//   16  *
//   17  * @par
//   18  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   19  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   20  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   21  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   22  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   23  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   24  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   25  */
//   26 
//   27 #include <stdint.h>
//   28 #include "common.h"
//   29 
//   30 #define DISABLE_WDOG    1
//   31 
//   32 /*----------------------------------------------------------------------------
//   33   @@@@@@@
//   34  *----------------------------------------------------------------------------*/
//   35 #define CPU_XTAL32k_CLK_HZ              32768u          //@@32k@@@@@@@@@Hz    
//   36 #define CPU_INT_SLOW_CLK_HZ             32768u          //@@@@@@@@@@@@Hz
//   37 #define CPU_INT_FAST_CLK_HZ             4000000u        //@@@@@@@@@@@@Hz
//   38 #define DEFAULT_SYSTEM_CLOCK            100000000u      //@@@@@@@@@Hz
//   39 
//   40 static void flash_identify (void);
//   41 static void cpu_identify (void);
//   42 static void Diagnostic_Reset_Source(void);
//   43 /**
//   44  * @brief @@@@@@@Hz@
//   45  */

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//   46 uint32_t SystemCoreClock = DEFAULT_SYSTEM_CLOCK;
SystemCoreClock:
        DC32 100000000
//   47 
//   48 /**
//   49  * @@@@@
//   50  *
//   51  * @param  none
//   52  * @return none
//   53  *
//   54  * @brief  @@@MCU@@@@@@@@@IO@@@@@@@@@@@@@@@@@
//   55  *         @@@@@@@SystemInit@MCU@@@@@@@
//   56  *         
//   57  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   58 void SystemInit (void) {
SystemInit:
        PUSH     {R7,LR}
        SUB      SP,SP,#+40
//   59   UART_InitTypeDef term_port_structure;
//   60   //@@@@IO@@
//   61   SIM->SCGC5 |= (SIM_SCGC5_PORTA_MASK
//   62               | SIM_SCGC5_PORTB_MASK
//   63               | SIM_SCGC5_PORTC_MASK
//   64               | SIM_SCGC5_PORTD_MASK
//   65               | SIM_SCGC5_PORTE_MASK );
        LDR.W    R0,??DataTable6  ;; 0x40048038
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x3E00
        LDR.W    R1,??DataTable6  ;; 0x40048038
        STR      R0,[R1, #+0]
//   66 #if (DISABLE_WDOG)
//   67   //@@@@@@@
//   68   /* WDOG_UNLOCK: WDOGUNLOCK=0xC520 */
//   69   WDOG->UNLOCK = (uint16_t)0xC520u;     /* Key 1 */
        MOVW     R0,#+50464
        LDR.W    R1,??DataTable6_1  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//   70   /* WDOG_UNLOCK : WDOGUNLOCK=0xD928 */
//   71   WDOG->UNLOCK  = (uint16_t)0xD928u;    /* Key 2 */
        MOVW     R0,#+55592
        LDR.W    R1,??DataTable6_1  ;; 0x4005200e
        STRH     R0,[R1, #+0]
//   72   /* WDOG_STCTRLH: ??=0,DISTESTWDOG=0,BYTESEL=0,TESTSEL=0,TESTWDOG=0,??=0,STNDBYEN=1,WAITEN=1,STOPEN=1,DBGEN=0,ALLOWUPDATE=1,WINEN=0,IRQRSTEN=0,CLKSRC=1,WDOGEN=0 */
//   73   WDOG->STCTRLH = (uint16_t)0x01D2u;
        MOV      R0,#+466
        LDR.W    R1,??DataTable6_2  ;; 0x40052000
        STRH     R0,[R1, #+0]
//   74 #endif /* (DISABLE_WDOG) */
//   75   
//   76   //@@@@@@@@@RAM@@@@@@@@@@@@RAM@
//   77   common_relocate();
        BL       common_relocate
//   78   
//   79   //@@@@@@@@@@@@@@@@@@@@@FlexBus@@@Flash@@
//   80   LPLD_PLL_Setup(CORE_CLK_MHZ);
        MOVS     R0,#+180
        BL       LPLD_PLL_Setup
//   81   
//   82   //@@@@@@
//   83   SystemCoreClockUpdate();
        BL       SystemCoreClockUpdate
//   84   
//   85   //@@@@@@@
//   86   g_core_clock = SystemCoreClock;
        LDR.W    R0,??DataTable6_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_4
        STR      R0,[R1, #+0]
//   87   g_bus_clock = g_core_clock / ((uint32_t)((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV2_MASK) >> SIM_CLKDIV1_OUTDIV2_SHIFT)+ 1u);
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_5  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+24,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable6_6
        STR      R0,[R1, #+0]
//   88   g_flexbus_clock =  g_core_clock / ((uint32_t)((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV3_MASK) >> SIM_CLKDIV1_OUTDIV3_SHIFT)+ 1u);
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_5  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+20,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable6_7
        STR      R0,[R1, #+0]
//   89   g_flash_clock =  g_core_clock / ((uint32_t)((SIM->CLKDIV1 & SIM_CLKDIV1_OUTDIV4_MASK) >> SIM_CLKDIV1_OUTDIV4_SHIFT)+ 1u);
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_5  ;; 0x40048044
        LDR      R1,[R1, #+0]
        UBFX     R1,R1,#+16,#+4
        ADDS     R1,R1,#+1
        UDIV     R0,R0,R1
        LDR.W    R1,??DataTable6_8
        STR      R0,[R1, #+0]
//   90   
//   91   //@@@@@@@@@@@@@@@@
//   92   //TERM_PORT@UART@@@@k60_card.h@@@
//   93   //TERMINAL_BAUD@UART@@@@@k60_card.h@@@
//   94   term_port_structure.UART_Uartx = TERM_PORT;
        LDR.W    R0,??DataTable6_9  ;; 0x400eb000
        STR      R0,[SP, #+12]
//   95   term_port_structure.UART_BaudRate = TERMINAL_BAUD;
        MOVS     R0,#+115200
        STR      R0,[SP, #+16]
//   96   LPLD_UART_Init(term_port_structure);
        ADD      R1,SP,#+12
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   97   
//   98   //@@@@@@@@
//   99 #ifdef DEBUG_PRINT     
//  100   printf("\r\n");   
        ADR.N    R0,??DataTable3  ;; 0x0D, 0x0A, 0x00, 0x00
        BL       printf
//  101   printf("*********** @@@@@@K60@@@ http://www.lpld.cn ***********\r\n");
        LDR.W    R0,??DataTable6_10
        BL       printf
//  102   printf("OSKinetis@@@@@:%s\tmail:support@lpld.cn\r\n", OSKinetis_Version);
        LDR.W    R1,??DataTable6_11
        LDR.W    R0,??DataTable6_12
        BL       printf
//  103   printf("@@@@@@:%dMHz\t@@@@:%dMHz\r\n", g_core_clock/1000000u, g_bus_clock/1000000u);
        LDR.W    R0,??DataTable6_6
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_13  ;; 0xf4240
        UDIV     R2,R0,R1
        LDR.W    R0,??DataTable6_4
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_13  ;; 0xf4240
        UDIV     R1,R0,R1
        LDR.W    R0,??DataTable6_14
        BL       printf
//  104   printf("FlexBus@@:%dMHz\tFlash@@:%dMHz\r\n", g_flexbus_clock/1000000u, g_flash_clock/1000000u);
        LDR.W    R0,??DataTable6_8
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_13  ;; 0xf4240
        UDIV     R2,R0,R1
        LDR.W    R0,??DataTable6_7
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable6_13  ;; 0xf4240
        UDIV     R1,R0,R1
        LDR.W    R0,??DataTable6_15
        BL       printf
//  105   printf("@@@@@@@@@@@@@@@@@@PRINT_ON_OFF@1(k60_card.h)\r\n");
        LDR.W    R0,??DataTable6_16
        BL       printf
//  106   cpu_identify();
        BL       cpu_identify
//  107   Diagnostic_Reset_Source();
        BL       Diagnostic_Reset_Source
//  108   printf("********************************************************************\r\n");
        LDR.W    R0,??DataTable6_17
        BL       printf
//  109 #endif
//  110   
//  111 }
        ADD      SP,SP,#+44
        POP      {PC}             ;; return
//  112 
//  113 /**
//  114  * @@SystemCoreClock
//  115  *
//  116  * @param  none
//  117  * @return none
//  118  *
//  119  * @brief  @@@@@@SystemCoreClock@@@@@@@@@@@@@@@@@
//  120  *         
//  121  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  122 void SystemCoreClockUpdate (void) {
//  123   uint32_t temp;
//  124 #if (defined(CPU_MK60DZ10))
//  125   #if OSC_CIRCUIT_TPYE == CANNED_OSC_CIRCUIT
//  126   temp =  CANNED_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV_MASK) + 24u );
SystemCoreClockUpdate:
        LDR.W    R0,??DataTable6_18  ;; 0x40064005
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R1,R1,#0x1F
        ADDS     R1,R1,#+24
        LDR.W    R0,??DataTable6_19  ;; 0x2faf080
        MULS     R1,R0,R1
//  127   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV_MASK) +1u ));
        LDR.W    R0,??DataTable6_20  ;; 0x40064004
        LDRB     R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R0,R0,#0x1F
        ADDS     R0,R0,#+1
        UDIV     R0,R1,R0
//  128   #elif OSC_CIRCUIT_TPYE == CRYSTAL_OSC_CIRCUIT
//  129   temp =  CRYSTAL_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV_MASK) + 24u );
//  130   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV_MASK) +1u ));
//  131   #endif
//  132 #elif (defined(CPU_MK60D10))
//  133   #if OSC_CIRCUIT_TPYE == CANNED_OSC_CIRCUIT
//  134   temp =  CANNED_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) + 24u );
//  135   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) +1u ));
//  136   temp = temp;
//  137   #elif OSC_CIRCUIT_TPYE == CRYSTAL_OSC_CIRCUIT
//  138   temp =  CRYSTAL_OSC_CLK_HZ *((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) + 24u );
//  139   temp = (uint32_t)(temp/((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) +1u ));
//  140   temp = temp;
//  141   #endif
//  142 #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15))
//  143   #if OSC_CIRCUIT_TPYE == CANNED_OSC_CIRCUIT
//  144   temp =  CANNED_OSC_CLK_HZ /((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) + 1u );
//  145   temp = (uint32_t)(temp*((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) +16u ));
//  146   temp = temp/2;
//  147   #elif OSC_CIRCUIT_TPYE == CRYSTAL_OSC_CIRCUIT
//  148   temp =  CRYSTAL_OSC_CLK_HZ /((uint32_t)(MCG->C5 & MCG_C5_PRDIV0_MASK) + 1u );
//  149   temp = (uint32_t)(temp*((uint32_t)(MCG->C6 & MCG_C6_VDIV0_MASK) +16u ));
//  150   temp = temp/2;
//  151   #endif
//  152 #endif
//  153   SystemCoreClock = temp;
        LDR.W    R1,??DataTable6_3
        STR      R0,[R1, #+0]
//  154 }
        BX       LR               ;; return
//  155 
//  156 /**
//  157  * @@@@@@@@
//  158  *
//  159  * @param  none
//  160  * @return none
//  161  *
//  162  * @brief  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//  163  *         
//  164  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  165 void HardFault_Handler(void)
//  166 {
HardFault_Handler:
        PUSH     {R7,LR}
//  167 #ifdef DEBUG_PRINT 
//  168    printf("\r\n****@@@@@@@@*****\r\n");
        LDR.W    R0,??DataTable6_21
        BL       printf
//  169 #endif
//  170    return;
        POP      {R0,PC}          ;; return
//  171 }
//  172 
//  173 /**
//  174  * @@@@@@
//  175  *
//  176  * @param  none
//  177  * @return none
//  178  *
//  179  * @brief  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//  180  *         
//  181  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  182 void DefaultISR(void)
//  183 {
DefaultISR:
        PUSH     {R7,LR}
//  184    #define VECTORNUM                     (*(volatile uint8_t*)(0xE000ED04)) 
//  185 #ifdef DEBUG_PRINT 
//  186    printf("\r\n****@@@@@@@,Interrupt Number %d*****\r\n",VECTORNUM-16);
        LDR.W    R0,??DataTable6_22  ;; 0xe000ed04
        LDRB     R1,[R0, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        SUBS     R1,R1,#+16
        LDR.W    R0,??DataTable6_23
        BL       printf
//  187 #endif
//  188    return;
        POP      {R0,PC}          ;; return
//  189 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC8      0x0D, 0x0A, 0x00, 0x00
//  190 
//  191 /**
//  192  * @@@@@@@@@@@@@(OS Tick)
//  193  *
//  194  * @param  none
//  195  * @return none
//  196  *
//  197  * @brief  @@@@@uC/OS@@@@@@@@@@@OSStart()@@@@@@@@@@
//  198  *         
//  199  */
//  200 #if UCOS_II > 0u
//  201 void SystemTickInit (void)
//  202 {
//  203   uint32  cpu_clk_freq;
//  204   uint32  cnts;
//  205 
//  206   cpu_clk_freq = g_core_clock;  //@@SysTick@@
//  207 
//  208 #if (OS_VERSION >= 30000u)
//  209   cnts  = cpu_clk_freq / (uint32)OSCfg_TickRate_Hz;    
//  210 #else
//  211   cnts  = cpu_clk_freq / (uint32)OS_TICKS_PER_SEC;        
//  212 #endif
//  213 
//  214   OS_CPU_SysTickInit(cnts);     //@@@uCOS@@@@@SysTick
//  215 }
//  216 #endif
//  217 
//  218 /**
//  219  * Kinetis CPU Identify
//  220  *
//  221  * @param  none
//  222  * @return none
//  223  *
//  224  * @brief @@Kinetis@@@@
//  225  * - Kinetis family
//  226  * - package
//  227  * - die revision
//  228  * - P-flash size
//  229  * - Ram size
//  230  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  231 static void cpu_identify (void)
//  232 {
cpu_identify:
        PUSH     {R7,LR}
//  233     /* @@Kinetis @@@@@@ */
//  234     switch((SIM->SDID & SIM_SDID_FAMID(0x7))>>SIM_SDID_FAMID_SHIFT) 
        LDR.W    R0,??DataTable6_24  ;; 0x40048024
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+4
        ANDS     R0,R0,#0x7
        CMP      R0,#+0
        BEQ.N    ??cpu_identify_0
        CMP      R0,#+2
        BEQ.N    ??cpu_identify_1
        BCC.N    ??cpu_identify_2
        CMP      R0,#+4
        BEQ.N    ??cpu_identify_3
        BCC.N    ??cpu_identify_4
        CMP      R0,#+6
        BEQ.N    ??cpu_identify_5
        BCC.N    ??cpu_identify_6
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_7
        B.N      ??cpu_identify_8
//  235     {
//  236 #ifdef DEBUG_PRINT 
//  237     	case 0x0:printf("\nK10-");break;
??cpu_identify_0:
        LDR.W    R0,??DataTable6_25
        BL       printf
        B.N      ??cpu_identify_9
//  238     	case 0x1:printf("\nK20-");break;
??cpu_identify_2:
        LDR.W    R0,??DataTable6_26
        BL       printf
        B.N      ??cpu_identify_9
//  239     	case 0x2:printf("\nK30-");break;
??cpu_identify_1:
        LDR.W    R0,??DataTable6_27
        BL       printf
        B.N      ??cpu_identify_9
//  240     	case 0x3:printf("\nK40-");break;
??cpu_identify_4:
        LDR.W    R0,??DataTable6_28
        BL       printf
        B.N      ??cpu_identify_9
//  241     	case 0x4:printf("\nK60-");break;
??cpu_identify_3:
        LDR.W    R0,??DataTable6_29
        BL       printf
        B.N      ??cpu_identify_9
//  242     	case 0x5:printf("\nK70-");break;
??cpu_identify_6:
        LDR.W    R0,??DataTable6_30
        BL       printf
        B.N      ??cpu_identify_9
//  243     	case 0x6:printf("\nK50-");break;
??cpu_identify_5:
        LDR.W    R0,??DataTable6_31
        BL       printf
        B.N      ??cpu_identify_9
//  244     	case 0x7:printf("\nK53-");break;
??cpu_identify_7:
        LDR.W    R0,??DataTable6_32
        BL       printf
        B.N      ??cpu_identify_9
//  245 	default:printf("\n@@@@@@@@@-");break; 
??cpu_identify_8:
        LDR.W    R0,??DataTable6_33
        BL       printf
//  246 #else 	
//  247         default:break; 
//  248 #endif
//  249     }
//  250 
//  251      /* @@Kinetis @@@@@@ */
//  252     switch((SIM->SDID & SIM_SDID_PINID(0xF))>>SIM_SDID_PINID_SHIFT) 
??cpu_identify_9:
        LDR.W    R0,??DataTable6_24  ;; 0x40048024
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xF
        CMP      R0,#+2
        BEQ.N    ??cpu_identify_10
        CMP      R0,#+4
        BEQ.N    ??cpu_identify_11
        CMP      R0,#+5
        BEQ.N    ??cpu_identify_12
        CMP      R0,#+6
        BEQ.N    ??cpu_identify_13
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_14
        CMP      R0,#+8
        BEQ.N    ??cpu_identify_15
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_16
        CMP      R0,#+10
        BEQ.N    ??cpu_identify_17
        CMP      R0,#+12
        BEQ.N    ??cpu_identify_18
        CMP      R0,#+14
        BEQ.N    ??cpu_identify_19
        B.N      ??cpu_identify_20
//  253     {
//  254 #ifdef DEBUG_PRINT
//  255     	case 0x2:printf("32pin-");break;
??cpu_identify_10:
        LDR.W    R0,??DataTable6_34
        BL       printf
        B.N      ??cpu_identify_21
//  256     	case 0x4:printf("48pin-");break;
??cpu_identify_11:
        LDR.W    R0,??DataTable6_35
        BL       printf
        B.N      ??cpu_identify_21
//  257     	case 0x5:printf("64pin-");break;
??cpu_identify_12:
        LDR.W    R0,??DataTable6_36
        BL       printf
        B.N      ??cpu_identify_21
//  258     	case 0x6:printf("80pin-");break;
??cpu_identify_13:
        LDR.W    R0,??DataTable6_37
        BL       printf
        B.N      ??cpu_identify_21
//  259     	case 0x7:printf("81pin-");break;
??cpu_identify_14:
        LDR.N    R0,??DataTable6_38
        BL       printf
        B.N      ??cpu_identify_21
//  260     	case 0x8:printf("100pin-");break;
??cpu_identify_15:
        LDR.N    R0,??DataTable6_39
        BL       printf
        B.N      ??cpu_identify_21
//  261     	case 0x9:printf("104pin-");break;
??cpu_identify_16:
        LDR.N    R0,??DataTable6_40
        BL       printf
        B.N      ??cpu_identify_21
//  262     	case 0xA:printf("144pin-");break;
??cpu_identify_17:
        LDR.N    R0,??DataTable6_41
        BL       printf
        B.N      ??cpu_identify_21
//  263     	case 0xC:printf("196pin-");break;
??cpu_identify_18:
        LDR.N    R0,??DataTable6_42
        BL       printf
        B.N      ??cpu_identify_21
//  264     	case 0xE:printf("256pin-");break;
??cpu_identify_19:
        LDR.N    R0,??DataTable6_43
        BL       printf
        B.N      ??cpu_identify_21
//  265 	default:printf("@@@@@@@@@-.");break;
??cpu_identify_20:
        LDR.N    R0,??DataTable6_44
        BL       printf
//  266 #else 	
//  267         default:break; 
//  268 #endif  	
//  269     }                
//  270 
//  271 #ifdef DEBUG_PRINT
//  272     printf("Silicon rev 1.%d\n",(SIM->SDID & SIM_SDID_REVID(0xF))>>SIM_SDID_REVID_SHIFT);
??cpu_identify_21:
        LDR.N    R0,??DataTable6_24  ;; 0x40048024
        LDR      R0,[R0, #+0]
        UBFX     R1,R0,#+12,#+4
        LDR.N    R0,??DataTable6_45
        BL       printf
//  273 #endif  
//  274     /* @@Kinetis @@@@P-flash size */
//  275     switch((SIM->FCFG1 & SIM_FCFG1_PFSIZE(0xF))>>SIM_FCFG1_PFSIZE_SHIFT)
        LDR.N    R0,??DataTable6_46  ;; 0x4004804c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+24
        ANDS     R0,R0,#0xF
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_22
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_23
        CMP      R0,#+11
        BEQ.N    ??cpu_identify_24
        CMP      R0,#+15
        BEQ.N    ??cpu_identify_25
        B.N      ??cpu_identify_26
//  276     {
//  277 #ifdef DEBUG_PRINT
//  278   #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10)) 
//  279     	case 0x7:printf("128 kBytes of P-flash	");break;
??cpu_identify_22:
        LDR.N    R0,??DataTable6_47
        BL       printf
        B.N      ??cpu_identify_27
//  280     	case 0x9:printf("256 kBytes of P-flash	");break;
??cpu_identify_23:
        LDR.N    R0,??DataTable6_48
        BL       printf
        B.N      ??cpu_identify_27
//  281         case 0xB:printf("512 kBytes of P-flash	");break;
??cpu_identify_24:
        LDR.N    R0,??DataTable6_49
        BL       printf
        B.N      ??cpu_identify_27
//  282     	case 0xF:printf("512 kBytes of P-flash	");break;
??cpu_identify_25:
        LDR.N    R0,??DataTable6_49
        BL       printf
        B.N      ??cpu_identify_27
//  283 	default:printf("@@@@@@@ P-flash size\n");break;
??cpu_identify_26:
        LDR.N    R0,??DataTable6_50
        BL       printf
//  284   #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15)) 
//  285         case 0xB:printf("512 kBytes of P-flash	");break;
//  286     	case 0xD:printf("1024 kBytes of P-flash	");break;
//  287     	case 0xF:printf("1024 kBytes of P-flash	");break;
//  288 	default:printf("@@@@@@@ P-flash size\n");break;
//  289   #endif
//  290 #else 	
//  291         default:break; 
//  292 #endif
//  293     }
//  294 
//  295 #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10))
//  296     /* @@@@@@ P-flash  @@ P-flash @ FlexNVM */
//  297     if (SIM->FCFG2 & SIM_FCFG2_PFLSH_MASK) 
??cpu_identify_27:
        LDR.N    R0,??DataTable6_51  ;; 0x40048050
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+8
        BPL.N    ??cpu_identify_28
//  298   #ifdef DEBUG_PRINT
//  299       printf("P-flash only\n");
        LDR.N    R0,??DataTable6_52
        BL       printf
        B.N      ??cpu_identify_29
//  300   #else 
//  301       asm("nop");
//  302   #endif
//  303     else
//  304       /* @@@@@@FlexNVM@@@Kinetis @@@@FlexNVM size */
//  305       switch((SIM->FCFG1 & SIM_FCFG1_NVMSIZE(0xF))>>SIM_FCFG1_NVMSIZE_SHIFT)
??cpu_identify_28:
        LDR.N    R0,??DataTable6_46  ;; 0x4004804c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+28
        CMP      R0,#+0
        BEQ.N    ??cpu_identify_30
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_31
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_32
        CMP      R0,#+15
        BEQ.N    ??cpu_identify_33
        B.N      ??cpu_identify_34
//  306       {
//  307   #ifdef DEBUG_PRINT
//  308 
//  309       	case 0x0:printf("0 kBytes of FlexNVM\n");break;
??cpu_identify_30:
        LDR.N    R0,??DataTable6_53
        BL       printf
        B.N      ??cpu_identify_29
//  310     	case 0x7:printf("128 kBytes of FlexNVM\n");break;
??cpu_identify_31:
        LDR.N    R0,??DataTable6_54
        BL       printf
        B.N      ??cpu_identify_29
//  311         case 0x9:printf("256 kBytes of FlexNVM\n");break;
??cpu_identify_32:
        LDR.N    R0,??DataTable6_55
        BL       printf
        B.N      ??cpu_identify_29
//  312     	case 0xF:printf("256 kBytes of FlexNVM\n");break;
??cpu_identify_33:
        LDR.N    R0,??DataTable6_55
        BL       printf
        B.N      ??cpu_identify_29
//  313 	default:printf("@@@@@@@ FlexNVM size\n");break;
??cpu_identify_34:
        LDR.N    R0,??DataTable6_56
        BL       printf
//  314   #else 	
//  315         default:break; 
//  316   #endif
//  317       }
//  318 #endif
//  319     
//  320     /* @@Kinetis @@@@RAM size */
//  321     switch((SIM->SOPT1 & SIM_SOPT1_RAMSIZE(0xF))>>SIM_SOPT1_RAMSIZE_SHIFT)
??cpu_identify_29:
        LDR.N    R0,??DataTable6_57  ;; 0x40047000
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+12
        ANDS     R0,R0,#0xF
        CMP      R0,#+5
        BEQ.N    ??cpu_identify_35
        CMP      R0,#+7
        BEQ.N    ??cpu_identify_36
        CMP      R0,#+8
        BEQ.N    ??cpu_identify_37
        CMP      R0,#+9
        BEQ.N    ??cpu_identify_38
        B.N      ??cpu_identify_39
//  322     {
//  323 #ifdef DEBUG_PRINT
//  324   #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10))
//  325     	case 0x5:printf("32 kBytes of RAM\n");break;
??cpu_identify_35:
        LDR.N    R0,??DataTable6_58
        BL       printf
        B.N      ??cpu_identify_40
//  326     	case 0x7:printf("64 kBytes of RAM\n");break;
??cpu_identify_36:
        LDR.N    R0,??DataTable6_59
        BL       printf
        B.N      ??cpu_identify_40
//  327     	case 0x8:printf("96 kBytes of RAM\n");break;
??cpu_identify_37:
        LDR.N    R0,??DataTable6_60
        BL       printf
        B.N      ??cpu_identify_40
//  328     	case 0x9:printf("128 kBytes of RAM\n");break;
??cpu_identify_38:
        LDR.N    R0,??DataTable6_61
        BL       printf
        B.N      ??cpu_identify_40
//  329 	default:printf("@@@@@@@ RAM size\n");break; 
??cpu_identify_39:
        LDR.N    R0,??DataTable6_62
        BL       printf
//  330   #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15))
//  331         case 0x9:printf("128 kBytes of RAM\n");break;
//  332 	default:printf("@@@@@@@ RAM size\n");break;
//  333   #endif
//  334 #else 	
//  335         default:break; 
//  336 #endif
//  337     }
//  338     flash_identify(); 
??cpu_identify_40:
        BL       flash_identify
//  339 }
        POP      {R0,PC}          ;; return
//  340 
//  341 /**
//  342  * Kinetis flash Identify
//  343  *
//  344  * @param  none
//  345  * @return none
//  346  *
//  347  * @brief @@Kinetis@@@@
//  348  * - flash parameter revision
//  349  * - flash version ID
//  350  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  351 static void flash_identify (void)
//  352 {
flash_identify:
        PUSH     {R5-R7,LR}
//  353   uint8 info[8];
//  354 #if (defined(CPU_MK60DZ10) || defined(CPU_MK60D10)) 
//  355     FTFL->FCCOB0 = 0x03;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable6_63  ;; 0x40020007
        STRB     R0,[R1, #+0]
//  356     FTFL->FCCOB1 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_64  ;; 0x40020006
        STRB     R0,[R1, #+0]
//  357     FTFL->FCCOB2 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_65  ;; 0x40020005
        STRB     R0,[R1, #+0]
//  358     FTFL->FCCOB3 = 0x00;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_66  ;; 0x40020004
        STRB     R0,[R1, #+0]
//  359     FTFL->FCCOB8 = 0x01;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable6_67  ;; 0x4002000f
        STRB     R0,[R1, #+0]
//  360     FTFL->FSTAT = FTFL_FSTAT_CCIF_MASK;
        MOVS     R0,#+128
        LDR.N    R1,??DataTable6_68  ;; 0x40020000
        STRB     R0,[R1, #+0]
//  361     while(!(FTFL->FSTAT & FTFL_FSTAT_CCIF_MASK));
??flash_identify_0:
        LDR.N    R0,??DataTable6_68  ;; 0x40020000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??flash_identify_0
//  362     info[0] = FTFL->FCCOB4; info[4] = FTFL->FCCOB8;
        LDR.N    R0,??DataTable6_69  ;; 0x4002000b
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+4]
        LDR.N    R0,??DataTable6_67  ;; 0x4002000f
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+8]
//  363     info[1] = FTFL->FCCOB5; info[5] = FTFL->FCCOB9;
        LDR.N    R0,??DataTable6_70  ;; 0x4002000a
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+5]
        LDR.N    R0,??DataTable6_71  ;; 0x4002000e
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+9]
//  364     info[2] = FTFL->FCCOB6; info[6] = FTFL->FCCOBA;
        LDR.N    R0,??DataTable6_72  ;; 0x40020009
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+6]
        LDR.N    R0,??DataTable6_73  ;; 0x4002000d
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+10]
//  365     info[3] = FTFL->FCCOB7; info[7] = FTFL->FCCOBB;
        LDR.N    R0,??DataTable6_74  ;; 0x40020008
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+7]
        LDR.N    R0,??DataTable6_75  ;; 0x4002000c
        LDRB     R0,[R0, #+0]
        STRB     R0,[SP, #+11]
//  366 #ifdef DEBUG_PRINT  
//  367     printf("Flash parameter version %d.%d.%d.%d\n",info[0],info[1],info[2],info[3]);
        LDRB     R0,[SP, #+7]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+6]
        LDRB     R2,[SP, #+5]
        LDRB     R1,[SP, #+4]
        LDR.N    R0,??DataTable6_76
        BL       printf
//  368     printf("Flash version ID %d.%d.%d.%d\n",info[4],info[5],info[6],info[7]); 
        LDRB     R0,[SP, #+11]
        STR      R0,[SP, #+0]
        LDRB     R3,[SP, #+10]
        LDRB     R2,[SP, #+9]
        LDRB     R1,[SP, #+8]
        LDR.N    R0,??DataTable6_77
        BL       printf
//  369 #endif  
//  370     FTFL->FSTAT = 0xFF;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable6_68  ;; 0x40020000
        STRB     R0,[R1, #+0]
//  371 #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15))
//  372     FTFE->FCCOB0 = 0x03;
//  373     FTFE->FCCOB1 = 0x00;
//  374     FTFE->FCCOB2 = 0x00;
//  375     FTFE->FCCOB3 = 0x08;
//  376     FTFE->FCCOB4 = 0x01;   
//  377     FTFE->FSTAT = FTFE_FSTAT_CCIF_MASK;
//  378     while(!(FTFE->FSTAT & FTFE_FSTAT_CCIF_MASK));
//  379     info[0] = FTFE->FCCOB4; info[4] = FTFE->FCCOB8;
//  380     info[1] = FTFE->FCCOB5; info[5] = FTFE->FCCOB9;
//  381     info[2] = FTFE->FCCOB6; info[6] = FTFE->FCCOBA;
//  382     info[3] = FTFE->FCCOB7; info[7] = FTFE->FCCOBB;
//  383 #ifdef DEBUG_PRINT    
//  384     printf("Flash parameter version %d.%d.%d.%d\n",info[0],info[1],info[2],info[3]);
//  385     printf("Flash version ID %d.%d.%d.%d\n",info[4],info[5],info[6],info[7]);  
//  386 #endif   
//  387     FTFE->FSTAT = 0x7F;
//  388 #endif
//  389 }
        POP      {R0-R2,PC}       ;; return
//  390 
//  391 /**
//  392  * Diagnostic_Reset_Source
//  393  *
//  394  * @param  none
//  395  * @return none
//  396  *
//  397  * @brief @@Kinetis@@@@
//  398  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  399 void Diagnostic_Reset_Source(void)
//  400 {
Diagnostic_Reset_Source:
        PUSH     {R7,LR}
//  401 #ifdef DEBUG_PRINT 
//  402 #if (defined(CPU_MK60DZ10)) 
//  403   /* @@@@@@@@@@*/
//  404   if (MC->SRSH & MC_SRSH_SW_MASK)
        LDR.N    R0,??DataTable6_78  ;; 0x4007e000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??Diagnostic_Reset_Source_0
//  405           printf("Software Reset\n");
        LDR.N    R0,??DataTable6_79
        BL       printf
//  406   if (MC->SRSH & MC_SRSH_LOCKUP_MASK)
??Diagnostic_Reset_Source_0:
        LDR.N    R0,??DataTable6_78  ;; 0x4007e000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??Diagnostic_Reset_Source_1
//  407           printf("Core Lockup Event Reset\n");
        LDR.N    R0,??DataTable6_80
        BL       printf
//  408   if (MC->SRSH & MC_SRSH_JTAG_MASK)
??Diagnostic_Reset_Source_1:
        LDR.N    R0,??DataTable6_78  ;; 0x4007e000
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??Diagnostic_Reset_Source_2
//  409           printf("JTAG Reset\n");
        LDR.N    R0,??DataTable6_81
        BL       printf
//  410   if (MC->SRSL & MC_SRSL_POR_MASK)
??Diagnostic_Reset_Source_2:
        LDR.N    R0,??DataTable6_82  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??Diagnostic_Reset_Source_3
//  411           printf("Power-on Reset\n");
        LDR.N    R0,??DataTable6_83
        BL       printf
//  412   if (MC->SRSL & MC_SRSL_PIN_MASK)
??Diagnostic_Reset_Source_3:
        LDR.N    R0,??DataTable6_82  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??Diagnostic_Reset_Source_4
//  413           printf("External Pin Reset\n");
        LDR.N    R0,??DataTable6_84
        BL       printf
//  414   if (MC->SRSL & MC_SRSL_COP_MASK)
??Diagnostic_Reset_Source_4:
        LDR.N    R0,??DataTable6_82  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??Diagnostic_Reset_Source_5
//  415           printf("Watchdog(COP) Reset\n");
        LDR.N    R0,??DataTable6_85
        BL       printf
//  416   if (MC->SRSL & MC_SRSL_LOC_MASK)
??Diagnostic_Reset_Source_5:
        LDR.N    R0,??DataTable6_82  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??Diagnostic_Reset_Source_6
//  417           printf("Loss of Clock Reset\n");
        LDR.N    R0,??DataTable6_86
        BL       printf
//  418   if (MC->SRSL & MC_SRSL_LVD_MASK)
??Diagnostic_Reset_Source_6:
        LDR.N    R0,??DataTable6_82  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??Diagnostic_Reset_Source_7
//  419           printf("Low-voltage Detect Reset\n");
        LDR.N    R0,??DataTable6_87
        BL       printf
//  420   if (MC->SRSL & MC_SRSL_WAKEUP_MASK)
??Diagnostic_Reset_Source_7:
        LDR.N    R0,??DataTable6_82  ;; 0x4007e001
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??Diagnostic_Reset_Source_8
//  421           printf("LLWU Reset\n");
        LDR.N    R0,??DataTable6_88
        BL       printf
//  422 #elif (defined(CPU_MK60F12) || defined(CPU_MK60F15) || defined(CPU_MK60D10))
//  423   
//  424   if (RCM->SRS1 & RCM_SRS1_SACKERR_MASK)
//  425           printf("Stop Mode Acknowledge Error Reset\n");
//  426   if (RCM->SRS1 & RCM_SRS1_EZPT_MASK)
//  427           printf("EzPort Reset\n");
//  428   if (RCM->SRS1 & RCM_SRS1_MDM_AP_MASK)
//  429           printf("MDM-AP Reset\n");
//  430   if (RCM->SRS1 & RCM_SRS1_SW_MASK)
//  431           printf("Software Reset\n");
//  432   if (RCM->SRS1 & RCM_SRS1_LOCKUP_MASK)
//  433           printf("Core Lockup Event Reset\n");
//  434   if (RCM->SRS1 & RCM_SRS1_JTAG_MASK)
//  435           printf("JTAG Reset\n");
//  436   if (RCM->SRS0 & RCM_SRS0_POR_MASK)
//  437           printf("Power-on Reset\n");
//  438   if (RCM->SRS0 & RCM_SRS0_PIN_MASK)
//  439           printf("External Pin Reset\n");
//  440   if (RCM->SRS0 & RCM_SRS0_WDOG_MASK)
//  441           printf("Watchdog(COP) Reset\n");
//  442   if (RCM->SRS0 & RCM_SRS0_LOC_MASK)
//  443           printf("Loss of Clock Reset\n");
//  444   if (RCM->SRS0 & RCM_SRS0_LVD_MASK)
//  445           printf("Low-voltage Detect Reset\n");
//  446   if (RCM->SRS0 & RCM_SRS0_WAKEUP_MASK)
//  447   {
//  448     printf("[outSRS]Wakeup bit set from low power mode exit\n");
//  449     printf("[outSRS]SMC_PMPROT = %#02X ", (SMC->PMPROT))  ;
//  450     printf("[outSRS]SMC_PMCTRL = %#02X ", (SMC->PMCTRL))  ;
//  451     printf("[outSRS]SMC_VLLSCTRL = %#02X ", (SMC->VLLSCTRL))  ;
//  452     printf("[outSRS]SMC_PMSTAT = %#02X \r\n", (SMC->PMSTAT))  ;
//  453 
//  454     if ((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 3)
//  455       printf("[outSRS] LLS exit \n") ;
//  456     if (((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 4) && ((SMC->VLLSCTRL & SMC_VLLSCTRL_VLLSM_MASK)== 1))
//  457       printf("[outSRS] VLLS1 exit \n") ;
//  458     if (((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 4) && ((SMC->VLLSCTRL & SMC_VLLSCTRL_VLLSM_MASK)== 2))
//  459       printf("[outSRS] VLLS2 exit \n") ;
//  460     if (((SMC->PMCTRL & SMC_PMCTRL_STOPM_MASK)== 4) && ((SMC->VLLSCTRL & SMC_VLLSCTRL_VLLSM_MASK)== 3))
//  461       printf("[outSRS] VLLS3 exit \n") ; 
//  462   }
//  463 #endif
//  464 #endif
//  465 }
??Diagnostic_Reset_Source_8:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0x40048038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0x4005200e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0x40052000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     SystemCoreClock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     g_core_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     0x40048044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     g_bus_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_7:
        DC32     g_flexbus_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_8:
        DC32     g_flash_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_9:
        DC32     0x400eb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_10:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_11:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_12:
        DC32     ?_2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_13:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_14:
        DC32     ?_4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_15:
        DC32     ?_5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_16:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_17:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_18:
        DC32     0x40064005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_19:
        DC32     0x2faf080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_20:
        DC32     0x40064004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_21:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_22:
        DC32     0xe000ed04

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_23:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_24:
        DC32     0x40048024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_25:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_26:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_27:
        DC32     ?_12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_28:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_29:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_30:
        DC32     ?_15

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_31:
        DC32     ?_16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_32:
        DC32     ?_17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_33:
        DC32     ?_18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_34:
        DC32     ?_19

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_35:
        DC32     ?_20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_36:
        DC32     ?_21

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_37:
        DC32     ?_22

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_38:
        DC32     ?_23

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_39:
        DC32     ?_24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_40:
        DC32     ?_25

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_41:
        DC32     ?_26

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_42:
        DC32     ?_27

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_43:
        DC32     ?_28

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_44:
        DC32     ?_29

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_45:
        DC32     ?_30

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_46:
        DC32     0x4004804c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_47:
        DC32     ?_31

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_48:
        DC32     ?_32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_49:
        DC32     ?_33

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_50:
        DC32     ?_34

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_51:
        DC32     0x40048050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_52:
        DC32     ?_35

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_53:
        DC32     ?_36

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_54:
        DC32     ?_37

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_55:
        DC32     ?_38

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_56:
        DC32     ?_39

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_57:
        DC32     0x40047000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_58:
        DC32     ?_40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_59:
        DC32     ?_41

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_60:
        DC32     ?_42

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_61:
        DC32     ?_43

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_62:
        DC32     ?_44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_63:
        DC32     0x40020007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_64:
        DC32     0x40020006

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_65:
        DC32     0x40020005

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_66:
        DC32     0x40020004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_67:
        DC32     0x4002000f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_68:
        DC32     0x40020000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_69:
        DC32     0x4002000b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_70:
        DC32     0x4002000a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_71:
        DC32     0x4002000e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_72:
        DC32     0x40020009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_73:
        DC32     0x4002000d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_74:
        DC32     0x40020008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_75:
        DC32     0x4002000c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_76:
        DC32     ?_45

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_77:
        DC32     ?_46

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_78:
        DC32     0x4007e000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_79:
        DC32     ?_47

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_80:
        DC32     ?_48

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_81:
        DC32     ?_49

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_82:
        DC32     0x4007e001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_83:
        DC32     ?_50

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_84:
        DC32     ?_51

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_85:
        DC32     ?_52

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_86:
        DC32     ?_53

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_87:
        DC32     ?_54

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_88:
        DC32     ?_55

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "\015\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_1:
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 20H, 0BBH, 0F9H, 0D3H, 0DAH
        DC8 0C0H, 0ADH, 0C6H, 0D5H, 0C0H, 0BCH, 0B5H, 0C2H
        DC8 4BH, 36H, 30H, 0B5H, 0D7H, 0B2H, 0E3H, 0BFH
        DC8 0E2H, 20H, 68H, 74H, 74H, 70H, 3AH, 2FH
        DC8 2FH, 77H, 77H, 77H, 2EH, 6CH, 70H, 6CH
        DC8 64H, 2EH, 63H, 6EH, 20H, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 0DH, 0AH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_2:
        DC8 "OSKinetis\271\314\274\376\277\342\260\346\261\276:%s\tmail:support@lpld.cn\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_3:
        DC8 "3.1 b1"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_4:
        DC8 "\317\265\315\263\304\332\272\313\312\261\326\323:%dMHz\t\327\334\317\337\312\261\326\323:%dMHz\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_5:
        DC8 "FlexBus\312\261\326\323:%dMHz\tFlash\312\261\326\323:%dMHz\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_6:
        DC8 0CFH, 0B5H, 0CDH, 0B3H, 0C6H, 0F4H, 0B6H, 0AFH
        DC8 0CDH, 0EAH, 0B1H, 0CFH, 0A3H, 0ACH, 0C8H, 0F4H
        DC8 0D2H, 0AAH, 0BDH, 0FBH, 0D3H, 0C3H, 0B5H, 0F7H
        DC8 0CAH, 0D4H, 0CAH, 0E4H, 0B3H, 0F6H, 0C7H, 0EBH
        DC8 0B6H, 0A8H, 0D2H, 0E5H, 50H, 52H, 49H, 4EH
        DC8 54H, 5FH, 4FH, 4EH, 5FH, 4FH, 46H, 46H
        DC8 0CEH, 0AAH, 31H, 28H, 6BH, 36H, 30H, 5FH
        DC8 63H, 61H, 72H, 64H, 2EH, 68H, 29H, 0DH
        DC8 0AH, 0
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_7:
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH, 2AH
        DC8 2AH, 2AH, 2AH, 2AH, 0DH, 0AH, 0
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_8:
        DC8 "\015\012****\304\332\272\313\267\242\311\372\323\262\274\376\264\355\316\363*****\015\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_9:
        DC8 "\015\012****\275\370\310\353\316\264\266\250\322\345\326\320\266\317,Interrupt Number %d*****\015\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_10:
        DC8 "\012K10-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_11:
        DC8 "\012K20-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_12:
        DC8 "\012K30-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_13:
        DC8 "\012K40-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_14:
        DC8 "\012K60-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_15:
        DC8 "\012K70-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_16:
        DC8 "\012K50-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_17:
        DC8 "\012K53-"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_18:
        DC8 "\012\262\273\304\334\312\266\261\360\265\245\306\254\273\372\320\315\272\305-"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_19:
        DC8 "32pin-"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_20:
        DC8 "48pin-"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_21:
        DC8 "64pin-"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_22:
        DC8 "80pin-"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_23:
        DC8 "81pin-"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_24:
        DC8 "100pin-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_25:
        DC8 "104pin-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_26:
        DC8 "144pin-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_27:
        DC8 "196pin-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_28:
        DC8 "256pin-"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_29:
        DC8 "\262\273\304\334\312\266\261\360\265\245\306\254\273\372\267\342\327\260-."
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_30:
        DC8 "Silicon rev 1.%d\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_31:
        DC8 "128 kBytes of P-flash\t"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_32:
        DC8 "256 kBytes of P-flash\t"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_33:
        DC8 "512 kBytes of P-flash\t"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_34:
        DC8 "\262\273\304\334\312\266\261\360\265\245\306\254\273\372 P-flash size\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_35:
        DC8 "P-flash only\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_36:
        DC8 "0 kBytes of FlexNVM\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_37:
        DC8 "128 kBytes of FlexNVM\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_38:
        DC8 "256 kBytes of FlexNVM\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_39:
        DC8 "\262\273\304\334\312\266\261\360\265\245\306\254\273\372 FlexNVM size\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_40:
        DC8 "32 kBytes of RAM\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_41:
        DC8 "64 kBytes of RAM\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_42:
        DC8 "96 kBytes of RAM\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_43:
        DC8 "128 kBytes of RAM\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_44:
        DC8 "\262\273\304\334\312\266\261\360\265\245\306\254\273\372 RAM size\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_45:
        DC8 "Flash parameter version %d.%d.%d.%d\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_46:
        DC8 "Flash version ID %d.%d.%d.%d\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_47:
        DC8 "Software Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_48:
        DC8 "Core Lockup Event Reset\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_49:
        DC8 "JTAG Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_50:
        DC8 "Power-on Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_51:
        DC8 "External Pin Reset\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_52:
        DC8 "Watchdog(COP) Reset\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_53:
        DC8 "Loss of Clock Reset\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_54:
        DC8 "Low-voltage Detect Reset\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
?_55:
        DC8 "LLWU Reset\012"

        END
//  466 
// 
//     4 bytes in section .data
// 1 216 bytes in section .rodata
// 1 558 bytes in section .text
// 
// 1 558 bytes of CODE  memory
// 1 216 bytes of CONST memory
//     4 bytes of DATA  memory
//
//Errors: none
//Warnings: none
