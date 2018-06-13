///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      17/May/2018  19:45:46
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\workspace\LPLD_OSKinetis_V3\lib\LPLD\HW\HW_PIT.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EW6C98.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\lib\LPLD\HW\HW_PIT.c -D LPLD_K60 -D
//        USE_K60DZ10 -lCN
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List -lB
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List -o
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\Obj
//        --no_unroll --no_inline --no_tbaa --no_scheduling --debug
//        --endian=little --cpu=Cortex-M4 -e --fpu=None --dlib_config
//        "D:\Program Files\IAR Systems\Embedded Workbench
//        8.0\arm\INC\c\DLib_Config_Normal.h" -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\app\ -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\CPU\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\common\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\LPLD\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\LPLD\HW\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\FatFs\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\FatFs\option\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\USB\common\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\USB\driver\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\USB\descriptor\
//        -I
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\..\..\..\lib\USB\class\
//        -Om -I "D:\Program Files\IAR Systems\Embedded Workbench
//        8.0\arm\CMSIS\Include\" -D ARM_MATH_CM4)
//    Locale       =  C
//    List file    =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\HW_PIT.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN g_bus_clock

        PUBLIC LPLD_PIT_Deinit
        PUBLIC LPLD_PIT_DisableIrq
        PUBLIC LPLD_PIT_EnableIrq
        PUBLIC LPLD_PIT_Init
        PUBLIC PIT0_IRQHandler
        PUBLIC PIT1_IRQHandler
        PUBLIC PIT2_IRQHandler
        PUBLIC PIT3_IRQHandler
        PUBLIC PIT_ISR

// D:\workspace\LPLD_OSKinetis_V3\lib\LPLD\HW\HW_PIT.c
//    1 /**
//    2  * @file HW_PIT.c
//    3  * @version 3.0[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief PIT底层模块相关函数
//    6  *
//    7  * 更改建议:不建议修改
//    8  *
//    9  * 版权所有:北京拉普兰德电子技术有限公司
//   10  * http://www.lpld.cn
//   11  * mail:support@lpld.cn
//   12  *
//   13  * @par
//   14  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   15  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   16  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   17  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   18  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   19  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   20  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   21  */
//   22 #include "common.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void __NVIC_EnableIRQ(IRQn_Type)
__NVIC_EnableIRQ:
        MOVS     R1,R0
        BMI.N    ??__NVIC_EnableIRQ_0
        MOVS     R2,#+1
        AND      R0,R0,#0x1F
        LSL      R0,R2,R0
        LDR.N    R2,??DataTable7  ;; 0xe000e100
        LSRS     R1,R1,#+5
        STR      R0,[R2, R1, LSL #+2]
??__NVIC_EnableIRQ_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void __NVIC_DisableIRQ(IRQn_Type)
__NVIC_DisableIRQ:
        MOVS     R1,R0
        BMI.N    ??__NVIC_DisableIRQ_0
        MOVS     R2,#+1
        AND      R0,R0,#0x1F
        LSL      R0,R2,R0
        LDR.N    R2,??DataTable7_1  ;; 0xe000e180
        LSRS     R1,R1,#+5
        STR      R0,[R2, R1, LSL #+2]
??__NVIC_DisableIRQ_0:
        BX       LR               ;; return
//   23 #include "HW_PIT.h"
//   24 
//   25 //@@@@@@@@@@@@@

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   26 PIT_ISR_CALLBACK PIT_ISR[4];
PIT_ISR:
        DS8 16
//   27 
//   28 /*
//   29  * LPLD_PIT_Init
//   30  * PIT@@@@@@@@@@PITx@@@@@@@@@@@@
//   31  * 
//   32  * @@:
//   33  *    pit_init_structure--PIT@@@@@@@
//   34  *                        @@@@@PIT_InitTypeDef
//   35  *
//   36  * @@:
//   37  *    0--@@@@
//   38  *    1--@@@@
//   39  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 uint8 LPLD_PIT_Init(PIT_InitTypeDef pit_init_structure)
//   41 { 
LPLD_PIT_Init:
        PUSH     {R0-R3}
        PUSH     {R4-R6}
//   42   //@@@@@@@
//   43   uint32 ldval = pit_init_structure.PIT_PeriodUs*(g_bus_clock/1000000)
//   44                + pit_init_structure.PIT_PeriodMs*1000*(g_bus_clock/1000000)
//   45                + pit_init_structure.PIT_PeriodS*1000000*(g_bus_clock/1000000);
        LDR.N    R0,??DataTable7_2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_3  ;; 0xf4240
        UDIV     R2,R0,R1
        LDR      R3,[SP, #+16]
        LDR      R1,[SP, #+20]
        MULS     R1,R2,R1
        MOV      R0,#+1000
        MULS     R1,R0,R1
        MLA      R3,R2,R3,R1
        LDR      R1,[SP, #+24]
        MULS     R1,R2,R1
        LDR.N    R0,??DataTable7_3  ;; 0xf4240
        MLA      R1,R0,R1,R3
//   46   PITx pitx = pit_init_structure.PIT_Pitx;
        LDRB     R0,[SP, #+12]
//   47   PIT_ISR_CALLBACK isr_func = pit_init_structure.PIT_Isr;
        LDR      R2,[SP, #+28]
//   48   
//   49   //@@@@
//   50   ASSERT( pitx <= PIT3);        //@@@@@
//   51   ASSERT( ldval > 0);           //@@@@@@                
//   52   
//   53   //@@@@@@@@
//   54   SIM->SCGC6 |= SIM_SCGC6_PIT_MASK;
        LDR.N    R3,??DataTable7_4  ;; 0x4004803c
        LDR      R4,[R3, #+0]
        ORR      R4,R4,#0x800000
        STR      R4,[R3, #+0]
//   55   
//   56   // @@ PIT
//   57   PIT->MCR = 0x00;
        MOVS     R3,#+0
        LDR.N    R4,??DataTable7_5  ;; 0x40037000
        STR      R3,[R4, #+0]
//   58  
//   59   if(isr_func != NULL){
        LSLS     R3,R0,#+4
        LDR.N    R4,??DataTable7_6  ;; 0x40037100
        ADDS     R5,R4,R3
        MOVS     R6,R2
        BEQ.N    ??LPLD_PIT_Init_0
//   60     PIT_ISR[pitx] = isr_func;
        LDR.N    R6,??DataTable7_7
        STR      R2,[R6, R0, LSL #+2]
//   61     //@@@@
//   62     PIT->CHANNEL[pitx].TCTRL = PIT_TCTRL_TIE_MASK;
        MOVS     R0,#+2
        STR      R0,[R5, #+8]
//   63     //@NVIC@@@PIT@@
//   64     //enable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx)); 
//   65   }
//   66   
//   67   //period = (period_ns/bus_period_ns)-1
//   68   PIT->CHANNEL[pitx].LDVAL = ldval-1;
??LPLD_PIT_Init_0:
        SUBS     R1,R1,#+1
        STR      R1,[R4, R3]
//   69   //@@@@
//   70   //PIT->CHANNEL[pitx].TCTRL = PIT_TCTRL_TIE_MASK;
//   71   //@@@@
//   72   PIT->CHANNEL[pitx].TCTRL |= PIT_TCTRL_TEN_MASK;
        LDR      R0,[R5, #+8]
        ORR      R0,R0,#0x1
        STR      R0,[R5, #+8]
//   73   
//   74   return 1;
        MOVS     R0,#+1
        POP      {R4-R6}
        ADD      SP,SP,#+16
        BX       LR               ;; return
//   75 }
//   76 
//   77 /*
//   78  * LPLD_PIT_Deinit
//   79  * PIT@@@@@@@@@@@@PITx
//   80  * 
//   81  * @@:
//   82  *    pit_init_structure--PIT@@@@@@@
//   83  *                        @@@@@PIT_InitTypeDef
//   84  *
//   85  * @@:
//   86  *    @
//   87  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 void LPLD_PIT_Deinit(PIT_InitTypeDef pit_init_structure)
//   89 { 
LPLD_PIT_Deinit:
        PUSH     {R0-R3}
        PUSH     {R4,LR}
//   90   PITx pitx = pit_init_structure.PIT_Pitx;
        LDRB     R4,[SP, #+8]
//   91   
//   92   //@@@@
//   93   ASSERT( pitx <= PIT3);        //@@@@@              
//   94 
//   95   disable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx)); 
        ADD      R0,R4,#+68
        SXTB     R0,R0
        BL       __NVIC_DisableIRQ
//   96 
//   97   //@@@@\@@@@
//   98   PIT->CHANNEL[pitx].TCTRL = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_6  ;; 0x40037100
        ADD      R1,R1,R4, LSL #+4
        STR      R0,[R1, #+8]
//   99 }
        POP      {R4}
        LDR      PC,[SP], #+20    ;; return
//  100 
//  101 /*
//  102  * LPLD_PIT_EnableIrq
//  103  * @@PITx@@
//  104  * 
//  105  * @@:
//  106  *    pit_init_structure--PIT@@@@@@@
//  107  *                        @@@@@PIT_InitTypeDef
//  108  *
//  109  * @@:
//  110  *    @
//  111  *
//  112  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  113 void LPLD_PIT_EnableIrq(PIT_InitTypeDef pit_init_structure)
//  114 {
LPLD_PIT_EnableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  115   PITx pitx = pit_init_structure.PIT_Pitx;
//  116   
//  117   //@@@@
//  118   ASSERT( pitx <= PIT3);                //@@PITx
//  119 
//  120   enable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx)); 
        LDRSB    R0,[SP, #+8]
        ADDS     R0,R0,#+68
        SXTB     R0,R0
        BL       __NVIC_EnableIRQ
//  121 }
        POP      {R0}
        LDR      PC,[SP], #+20    ;; return
//  122 
//  123 /*
//  124  * LPLD_PIT_DisableIrq
//  125  * @@PITx@@
//  126  * 
//  127  * @@:
//  128  *    pit_init_structure--PIT@@@@@@@
//  129  *                        @@@@@PIT_InitTypeDef
//  130  *
//  131  * @@:
//  132  *    @
//  133  *
//  134  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  135 void LPLD_PIT_DisableIrq(PIT_InitTypeDef pit_init_structure)
//  136 {
LPLD_PIT_DisableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  137   PITx pitx = pit_init_structure.PIT_Pitx;
//  138   
//  139   //@@@@
//  140   ASSERT( pitx <= PIT3);                //@@PITx
//  141   
//  142   disable_irq((IRQn_Type)(PIT0_IRQn + (IRQn_Type)pitx));
        LDRSB    R0,[SP, #+8]
        ADDS     R0,R0,#+68
        SXTB     R0,R0
        BL       __NVIC_DisableIRQ
//  143 }
        POP      {R0}
        LDR      PC,[SP], #+20    ;; return
//  144 
//  145 
//  146 /*
//  147  * PIT0--PIT3@@@@@@
//  148  * @@@@@startup_K60.s@@@@@@@@@
//  149  * @@@@@@@@@@@@@@@@@@@@@
//  150  */
//  151 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  152 void PIT0_IRQHandler(void)
//  153 {
PIT0_IRQHandler:
        PUSH     {R7,LR}
//  154 #if (UCOS_II > 0u)
//  155   OS_CPU_SR  cpu_sr = 0u;
//  156   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  157   OSIntEnter();
//  158   OS_EXIT_CRITICAL();
//  159 #endif
//  160   
//  161   //@@@@@@@@@@@
//  162   PIT_ISR[0]();  
        LDR.N    R0,??DataTable7_7
        LDR      R0,[R0, #+0]
        BLX      R0
//  163   //@@@@@@@
//  164   PIT->CHANNEL[0].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_8  ;; 0x4003710c
        LDR      R1,[R0, #+0]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+0]
//  165   
//  166 #if (UCOS_II > 0u)
//  167   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  168 #endif
//  169 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  170 void PIT1_IRQHandler(void)
//  171 {
PIT1_IRQHandler:
        PUSH     {R7,LR}
//  172 #if (UCOS_II > 0u)
//  173   OS_CPU_SR  cpu_sr = 0u;
//  174   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  175   OSIntEnter();
//  176   OS_EXIT_CRITICAL();
//  177 #endif
//  178   
//  179   //@@@@@@@@@@@
//  180   PIT_ISR[1]();  
        LDR.N    R0,??DataTable7_7
        LDR      R0,[R0, #+4]
        BLX      R0
//  181   //@@@@@@@
//  182   PIT->CHANNEL[1].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_9  ;; 0x4003711c
        LDR      R1,[R0, #+0]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+0]
//  183   
//  184 #if (UCOS_II > 0u)
//  185   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  186 #endif
//  187 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  188 void PIT2_IRQHandler(void)
//  189 {
PIT2_IRQHandler:
        PUSH     {R7,LR}
//  190 #if (UCOS_II > 0u)
//  191   OS_CPU_SR  cpu_sr = 0u;
//  192   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  193   OSIntEnter();
//  194   OS_EXIT_CRITICAL();
//  195 #endif
//  196   
//  197   //@@@@@@@@@@@
//  198   PIT_ISR[2]();  
        LDR.N    R0,??DataTable7_7
        LDR      R0,[R0, #+8]
        BLX      R0
//  199   //@@@@@@@
//  200   PIT->CHANNEL[2].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_10  ;; 0x4003712c
        LDR      R1,[R0, #+0]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+0]
//  201   
//  202 #if (UCOS_II > 0u)
//  203   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  204 #endif
//  205 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  206 void PIT3_IRQHandler(void)
//  207 {
PIT3_IRQHandler:
        PUSH     {R7,LR}
//  208 #if (UCOS_II > 0u)
//  209   OS_CPU_SR  cpu_sr = 0u;
//  210   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  211   OSIntEnter();
//  212   OS_EXIT_CRITICAL();
//  213 #endif
//  214   
//  215   //@@@@@@@@@@@
//  216   PIT_ISR[3]();  
        LDR.N    R0,??DataTable7_7
        LDR      R0,[R0, #+12]
        BLX      R0
//  217   //@@@@@@@
//  218   PIT->CHANNEL[3].TFLG |= PIT_TFLG_TIF_MASK;
        LDR.N    R0,??DataTable7_11  ;; 0x4003713c
        LDR      R1,[R0, #+0]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+0]
//  219   
//  220 #if (UCOS_II > 0u)
//  221   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  222 #endif
//  223 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     g_bus_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x4004803c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x40037000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x40037100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     PIT_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0x4003710c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     0x4003711c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x4003712c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     0x4003713c

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//  16 bytes in section .bss
// 356 bytes in section .text
// 
// 356 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none
