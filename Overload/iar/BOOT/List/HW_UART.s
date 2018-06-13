///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Mar/2018  21:10:23
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\workspace\LPLD_OSKinetis_V3\lib\LPLD\HW\HW_UART.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWCF40.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\lib\LPLD\HW\HW_UART.c -D LPLD_K60 -D
//        USE_K60DZ10 -lCN
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\BOOT\List -lB
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\BOOT\List -o
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\BOOT\Obj --no_cse
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\BOOT\List\HW_UART.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN g_bus_clock
        EXTERN g_core_clock

        PUBLIC LPLD_UART_DisableIrq
        PUBLIC LPLD_UART_EnableIrq
        PUBLIC LPLD_UART_GetChar
        PUBLIC LPLD_UART_GetChar_Present
        PUBLIC LPLD_UART_Init
        PUBLIC LPLD_UART_PutChar
        PUBLIC LPLD_UART_PutCharArr
        PUBLIC LPLD_UART_RxFIFO_Flush
        PUBLIC LPLD_UART_TxFIFO_Flush
        PUBLIC UART0_ERR_IRQHandler
        PUBLIC UART0_IRQHandler
        PUBLIC UART1_ERR_IRQHandler
        PUBLIC UART1_IRQHandler
        PUBLIC UART2_ERR_IRQHandler
        PUBLIC UART2_IRQHandler
        PUBLIC UART3_ERR_IRQHandler
        PUBLIC UART3_IRQHandler
        PUBLIC UART4_ERR_IRQHandler
        PUBLIC UART4_IRQHandler
        PUBLIC UART5_ERR_IRQHandler
        PUBLIC UART5_IRQHandler
        PUBLIC UART_R_ISR
        PUBLIC UART_T_ISR

// D:\workspace\LPLD_OSKinetis_V3\lib\LPLD\HW\HW_UART.c
//    1 /**
//    2  * @file HW_UART.c
//    3  * @version 3.0[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief UART底层模块相关函数
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
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BMI.N    ??__NVIC_EnableIRQ_0
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.W    R1,??DataTable10  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
??__NVIC_EnableIRQ_0:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void __NVIC_DisableIRQ(IRQn_Type)
__NVIC_DisableIRQ:
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BMI.N    ??__NVIC_DisableIRQ_0
        MOVS     R2,#+1
        ANDS     R1,R0,#0x1F
        LSLS     R2,R2,R1
        LDR.W    R1,??DataTable10_1  ;; 0xe000e180
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
??__NVIC_DisableIRQ_0:
        BX       LR               ;; return
//   23 #include "HW_UART.h"
//   24 
//   25 //@@@@@@@@@@@@@@

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   26 UART_ISR_CALLBACK UART_R_ISR[6];
UART_R_ISR:
        DS8 24
//   27 //@@@@@@@@@@@@@@

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   28 UART_ISR_CALLBACK UART_T_ISR[6];  
UART_T_ISR:
        DS8 24
//   29 
//   30 
//   31 /*
//   32  * LPLD_UART_Init
//   33  * @@@UART@@@@@@@@@@@@@
//   34  * 
//   35  * @@:
//   36  *    uart_init_structure--UART@@@@@@@
//   37  *                        @@@@@UART_InitTypeDef
//   38  *
//   39  * @@:
//   40  *    @
//   41  *
//   42  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 void LPLD_UART_Init(UART_InitTypeDef uart_init_structure)
//   44 {
LPLD_UART_Init:
        PUSH     {R0-R3}
        PUSH     {R4-R7,LR}
//   45   register uint16 sbr, brfa;
//   46   uint32 sysclk;
//   47   uint8 temp, x ,len;
//   48   UART_Type *uartx = uart_init_structure.UART_Uartx;
        LDR      R2,[SP, #+20]
//   49   uint32 baud = uart_init_structure.UART_BaudRate;
        LDR      R0,[SP, #+24]
//   50   PortPinsEnum_Type tx_pin = uart_init_structure.UART_TxPin;
        LDRB     R7,[SP, #+28]
//   51   PortPinsEnum_Type rx_pin = uart_init_structure.UART_RxPin;
        LDRB     R1,[SP, #+29]
//   52   UART_ISR_CALLBACK rx_isr = uart_init_structure.UART_RxIsr;
        LDR      R3,[SP, #+40]
//   53   UART_ISR_CALLBACK tx_isr = uart_init_structure.UART_TxIsr;
        LDR      R4,[SP, #+44]
//   54   
//   55   if(baud == NULL)
        CMP      R0,#+0
        BNE.N    ??LPLD_UART_Init_0
//   56   {
//   57     baud = 9600;
        MOV      R0,#+9600
//   58   }
//   59   
//   60   //@@@@@UART@@@@@@@@@GPIO@UART@@@@   
//   61   if(uartx == UART0)
??LPLD_UART_Init_0:
        LDR.W    R5,??DataTable10_2  ;; 0x4006a000
        CMP      R2,R5
        BNE.N    ??LPLD_UART_Init_1
//   62   {
//   63     x = 0;
        MOVS     R5,#+0
//   64     sysclk = g_core_clock;
        LDR.W    R6,??DataTable10_3
        LDR      R6,[R6, #+0]
//   65     SIM->SCGC4 |= SIM_SCGC4_UART0_MASK;
        LDR.W    R12,??DataTable10_4  ;; 0x40048034
        LDR      R12,[R12, #+0]
        ORRS     R12,R12,#0x400
        LDR.W    LR,??DataTable10_4  ;; 0x40048034
        STR      R12,[LR, #+0]
//   66     
//   67     if(tx_pin == PTA2)
        MOV      R12,R7
        UXTB     R12,R12          ;; ZeroExt  R12,R12,#+24,#+24
        CMP      R12,#+2
        BNE.N    ??LPLD_UART_Init_2
//   68       PORTA->PCR[2] = PORT_PCR_MUX(2); 
        MOV      R7,#+512
        LDR.W    R12,??DataTable10_5  ;; 0x40049008
        STR      R7,[R12, #+0]
        B.N      ??LPLD_UART_Init_3
//   69     else if(tx_pin == PTA14)
??LPLD_UART_Init_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+14
        BNE.N    ??LPLD_UART_Init_4
//   70       PORTA->PCR[14] = PORT_PCR_MUX(3); 
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_6  ;; 0x40049038
        STR      R7,[R12, #+0]
        B.N      ??LPLD_UART_Init_3
//   71     else
//   72       PORTB->PCR[17] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_4:
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_7  ;; 0x4004a044
        STR      R7,[R12, #+0]
//   73     
//   74     if(rx_pin == PTA1)
??LPLD_UART_Init_3:
        MOVS     R7,R1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+1
        BNE.N    ??LPLD_UART_Init_5
//   75       PORTA->PCR[1] = PORT_PCR_MUX(2); 
        MOV      R1,#+512
        LDR.W    R7,??DataTable10_8  ;; 0x40049004
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//   76     else if(rx_pin == PTA15)
??LPLD_UART_Init_5:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+15
        BNE.N    ??LPLD_UART_Init_7
//   77       PORTA->PCR[15] = PORT_PCR_MUX(3); 
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_9  ;; 0x4004903c
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//   78     else
//   79       PORTB->PCR[16] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_7:
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_10  ;; 0x4004a040
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//   80   }
//   81   else
//   82   {
//   83     if (uartx == UART1)
??LPLD_UART_Init_1:
        LDR.W    R5,??DataTable10_11  ;; 0x4006b000
        CMP      R2,R5
        BNE.N    ??LPLD_UART_Init_8
//   84     {
//   85       x = 1;
        MOVS     R5,#+1
//   86       sysclk = g_core_clock;
        LDR.W    R6,??DataTable10_3
        LDR      R6,[R6, #+0]
//   87       SIM->SCGC4 |= SIM_SCGC4_UART1_MASK;
        LDR.W    R12,??DataTable10_4  ;; 0x40048034
        LDR      R12,[R12, #+0]
        ORRS     R12,R12,#0x800
        LDR.W    LR,??DataTable10_4  ;; 0x40048034
        STR      R12,[LR, #+0]
//   88       
//   89       if(tx_pin == PTE0)   
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+124
        BNE.N    ??LPLD_UART_Init_9
//   90         PORTE->PCR[0] = PORT_PCR_MUX(3); 
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_12  ;; 0x4004d000
        STR      R7,[R12, #+0]
        B.N      ??LPLD_UART_Init_10
//   91       else
//   92         PORTC->PCR[4] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_9:
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_13  ;; 0x4004b010
        STR      R7,[R12, #+0]
//   93       
//   94       if(rx_pin == PTE1)
??LPLD_UART_Init_10:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+125
        BNE.N    ??LPLD_UART_Init_11
//   95         PORTE->PCR[1] = PORT_PCR_MUX(3); 
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_14  ;; 0x4004d004
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//   96       else
//   97         PORTC->PCR[3] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_11:
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_15  ;; 0x4004b00c
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//   98     }
//   99     else
//  100     {
//  101       sysclk = g_bus_clock;
??LPLD_UART_Init_8:
        LDR.W    R5,??DataTable10_16
        LDR      R6,[R5, #+0]
//  102       if (uartx == UART2)
        LDR.W    R5,??DataTable10_17  ;; 0x4006c000
        CMP      R2,R5
        BNE.N    ??LPLD_UART_Init_12
//  103       {
//  104         x = 2;
        MOVS     R5,#+2
//  105         SIM->SCGC4 |= SIM_SCGC4_UART2_MASK;
        LDR.W    R1,??DataTable10_4  ;; 0x40048034
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x1000
        LDR.W    R7,??DataTable10_4  ;; 0x40048034
        STR      R1,[R7, #+0]
//  106         
//  107         PORTD->PCR[3] = PORT_PCR_MUX(3); 
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_18  ;; 0x4004c00c
        STR      R1,[R7, #+0]
//  108         PORTD->PCR[2] = PORT_PCR_MUX(3);
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_19  ;; 0x4004c008
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//  109       }
//  110       else
//  111       {
//  112         if(uartx == UART3)
??LPLD_UART_Init_12:
        LDR.W    R5,??DataTable10_20  ;; 0x4006d000
        CMP      R2,R5
        BNE.N    ??LPLD_UART_Init_13
//  113         {
//  114           x = 3;
        MOVS     R5,#+3
//  115           SIM->SCGC4 |= SIM_SCGC4_UART3_MASK;
        LDR.W    R12,??DataTable10_4  ;; 0x40048034
        LDR      R12,[R12, #+0]
        ORRS     R12,R12,#0x2000
        LDR.W    LR,??DataTable10_4  ;; 0x40048034
        STR      R12,[LR, #+0]
//  116           
//  117           if(tx_pin == PTE4)
        MOV      R12,R7
        UXTB     R12,R12          ;; ZeroExt  R12,R12,#+24,#+24
        CMP      R12,#+128
        BNE.N    ??LPLD_UART_Init_14
//  118             PORTE->PCR[4] = PORT_PCR_MUX(3); 
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_21  ;; 0x4004d010
        STR      R7,[R12, #+0]
        B.N      ??LPLD_UART_Init_15
//  119           else if(tx_pin == PTB11)
??LPLD_UART_Init_14:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+43
        BNE.N    ??LPLD_UART_Init_16
//  120             PORTB->PCR[11] = PORT_PCR_MUX(3); 
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_22  ;; 0x4004a02c
        STR      R7,[R12, #+0]
        B.N      ??LPLD_UART_Init_15
//  121           else 
//  122             PORTC->PCR[17] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_16:
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_23  ;; 0x4004b044
        STR      R7,[R12, #+0]
//  123           
//  124           if(rx_pin == PTE5)
??LPLD_UART_Init_15:
        MOVS     R7,R1
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+129
        BNE.N    ??LPLD_UART_Init_17
//  125             PORTE->PCR[5] = PORT_PCR_MUX(3); 
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_24  ;; 0x4004d014
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//  126           else if(rx_pin == PTB10)
??LPLD_UART_Init_17:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+42
        BNE.N    ??LPLD_UART_Init_18
//  127             PORTB->PCR[10] = PORT_PCR_MUX(3); 
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_25  ;; 0x4004a028
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//  128           else
//  129             PORTC->PCR[16] = PORT_PCR_MUX(3);
??LPLD_UART_Init_18:
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_26  ;; 0x4004b040
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//  130         }
//  131         else
//  132         {
//  133           if(uartx == UART4)
??LPLD_UART_Init_13:
        LDR.W    R5,??DataTable10_27  ;; 0x400ea000
        CMP      R2,R5
        BNE.N    ??LPLD_UART_Init_19
//  134           {
//  135             x = 4;
        MOVS     R5,#+4
//  136             SIM->SCGC1 |= SIM_SCGC1_UART4_MASK;
        LDR.W    R12,??DataTable10_28  ;; 0x40048028
        LDR      R12,[R12, #+0]
        ORRS     R12,R12,#0x400
        LDR.W    LR,??DataTable10_28  ;; 0x40048028
        STR      R12,[LR, #+0]
//  137             
//  138             if(tx_pin == PTE24)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+148
        BNE.N    ??LPLD_UART_Init_20
//  139               PORTE->PCR[24] = PORT_PCR_MUX(3); 
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_29  ;; 0x4004d060
        STR      R7,[R12, #+0]
        B.N      ??LPLD_UART_Init_21
//  140             else
//  141               PORTC->PCR[15] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_20:
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_30  ;; 0x4004b03c
        STR      R7,[R12, #+0]
//  142             
//  143             if(rx_pin == PTE25)
??LPLD_UART_Init_21:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+149
        BNE.N    ??LPLD_UART_Init_22
//  144               PORTE->PCR[25] = PORT_PCR_MUX(3); 
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_31  ;; 0x4004d064
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//  145             else
//  146               PORTC->PCR[14] = PORT_PCR_MUX(3);
??LPLD_UART_Init_22:
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_32  ;; 0x4004b038
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//  147           }
//  148           else
//  149           {
//  150             x = 5;
??LPLD_UART_Init_19:
        MOVS     R5,#+5
//  151             uartx = UART5;
        LDR.W    R2,??DataTable10_33  ;; 0x400eb000
//  152             SIM->SCGC1 |= SIM_SCGC1_UART5_MASK;
        LDR.W    R12,??DataTable10_28  ;; 0x40048028
        LDR      R12,[R12, #+0]
        ORRS     R12,R12,#0x800
        LDR.W    LR,??DataTable10_28  ;; 0x40048028
        STR      R12,[LR, #+0]
//  153             
//  154             if(tx_pin == PTD9)
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+101
        BNE.N    ??LPLD_UART_Init_23
//  155               PORTD->PCR[9] = PORT_PCR_MUX(3); 
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_34  ;; 0x4004c024
        STR      R7,[R12, #+0]
        B.N      ??LPLD_UART_Init_24
//  156             else
//  157               PORTE->PCR[8] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_23:
        MOV      R7,#+768
        LDR.W    R12,??DataTable10_35  ;; 0x4004d020
        STR      R7,[R12, #+0]
//  158             
//  159             if(rx_pin == PTD8)
??LPLD_UART_Init_24:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+100
        BNE.N    ??LPLD_UART_Init_25
//  160               PORTD->PCR[8] = PORT_PCR_MUX(3); 
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_36  ;; 0x4004c020
        STR      R1,[R7, #+0]
        B.N      ??LPLD_UART_Init_6
//  161             else
//  162               PORTE->PCR[9] = PORT_PCR_MUX(3); 
??LPLD_UART_Init_25:
        MOV      R1,#+768
        LDR.W    R7,??DataTable10_37  ;; 0x4004d024
        STR      R1,[R7, #+0]
//  163           }
//  164         }
//  165       }
//  166     }
//  167   }
//  168   
//  169   //@@@@@@@@@@@@@@@@@@@@@
//  170   uartx->C2 &= ~(UART_C2_TE_MASK | UART_C2_RE_MASK );
??LPLD_UART_Init_6:
        LDRB     R1,[R2, #+3]
        ANDS     R1,R1,#0xF3
        STRB     R1,[R2, #+3]
//  171   
//  172   //@@UART@ 8@, @@@@@ */
//  173   uartx->C1 = 0;	
        MOVS     R1,#+0
        STRB     R1,[R2, #+2]
//  174   
//  175   //@@@@@
//  176   sbr = (uint16)((sysclk)/(baud * 16));
        LSLS     R1,R0,#+4
        UDIV     R7,R6,R1
//  177   
//  178   //@@UARTx_BDH@@@@@@SBR@@
//  179   temp = uartx->BDH & ~(UART_BDH_SBR(0x1F));
        LDRB     R12,[R2, #+0]
        ANDS     R12,R12,#0xE0
//  180   
//  181   uartx->BDH = temp |  UART_BDH_SBR(((sbr & 0x1F00) >> 8));
        UBFX     R1,R7,#+8,#+5
        ORRS     R12,R1,R12
        STRB     R12,[R2, #+0]
//  182   uartx->BDL = (uint8)(sbr & UART_BDL_SBR_MASK);
        STRB     R7,[R2, #+1]
//  183   
//  184   //@@@@@@@@@@
//  185   brfa = (((sysclk*32)/(baud * 16)) - (sbr * 32));
        LSLS     R1,R6,#+5
        LSLS     R0,R0,#+4
        UDIV     R0,R1,R0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R0,R7, LSL #+5
//  186   
//  187   //@@UARTx_C4@@@@@@BRFA@@
//  188   temp = uartx->C4 & ~(UART_C4_BRFA(0x1F));
        LDRB     R1,[R2, #+10]
        ANDS     R1,R1,#0xE0
//  189   
//  190   uartx->C4 = temp |  UART_C4_BRFA(brfa);    
        ANDS     R0,R0,#0x1F
        ORRS     R0,R0,R1
        STRB     R0,[R2, #+10]
//  191   
//  192   //@@UART@@DMA@@
//  193   if( uart_init_structure.UART_RxDMAEnable == TRUE 
//  194     && uart_init_structure.UART_RxIntEnable == TRUE )
        LDRB     R0,[SP, #+33]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_26
        LDRB     R0,[SP, #+30]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_26
//  195   {
//  196     //@@@@@@@@DMA
//  197     uartx->C2 |= UART_C2_RIE_MASK;
        LDRB     R0,[R2, #+3]
        ORRS     R0,R0,#0x20
        STRB     R0,[R2, #+3]
//  198     //@@@@DMA
//  199     uartx->C5 |= UART_C5_RDMAS_MASK;
        LDRB     R0,[R2, #+11]
        ORRS     R0,R0,#0x20
        STRB     R0,[R2, #+11]
        B.N      ??LPLD_UART_Init_27
//  200   }//@@UART@@@@@@
//  201   else if(uart_init_structure.UART_RxIntEnable == TRUE 
//  202         && rx_isr != NULL)
??LPLD_UART_Init_26:
        LDRB     R0,[SP, #+30]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_28
        MOVS     R0,R3
        CMP      R0,#+0
        BEQ.N    ??LPLD_UART_Init_28
//  203   {
//  204     //@@@@@@
//  205     uartx->C2 |= UART_C2_RIE_MASK; 
        LDRB     R0,[R2, #+3]
        ORRS     R0,R0,#0x20
        STRB     R0,[R2, #+3]
//  206     UART_R_ISR[x] = rx_isr;
        LDR.W    R0,??DataTable10_38
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STR      R3,[R0, R1, LSL #+2]
        B.N      ??LPLD_UART_Init_27
//  207   } 
//  208   else
//  209   {
//  210     uartx->C2 &= ~(UART_C2_RIE_MASK); 
??LPLD_UART_Init_28:
        LDRB     R0,[R2, #+3]
        ANDS     R0,R0,#0xDF
        STRB     R0,[R2, #+3]
//  211     uartx->C5 &= ~(UART_C5_RDMAS_MASK);
        LDRB     R0,[R2, #+11]
        ANDS     R0,R0,#0xDF
        STRB     R0,[R2, #+11]
//  212   }
//  213   
//  214   //@@UART@@DMA@@
//  215   if( uart_init_structure.UART_TxDMAEnable == TRUE 
//  216     && uart_init_structure.UART_TxIntEnable == TRUE )
??LPLD_UART_Init_27:
        LDRB     R0,[SP, #+32]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_29
        LDRB     R0,[SP, #+31]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_29
//  217   {
//  218     //@@@@@@@@DMA
//  219     uartx->C2 |= UART_C2_TIE_MASK;
        LDRB     R0,[R2, #+3]
        ORRS     R0,R0,#0x80
        STRB     R0,[R2, #+3]
//  220     //@@@@DMA
//  221     uartx->C5 |= UART_C5_TDMAS_MASK;
        LDRB     R0,[R2, #+11]
        ORRS     R0,R0,#0x80
        STRB     R0,[R2, #+11]
        B.N      ??LPLD_UART_Init_30
//  222   }//@@UART@@@@@@
//  223   else if(uart_init_structure.UART_TxIntEnable == TRUE 
//  224         && tx_isr != NULL)
??LPLD_UART_Init_29:
        LDRB     R0,[SP, #+31]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_31
        MOVS     R0,R4
        CMP      R0,#+0
        BEQ.N    ??LPLD_UART_Init_31
//  225   {
//  226     //@@@@@@
//  227     uartx->C2 |= UART_C2_TIE_MASK; 
        LDRB     R0,[R2, #+3]
        ORRS     R0,R0,#0x80
        STRB     R0,[R2, #+3]
//  228     UART_T_ISR[x] = tx_isr;
        LDR.W    R0,??DataTable10_39
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STR      R4,[R0, R5, LSL #+2]
        B.N      ??LPLD_UART_Init_30
//  229   } 
//  230   else
//  231   {
//  232     uartx->C2 &= ~(UART_C2_TIE_MASK);
??LPLD_UART_Init_31:
        LDRB     R0,[R2, #+3]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R2, #+3]
//  233     uartx->C5 &= ~(UART_C5_TDMAS_MASK);
        LDRB     R0,[R2, #+11]
        ANDS     R0,R0,#0x7F
        STRB     R0,[R2, #+11]
//  234   }
//  235   
//  236   //@@UART FIFO @@
//  237   if( (uartx->C2 & UART_C2_RE_MASK) == 0 
//  238      && uart_init_structure.RxFIFO.FIFO_Enable == TRUE)
??LPLD_UART_Init_30:
        LDRB     R0,[R2, #+3]
        LSLS     R0,R0,#+29
        BMI.N    ??LPLD_UART_Init_32
        LDRB     R0,[SP, #+37]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_32
//  239   {
//  240     //@@ UART @@FIFO
//  241     uartx->PFIFO |= UART_PFIFO_RXFE_MASK;
        LDRB     R0,[R2, #+16]
        ORRS     R0,R0,#0x8
        STRB     R0,[R2, #+16]
//  242     
//  243     if(uart_init_structure.RxFIFO.FIFO_BufFlow_IntEnable == TRUE)
        LDRB     R0,[SP, #+38]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_33
//  244     {
//  245       uartx->CFIFO |= UART_CFIFO_RXUFE_MASK;
        LDRB     R0,[R2, #+17]
        ORRS     R0,R0,#0x1
        STRB     R0,[R2, #+17]
//  246     }
//  247     
//  248     //@@ FIFO buffer @@
//  249     len = (uint8)( uartx->PFIFO & UART_PFIFO_RXFIFOSIZE_MASK ) >> UART_PFIFO_RXFIFOSIZE_SHIFT;
??LPLD_UART_Init_33:
        LDRB     R1,[R2, #+16]
        ANDS     R1,R1,#0x7
//  250     len = len > 0 ? 1 << (len + 1) : 1;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??LPLD_UART_Init_34
        MOVS     R0,#+1
        ADDS     R1,R1,#+1
        LSLS     R1,R0,R1
        B.N      ??LPLD_UART_Init_35
??LPLD_UART_Init_34:
        MOVS     R1,#+1
//  251     //@@Rx FIFO buffer@@DataWords @@@@ UART_FIFOWaterMark
//  252     //@@@@@@@DMA@@@@@C2_RIE@C5_RDMAS@@@
//  253     if( uart_init_structure.RxFIFO.FIFO_WaterMark > len )
??LPLD_UART_Init_35:
        MOVS     R0,R1
        LDRB     R3,[SP, #+39]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R3
        BCS.N    ??LPLD_UART_Init_36
//  254     {
//  255       uartx->RWFIFO = UART_RWFIFO_RXWATER(len);
        STRB     R1,[R2, #+21]
        B.N      ??LPLD_UART_Init_32
//  256     }
//  257     else
//  258     {
//  259       uartx->RWFIFO = UART_RWFIFO_RXWATER(uart_init_structure.RxFIFO.FIFO_WaterMark);
??LPLD_UART_Init_36:
        LDRB     R0,[SP, #+39]
        STRB     R0,[R2, #+21]
//  260     }  
//  261   }
//  262   
//  263   if( (uartx->C2 & UART_C2_TE_MASK) == 0 
//  264      && uart_init_structure.TxFIFO.FIFO_Enable == TRUE)
??LPLD_UART_Init_32:
        LDRB     R0,[R2, #+3]
        LSLS     R0,R0,#+28
        BMI.N    ??LPLD_UART_Init_37
        LDRB     R0,[SP, #+34]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_37
//  265   {
//  266     //@@ UART @@FIFO
//  267     uartx->PFIFO |= UART_PFIFO_TXFE_MASK;
        LDRB     R0,[R2, #+16]
        ORRS     R0,R0,#0x80
        STRB     R0,[R2, #+16]
//  268     
//  269     if(uart_init_structure.TxFIFO.FIFO_BufFlow_IntEnable == TRUE)
        LDRB     R0,[SP, #+35]
        CMP      R0,#+1
        BNE.N    ??LPLD_UART_Init_38
//  270     {
//  271       uartx->CFIFO |= UART_CFIFO_TXOFE_MASK;
        LDRB     R0,[R2, #+17]
        ORRS     R0,R0,#0x2
        STRB     R0,[R2, #+17]
//  272     }
//  273     
//  274     //@@ FIFO buffer @@
//  275     len = (uint8)( uartx->PFIFO & UART_PFIFO_TXFIFOSIZE_MASK ) >> UART_PFIFO_TXFIFOSIZE_SHIFT;
??LPLD_UART_Init_38:
        LDRB     R0,[R2, #+16]
        UBFX     R1,R0,#+4,#+3
//  276     len = len > 0 ? 1 << (len + 1) : 1;
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??LPLD_UART_Init_39
        MOVS     R0,#+1
        ADDS     R1,R1,#+1
        LSLS     R1,R0,R1
        B.N      ??LPLD_UART_Init_40
??LPLD_UART_Init_39:
        MOVS     R1,#+1
//  277     //@@Tx FIFO buffer@@DataWords @@@@ UART_FIFOWaterMark
//  278     //@@@@@@@DMA@@@@@C2_TIE@C5_TDMAS@@@
//  279     if( uart_init_structure.TxFIFO.FIFO_WaterMark > len )
??LPLD_UART_Init_40:
        MOVS     R0,R1
        LDRB     R3,[SP, #+36]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,R3
        BCS.N    ??LPLD_UART_Init_41
//  280     {
//  281       uartx->TWFIFO = UART_TWFIFO_TXWATER(len);
        STRB     R1,[R2, #+19]
        B.N      ??LPLD_UART_Init_37
//  282     }
//  283     else
//  284     {
//  285       uartx->TWFIFO = UART_TWFIFO_TXWATER(uart_init_structure.TxFIFO.FIFO_WaterMark);
??LPLD_UART_Init_41:
        LDRB     R0,[SP, #+36]
        STRB     R0,[R2, #+19]
//  286     }
//  287   }
//  288   //@@ UART @@@
//  289   uartx->C2 |= UART_C2_TE_MASK | UART_C2_RE_MASK;  
??LPLD_UART_Init_37:
        LDRB     R0,[R2, #+3]
        ORRS     R0,R0,#0xC
        STRB     R0,[R2, #+3]
//  290 }
        POP      {R4-R7}
        LDR      PC,[SP], #+20    ;; return
//  291 
//  292 
//  293 /*
//  294  * LPLD_UART_RxFIFO_Flush
//  295  * @@UART Rx FIFO
//  296  * 
//  297  * @@:
//  298  *    uartx--UART@@@
//  299  *      |__UART0          --UART0
//  300  *      |__UART1          --UART1
//  301  *      |__UART2          --UART2
//  302  *      |__UART3          --UART3
//  303  *      |__UART4          --UART4
//  304  *      |__UART5          --UART5
//  305  *
//  306  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  307 void LPLD_UART_RxFIFO_Flush(UART_Type *uartx)
//  308 {
//  309   //@@@@ FIFO
//  310   if( uartx->PFIFO & UART_PFIFO_RXFE_MASK )
LPLD_UART_RxFIFO_Flush:
        LDRB     R1,[R0, #+16]
        LSLS     R1,R1,#+28
        BPL.N    ??LPLD_UART_RxFIFO_Flush_0
//  311   {
//  312     uartx->CFIFO |= UART_CFIFO_RXFLUSH_MASK;
        LDRB     R1,[R0, #+17]
        ORRS     R1,R1,#0x40
        STRB     R1,[R0, #+17]
//  313   }
//  314 }
??LPLD_UART_RxFIFO_Flush_0:
        BX       LR               ;; return
//  315 
//  316 /*
//  317  * LPLD_UART_TxFIFO_Flush
//  318  * @@UART Tx FIFO
//  319  * 
//  320  * @@:
//  321  *    uartx--UART@@@
//  322  *      |__UART0          --UART0
//  323  *      |__UART1          --UART1
//  324  *      |__UART2          --UART2
//  325  *      |__UART3          --UART3
//  326  *      |__UART4          --UART4
//  327  *      |__UART5          --UART5
//  328  *
//  329  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  330 void LPLD_UART_TxFIFO_Flush(UART_Type *uartx)
//  331 {
//  332   //@@@@ FIFO
//  333   if( uartx->PFIFO & UART_PFIFO_TXFE_MASK )
LPLD_UART_TxFIFO_Flush:
        LDRB     R1,[R0, #+16]
        LSLS     R1,R1,#+24
        BPL.N    ??LPLD_UART_TxFIFO_Flush_0
//  334   {
//  335     uartx->CFIFO |= UART_CFIFO_TXFLUSH_MASK;
        LDRB     R1,[R0, #+17]
        ORRS     R1,R1,#0x80
        STRB     R1,[R0, #+17]
//  336   }
//  337 }
??LPLD_UART_TxFIFO_Flush_0:
        BX       LR               ;; return
//  338 
//  339 /*
//  340  * LPLD_UART_GetChar
//  341  * @@@@@@@@@@@@
//  342  * 
//  343  * @@:
//  344  *    uartx--UART@@@
//  345  *      |__UART0          --UART0
//  346  *      |__UART1          --UART1
//  347  *      |__UART2          --UART2
//  348  *      |__UART3          --UART3
//  349  *      |__UART4          --UART4
//  350  *      |__UART5          --UART5
//  351  *
//  352  * @@:
//  353  *    @@@@@1@@@
//  354  *
//  355  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  356 int8 LPLD_UART_GetChar(UART_Type *uartx)
//  357 {
//  358   //@@@@@@
//  359   while (!(uartx->S1 & UART_S1_RDRF_MASK));
LPLD_UART_GetChar:
??LPLD_UART_GetChar_0:
        LDRB     R1,[R0, #+4]
        LSLS     R1,R1,#+26
        BPL.N    ??LPLD_UART_GetChar_0
//  360   
//  361   //@@@@@1@@@@@
//  362   return uartx->D;
        LDRSB    R0,[R0, #+7]
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        BX       LR               ;; return
//  363 }
//  364 
//  365 /********************************************************************/
//  366 /*
//  367  * LPLD_UART_GetChar_Present
//  368  * @@@@@@@@@
//  369  * 
//  370  * @@:
//  371  *    uartx--UART@@@
//  372  *      |__UART0          --UART0
//  373  *      |__UART1          --UART1
//  374  *      |__UART2          --UART2
//  375  *      |__UART3          --UART3
//  376  *      |__UART4          --UART4
//  377  *      |__UART5          --UART5
//  378  *
//  379  * @@:
//  380  *  0       @@@@@@@
//  381  *  1       @@@@@@@
//  382  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  383 int32 LPLD_UART_GetChar_Present(UART_Type *uartx)
//  384 {
//  385     return (uartx->S1 & UART_S1_RDRF_MASK);
LPLD_UART_GetChar_Present:
        LDRB     R0,[R0, #+4]
        ANDS     R0,R0,#0x20
        BX       LR               ;; return
//  386 }
//  387 
//  388 /*
//  389  * LPLD_UART_PutChar
//  390  * @@@@@@@@@@@@
//  391  * 
//  392  * @@:
//  393  *    uartx--UART@@@
//  394  *      |__UART0          --UART0
//  395  *      |__UART1          --UART1
//  396  *      |__UART2          --UART2
//  397  *      |__UART3          --UART3
//  398  *      |__UART4          --UART4
//  399  *      |__UART5          --UART5
//  400  *    ch--@@@@1@@@
//  401  *
//  402  * @@:
//  403  *    @
//  404  *
//  405  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  406 void LPLD_UART_PutChar(UART_Type *uartx, int8 ch)
//  407 {
//  408   //@@FIFO@@@@
//  409   while(!(uartx->S1 & UART_S1_TDRE_MASK));
LPLD_UART_PutChar:
??LPLD_UART_PutChar_0:
        LDRB     R2,[R0, #+4]
        LSLS     R2,R2,#+24
        BPL.N    ??LPLD_UART_PutChar_0
//  410   
//  411   //@@@@@1@@@@@UART@@@@@
//  412   uartx->D = (uint8)ch;
        STRB     R1,[R0, #+7]
//  413 }
        BX       LR               ;; return
//  414 
//  415 
//  416 /*
//  417  * LPLD_UART_PutCharArr
//  418  * @@@@@@@@@@@@@
//  419  * 
//  420  * @@:
//  421  *    uartx--UART@@@
//  422  *      |__UART0          --UART0
//  423  *      |__UART1          --UART1
//  424  *      |__UART2          --UART2
//  425  *      |__UART3          --UART3
//  426  *      |__UART4          --UART4
//  427  *      |__UART5          --UART5
//  428  *    *ch--@@@@@@@@@@@
//  429  *    len--@@@@@@
//  430  *
//  431  * @@:
//  432  *    @
//  433  *
//  434  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  435 void LPLD_UART_PutCharArr(UART_Type *uartx, int8 *ch, int32 len)
//  436 {
LPLD_UART_PutCharArr:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        B.N      ??LPLD_UART_PutCharArr_0
//  437   while(len--)
//  438   {
//  439     LPLD_UART_PutChar(uartx, *(ch++));
??LPLD_UART_PutCharArr_1:
        LDRSB    R1,[R5, #+0]
        MOVS     R0,R4
        BL       LPLD_UART_PutChar
        ADDS     R5,R5,#+1
//  440   }
??LPLD_UART_PutCharArr_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BNE.N    ??LPLD_UART_PutCharArr_1
//  441 }
        POP      {R4-R6,PC}       ;; return
//  442 
//  443 /*
//  444  * LPLD_UART_EnableIrq
//  445  * @@@@@@@@@@
//  446  * 
//  447  * @@:
//  448  *    uart_init_structure--UART@@@@@@@
//  449  *                        @@@@@UART_InitTypeDef
//  450  *
//  451  * @@:
//  452  *    @
//  453  *
//  454  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  455 void LPLD_UART_EnableIrq(UART_InitTypeDef uart_init_structure)
//  456 {
LPLD_UART_EnableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  457   if(uart_init_structure.UART_Uartx == UART0)
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_2  ;; 0x4006a000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_EnableIrq_0
//  458   {
//  459     enable_irq(UART0_RX_TX_IRQn);
        MOVS     R0,#+45
        BL       __NVIC_EnableIRQ
//  460     enable_irq(UART0_ERR_IRQn);
        MOVS     R0,#+46
        BL       __NVIC_EnableIRQ
        B.N      ??LPLD_UART_EnableIrq_1
//  461   }
//  462   else if(uart_init_structure.UART_Uartx == UART1)
??LPLD_UART_EnableIrq_0:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_11  ;; 0x4006b000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_EnableIrq_2
//  463   {
//  464     enable_irq(UART1_RX_TX_IRQn);
        MOVS     R0,#+47
        BL       __NVIC_EnableIRQ
//  465     enable_irq(UART1_ERR_IRQn);
        MOVS     R0,#+48
        BL       __NVIC_EnableIRQ
        B.N      ??LPLD_UART_EnableIrq_1
//  466   }
//  467   else if(uart_init_structure.UART_Uartx == UART2)
??LPLD_UART_EnableIrq_2:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_17  ;; 0x4006c000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_EnableIrq_3
//  468   {
//  469     enable_irq(UART2_RX_TX_IRQn);
        MOVS     R0,#+49
        BL       __NVIC_EnableIRQ
//  470     enable_irq(UART2_ERR_IRQn);
        MOVS     R0,#+50
        BL       __NVIC_EnableIRQ
        B.N      ??LPLD_UART_EnableIrq_1
//  471   }
//  472   else if(uart_init_structure.UART_Uartx == UART3)
??LPLD_UART_EnableIrq_3:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_20  ;; 0x4006d000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_EnableIrq_4
//  473   {
//  474     enable_irq(UART3_RX_TX_IRQn);
        MOVS     R0,#+51
        BL       __NVIC_EnableIRQ
//  475     enable_irq(UART3_ERR_IRQn);
        MOVS     R0,#+52
        BL       __NVIC_EnableIRQ
        B.N      ??LPLD_UART_EnableIrq_1
//  476   }
//  477   else if(uart_init_structure.UART_Uartx == UART4)
??LPLD_UART_EnableIrq_4:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_27  ;; 0x400ea000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_EnableIrq_5
//  478   {
//  479     enable_irq(UART4_RX_TX_IRQn);
        MOVS     R0,#+53
        BL       __NVIC_EnableIRQ
//  480     enable_irq(UART4_ERR_IRQn);
        MOVS     R0,#+54
        BL       __NVIC_EnableIRQ
        B.N      ??LPLD_UART_EnableIrq_1
//  481   }
//  482   else if(uart_init_structure.UART_Uartx == UART5)
??LPLD_UART_EnableIrq_5:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_33  ;; 0x400eb000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_EnableIrq_1
//  483   {
//  484     enable_irq(UART5_RX_TX_IRQn);
        MOVS     R0,#+55
        BL       __NVIC_EnableIRQ
//  485     enable_irq(UART5_ERR_IRQn);
        MOVS     R0,#+56
        BL       __NVIC_EnableIRQ
//  486   }
//  487 }
??LPLD_UART_EnableIrq_1:
        POP      {R0}
        LDR      PC,[SP], #+20    ;; return
//  488 
//  489 /*
//  490  * LPLD_UART_DisableIrq
//  491  * @@@@@@@@@@
//  492  * 
//  493  * @@:
//  494  *    uart_init_structure--UART@@@@@@@
//  495  *                        @@@@@UART_InitTypeDef
//  496  *
//  497  * @@:
//  498  *    @
//  499  *
//  500  */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  501 void LPLD_UART_DisableIrq(UART_InitTypeDef uart_init_structure)
//  502 {
LPLD_UART_DisableIrq:
        PUSH     {R0-R3}
        PUSH     {R7,LR}
//  503   //@@@@@@@@@@@@@
//  504   if(uart_init_structure.UART_Uartx == UART0)
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_2  ;; 0x4006a000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_DisableIrq_0
//  505   {
//  506     disable_irq(UART0_RX_TX_IRQn);
        MOVS     R0,#+45
        BL       __NVIC_DisableIRQ
//  507     disable_irq(UART0_ERR_IRQn);
        MOVS     R0,#+46
        BL       __NVIC_DisableIRQ
        B.N      ??LPLD_UART_DisableIrq_1
//  508   }
//  509   else if(uart_init_structure.UART_Uartx == UART1)
??LPLD_UART_DisableIrq_0:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_11  ;; 0x4006b000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_DisableIrq_2
//  510   {
//  511     disable_irq(UART1_RX_TX_IRQn);
        MOVS     R0,#+47
        BL       __NVIC_DisableIRQ
//  512     disable_irq(UART1_ERR_IRQn);
        MOVS     R0,#+48
        BL       __NVIC_DisableIRQ
        B.N      ??LPLD_UART_DisableIrq_1
//  513   }
//  514   else if(uart_init_structure.UART_Uartx == UART2)
??LPLD_UART_DisableIrq_2:
        LDR      R0,[SP, #+8]
        LDR.W    R1,??DataTable10_17  ;; 0x4006c000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_DisableIrq_3
//  515   {
//  516     disable_irq(UART2_RX_TX_IRQn);
        MOVS     R0,#+49
        BL       __NVIC_DisableIRQ
//  517     disable_irq(UART2_ERR_IRQn);
        MOVS     R0,#+50
        BL       __NVIC_DisableIRQ
        B.N      ??LPLD_UART_DisableIrq_1
//  518   }
//  519   else if(uart_init_structure.UART_Uartx == UART3)
??LPLD_UART_DisableIrq_3:
        LDR      R0,[SP, #+8]
        LDR.N    R1,??DataTable10_20  ;; 0x4006d000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_DisableIrq_4
//  520   {
//  521     disable_irq(UART3_RX_TX_IRQn);
        MOVS     R0,#+51
        BL       __NVIC_DisableIRQ
//  522     disable_irq(UART3_ERR_IRQn);
        MOVS     R0,#+52
        BL       __NVIC_DisableIRQ
        B.N      ??LPLD_UART_DisableIrq_1
//  523   }
//  524   else if(uart_init_structure.UART_Uartx == UART4)
??LPLD_UART_DisableIrq_4:
        LDR      R0,[SP, #+8]
        LDR.N    R1,??DataTable10_27  ;; 0x400ea000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_DisableIrq_5
//  525   {
//  526     disable_irq(UART4_RX_TX_IRQn);
        MOVS     R0,#+53
        BL       __NVIC_DisableIRQ
//  527     disable_irq(UART4_ERR_IRQn);
        MOVS     R0,#+54
        BL       __NVIC_DisableIRQ
        B.N      ??LPLD_UART_DisableIrq_1
//  528   }
//  529   else if(uart_init_structure.UART_Uartx == UART5)
??LPLD_UART_DisableIrq_5:
        LDR      R0,[SP, #+8]
        LDR.N    R1,??DataTable10_33  ;; 0x400eb000
        CMP      R0,R1
        BNE.N    ??LPLD_UART_DisableIrq_1
//  530   {
//  531     disable_irq(UART5_RX_TX_IRQn);
        MOVS     R0,#+55
        BL       __NVIC_DisableIRQ
//  532     disable_irq(UART5_ERR_IRQn);
        MOVS     R0,#+56
        BL       __NVIC_DisableIRQ
//  533   }
//  534 }
??LPLD_UART_DisableIrq_1:
        POP      {R0}
        LDR      PC,[SP], #+20    ;; return
//  535 
//  536 //HW@@@@@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  537 void UART0_IRQHandler(void)
//  538 {
UART0_IRQHandler:
        PUSH     {R7,LR}
//  539 #if (UCOS_II > 0u)
//  540   OS_CPU_SR  cpu_sr = 0u;
//  541   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  542   OSIntEnter();
//  543   OS_EXIT_CRITICAL();
//  544 #endif
//  545   //@@Rx FIFO@@ Under flow
//  546   if( UART0->SFIFO & UART_SFIFO_RXUF_MASK)
        LDR.N    R0,??DataTable10_40  ;; 0x4006a012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??UART0_IRQHandler_0
//  547   {
//  548     UART0->SFIFO |= UART_SFIFO_RXUF_MASK;
        LDR.N    R0,??DataTable10_40  ;; 0x4006a012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_40  ;; 0x4006a012
        STRB     R0,[R1, #+0]
//  549   }
//  550   //@@Tx FIFO@@ Over flow
//  551   if( UART0->SFIFO & UART_SFIFO_TXOF_MASK)
??UART0_IRQHandler_0:
        LDR.N    R0,??DataTable10_40  ;; 0x4006a012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??UART0_IRQHandler_1
//  552   {
//  553     UART0->SFIFO |= UART_SFIFO_TXOF_MASK;
        LDR.N    R0,??DataTable10_40  ;; 0x4006a012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_40  ;; 0x4006a012
        STRB     R0,[R1, #+0]
//  554   }
//  555   //@@@@@@@@
//  556   if((UART0->S1 & UART_S1_RDRF_MASK) && (UART0->C2 & UART_C2_RIE_MASK))
??UART0_IRQHandler_1:
        LDR.N    R0,??DataTable10_41  ;; 0x4006a004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART0_IRQHandler_2
        LDR.N    R0,??DataTable10_42  ;; 0x4006a003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART0_IRQHandler_2
//  557   {
//  558     UART_R_ISR[0]();
        LDR.N    R0,??DataTable10_38
        LDR      R0,[R0, #+0]
        BLX      R0
//  559   }
//  560   //@@@@@@@@
//  561   if((UART0->S1 & UART_S1_TDRE_MASK) && (UART0->C2 & UART_C2_TIE_MASK))
??UART0_IRQHandler_2:
        LDR.N    R0,??DataTable10_41  ;; 0x4006a004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART0_IRQHandler_3
        LDR.N    R0,??DataTable10_42  ;; 0x4006a003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART0_IRQHandler_3
//  562   {
//  563     UART_T_ISR[0]();
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+0]
        BLX      R0
//  564   }
//  565   
//  566 #if (UCOS_II > 0u)
//  567   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  568 #endif
//  569 }
??UART0_IRQHandler_3:
        POP      {R0,PC}          ;; return
//  570 
//  571 //HW@@@@@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  572 void UART1_IRQHandler(void)
//  573 {
UART1_IRQHandler:
        PUSH     {R7,LR}
//  574 #if (UCOS_II > 0u)
//  575   OS_CPU_SR  cpu_sr = 0u;
//  576   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  577   OSIntEnter();
//  578   OS_EXIT_CRITICAL();
//  579 #endif
//  580   //@@Rx FIFO@@ Under flow
//  581   if( UART1->SFIFO & UART_SFIFO_RXUF_MASK)
        LDR.N    R0,??DataTable10_43  ;; 0x4006b012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??UART1_IRQHandler_0
//  582   {
//  583     UART1->SFIFO |= UART_SFIFO_RXUF_MASK;
        LDR.N    R0,??DataTable10_43  ;; 0x4006b012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_43  ;; 0x4006b012
        STRB     R0,[R1, #+0]
//  584   }
//  585   //@@Tx FIFO@@ Over flow
//  586   if( UART1->SFIFO & UART_SFIFO_TXOF_MASK)
??UART1_IRQHandler_0:
        LDR.N    R0,??DataTable10_43  ;; 0x4006b012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??UART1_IRQHandler_1
//  587   {
//  588     UART1->SFIFO |= UART_SFIFO_TXOF_MASK;
        LDR.N    R0,??DataTable10_43  ;; 0x4006b012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_43  ;; 0x4006b012
        STRB     R0,[R1, #+0]
//  589   }  
//  590   //@@@@@@@@
//  591   if((UART1->S1 & UART_S1_RDRF_MASK) && (UART1->C2 & UART_C2_RIE_MASK))
??UART1_IRQHandler_1:
        LDR.N    R0,??DataTable10_44  ;; 0x4006b004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART1_IRQHandler_2
        LDR.N    R0,??DataTable10_45  ;; 0x4006b003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART1_IRQHandler_2
//  592   {
//  593     UART_R_ISR[1]();
        LDR.N    R0,??DataTable10_38
        LDR      R0,[R0, #+4]
        BLX      R0
//  594   }
//  595   //@@@@@@@@
//  596   if((UART1->S1 & UART_S1_TDRE_MASK) && (UART1->C2 & UART_C2_TIE_MASK))
??UART1_IRQHandler_2:
        LDR.N    R0,??DataTable10_44  ;; 0x4006b004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART1_IRQHandler_3
        LDR.N    R0,??DataTable10_45  ;; 0x4006b003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART1_IRQHandler_3
//  597   {
//  598     UART_T_ISR[1]();
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+4]
        BLX      R0
//  599   }
//  600   
//  601 #if (UCOS_II > 0u)
//  602   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  603 #endif
//  604 }
??UART1_IRQHandler_3:
        POP      {R0,PC}          ;; return
//  605 
//  606 //HW@@@@@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  607 void UART2_IRQHandler(void)
//  608 {
UART2_IRQHandler:
        PUSH     {R7,LR}
//  609 #if (UCOS_II > 0u)
//  610   OS_CPU_SR  cpu_sr = 0u;
//  611   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  612   OSIntEnter();
//  613   OS_EXIT_CRITICAL();
//  614 #endif
//  615   //@@Rx FIFO@@ Under flow
//  616   if( UART2->SFIFO & UART_SFIFO_RXUF_MASK)
        LDR.N    R0,??DataTable10_46  ;; 0x4006c012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??UART2_IRQHandler_0
//  617   {
//  618     UART2->SFIFO |= UART_SFIFO_RXUF_MASK;
        LDR.N    R0,??DataTable10_46  ;; 0x4006c012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_46  ;; 0x4006c012
        STRB     R0,[R1, #+0]
//  619   }
//  620   //@@Tx FIFO@@ Over flow
//  621   if( UART2->SFIFO & UART_SFIFO_TXOF_MASK)
??UART2_IRQHandler_0:
        LDR.N    R0,??DataTable10_46  ;; 0x4006c012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??UART2_IRQHandler_1
//  622   {
//  623     UART2->SFIFO |= UART_SFIFO_TXOF_MASK;
        LDR.N    R0,??DataTable10_46  ;; 0x4006c012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_46  ;; 0x4006c012
        STRB     R0,[R1, #+0]
//  624   }    
//  625   //@@@@@@@@
//  626   if((UART2->S1 & UART_S1_RDRF_MASK) && (UART2->C2 & UART_C2_RIE_MASK))
??UART2_IRQHandler_1:
        LDR.N    R0,??DataTable10_47  ;; 0x4006c004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART2_IRQHandler_2
        LDR.N    R0,??DataTable10_48  ;; 0x4006c003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART2_IRQHandler_2
//  627   {
//  628     UART_R_ISR[2]();
        LDR.N    R0,??DataTable10_38
        LDR      R0,[R0, #+8]
        BLX      R0
//  629   }
//  630   //@@@@@@@@
//  631   if((UART2->S1 & UART_S1_TDRE_MASK) && (UART2->C2 & UART_C2_TIE_MASK))
??UART2_IRQHandler_2:
        LDR.N    R0,??DataTable10_47  ;; 0x4006c004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART2_IRQHandler_3
        LDR.N    R0,??DataTable10_48  ;; 0x4006c003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART2_IRQHandler_3
//  632   {
//  633     UART_T_ISR[2]();
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+8]
        BLX      R0
//  634   }
//  635   
//  636 #if (UCOS_II > 0u)
//  637   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  638 #endif
//  639 }
??UART2_IRQHandler_3:
        POP      {R0,PC}          ;; return
//  640 
//  641 //HW@@@@@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  642 void UART3_IRQHandler(void)
//  643 {
UART3_IRQHandler:
        PUSH     {R7,LR}
//  644 #if (UCOS_II > 0u)
//  645   OS_CPU_SR  cpu_sr = 0u;
//  646   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  647   OSIntEnter();
//  648   OS_EXIT_CRITICAL();
//  649 #endif
//  650   //@@Rx FIFO@@ Under flow
//  651   if( UART3->SFIFO & UART_SFIFO_RXUF_MASK)
        LDR.N    R0,??DataTable10_49  ;; 0x4006d012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??UART3_IRQHandler_0
//  652   {
//  653     UART3->SFIFO |= UART_SFIFO_RXUF_MASK;
        LDR.N    R0,??DataTable10_49  ;; 0x4006d012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_49  ;; 0x4006d012
        STRB     R0,[R1, #+0]
//  654   }
//  655   //@@Tx FIFO@@ Over flow
//  656   if( UART3->SFIFO & UART_SFIFO_TXOF_MASK)
??UART3_IRQHandler_0:
        LDR.N    R0,??DataTable10_49  ;; 0x4006d012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??UART3_IRQHandler_1
//  657   {
//  658     UART3->SFIFO |= UART_SFIFO_TXOF_MASK;
        LDR.N    R0,??DataTable10_49  ;; 0x4006d012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_49  ;; 0x4006d012
        STRB     R0,[R1, #+0]
//  659   }   
//  660   //@@@@@@@@
//  661   if((UART3->S1 & UART_S1_RDRF_MASK) && (UART3->C2 & UART_C2_RIE_MASK))
??UART3_IRQHandler_1:
        LDR.N    R0,??DataTable10_50  ;; 0x4006d004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART3_IRQHandler_2
        LDR.N    R0,??DataTable10_51  ;; 0x4006d003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART3_IRQHandler_2
//  662   {
//  663     UART_R_ISR[3]();
        LDR.N    R0,??DataTable10_38
        LDR      R0,[R0, #+12]
        BLX      R0
//  664   }
//  665   //@@@@@@@@
//  666   if((UART3->S1 & UART_S1_TDRE_MASK) && (UART3->C2 & UART_C2_TIE_MASK))
??UART3_IRQHandler_2:
        LDR.N    R0,??DataTable10_50  ;; 0x4006d004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART3_IRQHandler_3
        LDR.N    R0,??DataTable10_51  ;; 0x4006d003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART3_IRQHandler_3
//  667   {
//  668     UART_T_ISR[3]();
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+12]
        BLX      R0
//  669   }
//  670   
//  671 #if (UCOS_II > 0u)
//  672   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  673 #endif
//  674 }
??UART3_IRQHandler_3:
        POP      {R0,PC}          ;; return
//  675 
//  676 //HW@@@@@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  677 void UART4_IRQHandler(void)
//  678 {
UART4_IRQHandler:
        PUSH     {R7,LR}
//  679 #if (UCOS_II > 0u)
//  680   OS_CPU_SR  cpu_sr = 0u;
//  681   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  682   OSIntEnter();
//  683   OS_EXIT_CRITICAL();
//  684 #endif
//  685   //@@Rx FIFO@@ Under flow
//  686   if( UART4->SFIFO & UART_SFIFO_RXUF_MASK)
        LDR.N    R0,??DataTable10_52  ;; 0x400ea012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??UART4_IRQHandler_0
//  687   {
//  688     UART4->SFIFO |= UART_SFIFO_RXUF_MASK;
        LDR.N    R0,??DataTable10_52  ;; 0x400ea012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_52  ;; 0x400ea012
        STRB     R0,[R1, #+0]
//  689   }
//  690   //@@Tx FIFO@@ Over flow
//  691   if( UART4->SFIFO & UART_SFIFO_TXOF_MASK)
??UART4_IRQHandler_0:
        LDR.N    R0,??DataTable10_52  ;; 0x400ea012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??UART4_IRQHandler_1
//  692   {
//  693     UART4->SFIFO |= UART_SFIFO_TXOF_MASK;
        LDR.N    R0,??DataTable10_52  ;; 0x400ea012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_52  ;; 0x400ea012
        STRB     R0,[R1, #+0]
//  694   }  
//  695   //@@@@@@@@
//  696   if((UART4->S1 & UART_S1_RDRF_MASK) && (UART4->C2 & UART_C2_RIE_MASK))
??UART4_IRQHandler_1:
        LDR.N    R0,??DataTable10_53  ;; 0x400ea004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART4_IRQHandler_2
        LDR.N    R0,??DataTable10_54  ;; 0x400ea003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART4_IRQHandler_2
//  697   {
//  698     UART_R_ISR[4]();
        LDR.N    R0,??DataTable10_38
        LDR      R0,[R0, #+16]
        BLX      R0
//  699   }
//  700   //@@@@@@@@
//  701   if((UART4->S1 & UART_S1_TDRE_MASK) && (UART4->C2 & UART_C2_TIE_MASK))
??UART4_IRQHandler_2:
        LDR.N    R0,??DataTable10_53  ;; 0x400ea004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART4_IRQHandler_3
        LDR.N    R0,??DataTable10_54  ;; 0x400ea003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART4_IRQHandler_3
//  702   {
//  703     UART_T_ISR[4]();
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+16]
        BLX      R0
//  704   }
//  705   
//  706 #if (UCOS_II > 0u)
//  707   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  708 #endif
//  709 }
??UART4_IRQHandler_3:
        POP      {R0,PC}          ;; return
//  710 
//  711 //HW@@@@@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  712 void UART5_IRQHandler(void)
//  713 {
UART5_IRQHandler:
        PUSH     {R7,LR}
//  714 #if (UCOS_II > 0u)
//  715   OS_CPU_SR  cpu_sr = 0u;
//  716   OS_ENTER_CRITICAL(); //@@@@@@@@@@@@@@@@@@
//  717   OSIntEnter();
//  718   OS_EXIT_CRITICAL();
//  719 #endif
//  720   //@@Rx FIFO@@ Under flow
//  721   if( UART5->SFIFO & UART_SFIFO_RXUF_MASK)
        LDR.N    R0,??DataTable10_55  ;; 0x400eb012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??UART5_IRQHandler_0
//  722   {
//  723     UART5->SFIFO |= UART_SFIFO_RXUF_MASK;
        LDR.N    R0,??DataTable10_55  ;; 0x400eb012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable10_55  ;; 0x400eb012
        STRB     R0,[R1, #+0]
//  724   }
//  725   //@@Tx FIFO@@ Over flow
//  726   if( UART5->SFIFO & UART_SFIFO_TXOF_MASK)
??UART5_IRQHandler_0:
        LDR.N    R0,??DataTable10_55  ;; 0x400eb012
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??UART5_IRQHandler_1
//  727   {
//  728     UART5->SFIFO |= UART_SFIFO_TXOF_MASK;
        LDR.N    R0,??DataTable10_55  ;; 0x400eb012
        LDRB     R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable10_55  ;; 0x400eb012
        STRB     R0,[R1, #+0]
//  729   }   
//  730   //@@@@@@@@
//  731   if((UART5->S1 & UART_S1_RDRF_MASK) && (UART5->C2 & UART_C2_RIE_MASK))
??UART5_IRQHandler_1:
        LDR.N    R0,??DataTable10_56  ;; 0x400eb004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART5_IRQHandler_2
        LDR.N    R0,??DataTable10_57  ;; 0x400eb003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??UART5_IRQHandler_2
//  732   {
//  733     UART_R_ISR[5]();
        LDR.N    R0,??DataTable10_38
        LDR      R0,[R0, #+20]
        BLX      R0
//  734   }
//  735   //@@@@@@@@
//  736   if((UART5->S1 & UART_S1_TDRE_MASK) && (UART5->C2 & UART_C2_TIE_MASK))
??UART5_IRQHandler_2:
        LDR.N    R0,??DataTable10_56  ;; 0x400eb004
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART5_IRQHandler_3
        LDR.N    R0,??DataTable10_57  ;; 0x400eb003
        LDRB     R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??UART5_IRQHandler_3
//  737   {
//  738     UART_T_ISR[5]();
        LDR.N    R0,??DataTable10_39
        LDR      R0,[R0, #+20]
        BLX      R0
//  739   }
//  740   
//  741 #if (UCOS_II > 0u)
//  742   OSIntExit();          //@@@@@@@@@@@@@@@@@
//  743 #endif
//  744 }
??UART5_IRQHandler_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0xe000e180

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x4006a000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     g_core_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     0x40048034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     0x40049008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     0x40049038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     0x4004a044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     0x40049004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     0x4004903c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     0x4004a040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     0x4006b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     0x4004d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     0x4004b010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     0x4004d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     0x4004b00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     g_bus_clock

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_17:
        DC32     0x4006c000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_18:
        DC32     0x4004c00c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_19:
        DC32     0x4004c008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_20:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_21:
        DC32     0x4004d010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_22:
        DC32     0x4004a02c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_23:
        DC32     0x4004b044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_24:
        DC32     0x4004d014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_25:
        DC32     0x4004a028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_26:
        DC32     0x4004b040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_27:
        DC32     0x400ea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_28:
        DC32     0x40048028

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_29:
        DC32     0x4004d060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_30:
        DC32     0x4004b03c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_31:
        DC32     0x4004d064

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_32:
        DC32     0x4004b038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_33:
        DC32     0x400eb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_34:
        DC32     0x4004c024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_35:
        DC32     0x4004d020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_36:
        DC32     0x4004c020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_37:
        DC32     0x4004d024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_38:
        DC32     UART_R_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_39:
        DC32     UART_T_ISR

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_40:
        DC32     0x4006a012

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_41:
        DC32     0x4006a004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_42:
        DC32     0x4006a003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_43:
        DC32     0x4006b012

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_44:
        DC32     0x4006b004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_45:
        DC32     0x4006b003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_46:
        DC32     0x4006c012

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_47:
        DC32     0x4006c004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_48:
        DC32     0x4006c003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_49:
        DC32     0x4006d012

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_50:
        DC32     0x4006d004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_51:
        DC32     0x4006d003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_52:
        DC32     0x400ea012

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_53:
        DC32     0x400ea004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_54:
        DC32     0x400ea003

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_55:
        DC32     0x400eb012

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_56:
        DC32     0x400eb004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_57:
        DC32     0x400eb003
//  745 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  746 void UART0_ERR_IRQHandler(void)
//  747 {
//  748 }
UART0_ERR_IRQHandler:
        BX       LR               ;; return
//  749 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  750 void UART1_ERR_IRQHandler(void)
//  751 {
//  752 }
UART1_ERR_IRQHandler:
        BX       LR               ;; return
//  753 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  754 void UART2_ERR_IRQHandler(void)
//  755 {
//  756 }
UART2_ERR_IRQHandler:
        BX       LR               ;; return
//  757 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  758 void UART3_ERR_IRQHandler(void)
//  759 {
//  760 }
UART3_ERR_IRQHandler:
        BX       LR               ;; return
//  761 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  762 void UART4_ERR_IRQHandler(void)
//  763 {
//  764 }
UART4_ERR_IRQHandler:
        BX       LR               ;; return
//  765 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  766 void UART5_ERR_IRQHandler(void)
//  767 {
//  768 }
UART5_ERR_IRQHandler:
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  769 
// 
//    48 bytes in section .bss
// 2 290 bytes in section .text
// 
// 2 290 bytes of CODE memory
//    48 bytes of DATA memory
//
//Errors: none
//Warnings: none
