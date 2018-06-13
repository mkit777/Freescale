///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Jun/2018  18:03:57
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Camera.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWD773.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Camera.c -D
//        LPLD_K60 -D USE_K60DZ10 -lCN
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\Camera.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Img_Handler
        EXTERN LPLD_DMA_Init
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_UART_Init
        EXTERN LPLD_UART_PutChar
        EXTERN __aeabi_memcpy4

        PUBLIC Blue_Init
        PUBLIC Camera_DMA_Init
        PUBLIC Camera_GPIO_Init
        PUBLIC Camera_Handler
        PUBLIC Camera_Init
        PUBLIC DMA_init_struct
        PUBLIC Data_init_struct
        PUBLIC Field_Count
        PUBLIC HRF_init_struct
        PUBLIC Has_Img
        PUBLIC Img_Data
        PUBLIC PCLK_init_struct
        PUBLIC Row_Count
        PUBLIC Send_Img
        PUBLIC VSY_init_struct
        PUBLIC uart_init_struct

// D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Camera.c
//    1 #include "include.h"

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void __NVIC_EnableIRQ(IRQn_Type)
__NVIC_EnableIRQ:
        MOVS     R1,R0
        BMI.N    ??__NVIC_EnableIRQ_0
        MOVS     R2,#+1
        AND      R0,R0,#0x1F
        LSL      R0,R2,R0
        LDR.N    R2,??DataTable5  ;; 0xe000e100
        LSRS     R1,R1,#+5
        STR      R0,[R2, R1, LSL #+2]
??__NVIC_EnableIRQ_0:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    2 GPIO_InitTypeDef Data_init_struct; // @@@@@@@@@@
Data_init_struct:
        DS8 20
//    3 GPIO_InitTypeDef PCLK_init_struct; // PCLK@@@@@@@@
PCLK_init_struct:
        DS8 20
//    4 GPIO_InitTypeDef HRF_init_struct;  // HRF@@@@@@@@
HRF_init_struct:
        DS8 20
//    5 GPIO_InitTypeDef VSY_init_struct;  // VSY@@@@@@@@
VSY_init_struct:
        DS8 20
//    6 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    7 UART_InitTypeDef  uart_init_struct;
uart_init_struct:
        DS8 28
//    8 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    9 uint8 Img_Data[V][H]={0};  // @@@@@@@
Img_Data:
        DS8 25280

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   10 uint32 Row_Count=0;
Row_Count:
        DS8 4
//   11 uint32 Field_Count=0;
Field_Count:
        DS8 4
//   12 uint32 Has_Img=0;
Has_Img:
        DS8 4
//   13 // @@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   14 void Camera_Handler(void)
//   15 {
Camera_Handler:
        PUSH     {R3,R4}
//   16   //DisableInterrupts;
//   17   
//   18   // @@@
//   19   if(LPLD_GPIO_IsPinxExt(PORTC,GPIO_Pin6))
        LDR.N    R2,??DataTable5_1  ;; 0x4004b0a0
        LDR      R0,[R2, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??Camera_Handler_0
//   20   {
//   21     LPLD_GPIO_ClearIntFlag(PORTC);
        MOV      R0,#-1
        STR      R0,[R2, #+0]
//   22     Row_Count++;
        LDR.N    R3,??DataTable5_2
        LDR      R0,[R3, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R3, #+0]
//   23     if(Row_Count%3==0 && Row_Count/3<V && Field_Count==1)
        MOVS     R1,#+3
        UDIV     R4,R0,R1
        ADD      R1,R4,R4, LSL #+1
        SUBS     R0,R0,R1
        BNE.N    ??Camera_Handler_0
        CMP      R4,#+80
        BCS.N    ??Camera_Handler_0
        LDR      R0,[R3, #+4]
        CMP      R0,#+1
        BNE.N    ??Camera_Handler_0
//   24     {
//   25       LPLD_DMA_EnableReq(DMA_CH0);
        LDR.N    R0,??DataTable5_3  ;; 0x4000800c
        LDR      R1,[R0, #+0]
        ORR      R1,R1,#0x1
        STR      R1,[R0, #+0]
//   26     }
//   27     
//   28   }
//   29   
//   30   
//   31   // @@@
//   32   if(LPLD_GPIO_IsPinxExt(PORTC,GPIO_Pin7))
??Camera_Handler_0:
        LDR      R0,[R2, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??Camera_Handler_1
//   33   {
//   34     LPLD_GPIO_ClearIntFlag(PORTC);
        MOV      R0,#-1
        STR      R0,[R2, #+0]
//   35     
//   36     if(Field_Count==0)
        LDR.N    R1,??DataTable5_2
        LDR      R0,[R1, #+4]
        CMP      R0,#+0
        BNE.N    ??Camera_Handler_2
//   37     {
//   38       Row_Count=0;
        MOVS     R0,#+0
        STR      R0,[R1, #+0]
//   39       Field_Count=1;
        MOVS     R0,#+1
        STR      R0,[R1, #+4]
//   40       Has_Img=0;
        MOVS     R0,#+0
        STR      R0,[R1, #+8]
//   41       LPLD_DMA_LoadDstAddr(DMA_CH0,Img_Data);
        LDR.N    R0,??DataTable5_4
        LDR.N    R1,??DataTable5_5  ;; 0x40009010
        STR      R0,[R1, #+0]
        B.N      ??Camera_Handler_1
//   42     }else{
//   43       Field_Count=0;
??Camera_Handler_2:
        MOVS     R0,#+0
        STR      R0,[R1, #+4]
//   44       Has_Img=1;
        MOVS     R0,#+1
        STR      R0,[R1, #+8]
//   45       Img_Handler();
        POP      {R0,R4}
        B.W      Img_Handler
//   46     }
//   47 
//   48   }
//   49   //EnableInterrupts; 
//   50 }
??Camera_Handler_1:
        POP      {R0,R4}
        BX       LR               ;; return
//   51 
//   52 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   53 void Camera_GPIO_Init(void)
//   54 {
Camera_GPIO_Init:
        PUSH     {R2-R8,LR}
//   55   //@@@@@@@(PTD0~PTD7)
//   56   Data_init_struct.GPIO_PTx=PTD;
        LDR.N    R4,??DataTable5_6  ;; 0x400ff080
        LDR.N    R5,??DataTable5_7
        ADD      R0,R4,#+64
        STR      R0,[R5, #+0]
//   57   Data_init_struct.GPIO_Pins=GPIO_Pin0_7;
        MOVS     R0,#+255
        STR      R0,[R5, #+4]
//   58   Data_init_struct.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        STRB     R0,[R5, #+12]
//   59   Data_init_struct.GPIO_PinControl=INPUT_PULL_UP;
        MOVS     R0,#+3
        STR      R0,[R5, #+8]
//   60   LPLD_GPIO_Init(Data_init_struct);
        MOV      R1,R5
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   61   
//   62   //PCLK@@@(PTA19)
//   63   PCLK_init_struct.GPIO_PTx=PTA;
        LDR.N    R0,??DataTable5_8  ;; 0x400ff000
        STR      R0,[R5, #+20]
//   64   PCLK_init_struct.GPIO_Pins=GPIO_Pin19;
        MOV      R0,#+524288
        STR      R0,[R5, #+24]
//   65   PCLK_init_struct.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        STRB     R0,[R5, #+32]
//   66   PCLK_init_struct.GPIO_PinControl=IRQC_DMARI;
        MOV      R0,#+65536
        STR      R0,[R5, #+28]
//   67   LPLD_GPIO_Init(PCLK_init_struct);
        ADD      R1,R5,#+20
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   68   
//   69   //@@@@@@(PTC6)
//   70   HRF_init_struct.GPIO_PTx = PTC;
        STR      R4,[R5, #+40]
//   71   HRF_init_struct.GPIO_Pins = GPIO_Pin6;
        MOVS     R0,#+64
        STR      R0,[R5, #+44]
//   72   HRF_init_struct.GPIO_PinControl = IRQC_RI;
        MOV      R8,#+589824
        STR      R8,[R5, #+48]
//   73   HRF_init_struct.GPIO_Dir = DIR_INPUT;
        ADD      R6,R5,#+52
        MOVS     R0,#+0
        STRB     R0,[R6, #+0]
//   74   HRF_init_struct.GPIO_Isr=Camera_Handler;
        LDR.N    R7,??DataTable5_9
        STR      R7,[R6, #+4]
//   75   LPLD_GPIO_Init(HRF_init_struct);
        ADD      R1,R5,#+40
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   76   
//   77   //@@@@@@(PTC7)
//   78   VSY_init_struct.GPIO_PTx = PTC;
        STR      R4,[R6, #+8]
//   79   VSY_init_struct.GPIO_Pins = GPIO_Pin7;
        MOVS     R0,#+128
        STR      R0,[R6, #+12]
//   80   VSY_init_struct.GPIO_PinControl = IRQC_RI;
        STR      R8,[R6, #+16]
//   81   VSY_init_struct.GPIO_Dir= DIR_INPUT;
        MOVS     R0,#+0
        STRB     R0,[R6, #+20]
//   82   VSY_init_struct.GPIO_Isr=Camera_Handler;
        STR      R7,[R6, #+24]
//   83   LPLD_GPIO_Init(VSY_init_struct);
        ADD      R1,R5,#+60
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   84 }
        POP      {R0,R1,R4-R8,PC}  ;; return
//   85 
//   86 
//   87 
//   88 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   89 DMA_InitTypeDef  DMA_init_struct;  // DMA@@@@@@
DMA_init_struct:
        DS8 44

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   90 void Camera_DMA_Init(void)
//   91 {
Camera_DMA_Init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   92   DMA_init_struct.DMA_CHx=DMA_CH0;
        LDR.N    R1,??DataTable5_10
        MOVS     R0,#+0
        STRB     R0,[R1, #+0]
//   93   DMA_init_struct.DMA_Req=PORTA_DMAREQ;
        MOVS     R0,#+49
        STRB     R0,[R1, #+1]
//   94   DMA_init_struct.DMA_MajorLoopCnt=H;
        MOV      R0,#+316
        STRH     R0,[R1, #+4]
//   95   DMA_init_struct.DMA_MinorByteCnt=1;
        MOVS     R0,#+1
        STR      R0,[R1, #+8]
//   96   
//   97   DMA_init_struct.DMA_SourceAddr=(uint32)&PTD->PDIR;
        LDR.N    R0,??DataTable5_11  ;; 0x400ff0d0
        STR      R0,[R1, #+12]
//   98   DMA_init_struct.DMA_DestAddr=(uint32)Img_Data;
        LDR.N    R0,??DataTable5_4
        STR      R0,[R1, #+24]
//   99   
//  100   DMA_init_struct.DMA_DestDataSize=DMA_DST_8BIT;
        MOVS     R0,#+0
        STRB     R0,[R1, #+28]
//  101   DMA_init_struct.DMA_SourceDataSize=DMA_SRC_8BIT;
        STRB     R0,[R1, #+16]
//  102   
//  103   DMA_init_struct.DMA_DestAddrOffset=1;
        MOVS     R0,#+1
        STRH     R0,[R1, #+30]
//  104   DMA_init_struct.DMA_AutoDisableReq=TRUE;
        STRB     R0,[R1, #+36]
//  105   LPLD_DMA_Init(DMA_init_struct);
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//  106 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//  107 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  108 void Camera_Init(void)
//  109 {
Camera_Init:
        PUSH     {R7,LR}
//  110   Camera_GPIO_Init();
        BL       Camera_GPIO_Init
//  111   Camera_DMA_Init();
        BL       Camera_DMA_Init
//  112   enable_irq(PORTC_IRQn);
        MOVS     R0,#+89
        POP      {R1,LR}
        B.N      __NVIC_EnableIRQ
//  113 }
//  114 
//  115 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  116 void Blue_Init(void)
//  117 {
Blue_Init:
        PUSH     {R5-R7,LR}
//  118   uart_init_struct.UART_Uartx=UART4;
        LDR.N    R1,??DataTable5_12
        LDR.N    R0,??DataTable5_13  ;; 0x400ea000
        STR      R0,[R1, #+0]
//  119   uart_init_struct.UART_BaudRate=115200;
        MOV      R0,#+115200
        STR      R0,[R1, #+4]
//  120   uart_init_struct.UART_TxPin=PTE24;
        MOVS     R0,#+148
        STRB     R0,[R1, #+8]
//  121   uart_init_struct.UART_RxPin=PTE25;
        MOVS     R0,#+149
        STRB     R0,[R1, #+9]
//  122   LPLD_UART_Init(uart_init_struct);
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//  123 }
        POP      {R0-R2,PC}       ;; return
//  124 
//  125 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  126 void Send_Img(void)
//  127 {
Send_Img:
        PUSH     {R3-R7,LR}
//  128   uint16 i,j;
//  129   LPLD_UART_PutChar(UART4,0x01);
        LDR.N    R4,??DataTable5_13  ;; 0x400ea000
        MOVS     R1,#+1
        MOV      R0,R4
        BL       LPLD_UART_PutChar
//  130   LPLD_UART_PutChar(UART4,0xFE);//@@@@@@
        MVN      R5,#+1
        MOV      R1,R5
        MOV      R0,R4
        BL       LPLD_UART_PutChar
//  131   for(i=0;i<V;i++) 
        MOVS     R6,#+0
        B.N      ??Send_Img_0
//  132   {
//  133     for(j=0;j<H;j++)
//  134     {
//  135       LPLD_UART_PutChar(UART4,Img_Data[i][j]);
??Send_Img_1:
        LDR.N    R1,??DataTable5_4
        MOV      R2,#+316
        MULS     R2,R2,R6
        ADD      R1,R1,R2
        LDRSB    R0,[R1, R0]
        MOV      R1,R0
        MOV      R0,R4
        BL       LPLD_UART_PutChar
//  136     }
        ADDS     R7,R7,#+1
??Send_Img_2:
        MOV      R0,R7
        UXTH     R0,R0
        CMP      R0,#+316
        BLT.N    ??Send_Img_1
        ADDS     R6,R6,#+1
??Send_Img_0:
        CMP      R6,#+80
        BGE.N    ??Send_Img_3
        MOVS     R7,#+0
        B.N      ??Send_Img_2
//  137   }
//  138   LPLD_UART_PutChar(UART4,0xFE);
??Send_Img_3:
        MOV      R1,R5
        MOV      R0,R4
        BL       LPLD_UART_PutChar
//  139   LPLD_UART_PutChar(UART4,0x01);
        MOVS     R1,#+1
        MOV      R0,R4
        POP      {R2,R4-R7,LR}
        B.W      LPLD_UART_PutChar
//  140   
//  141 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xe000e100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x4004b0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     Row_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     Img_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x40009010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     Data_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     Camera_Handler

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     DMA_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x400ff0d0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     uart_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x400ea000

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 25 444 bytes in section .bss
//    582 bytes in section .text
// 
//    582 bytes of CODE memory
// 25 444 bytes of DATA memory
//
//Errors: none
//Warnings: none
