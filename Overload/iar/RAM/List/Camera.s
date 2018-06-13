///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Mar/2018  21:10:47
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Camera.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EW2A79.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Camera.c -D
//        LPLD_K60 -D USE_K60DZ10 -lCN
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\RAM\List\Camera.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_DMA_Init
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_UART_Init
        EXTERN LPLD_UART_PutChar
        EXTERN __aeabi_memcpy4

        PUBLIC Bin_Img_Data
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
        PUBLIC PCLK_init_struct
        PUBLIC Row_Count
        PUBLIC Send_Img
        PUBLIC Src_Img_Data
        PUBLIC VSY_init_struct
        PUBLIC uart_init_struct

// D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Camera.c
//    1 #include "include.h"

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
        LDR.N    R1,??DataTable5  ;; 0xe000e100
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        LSRS     R0,R0,#+5
        STR      R2,[R1, R0, LSL #+2]
??__NVIC_EnableIRQ_0:
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    2 GPIO_InitTypeDef Data_init_struct; // @@@@@@@@@@
Data_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    3 GPIO_InitTypeDef PCLK_init_struct; // PCLK@@@@@@@@
PCLK_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    4 GPIO_InitTypeDef HRF_init_struct;  // HRF@@@@@@@@
HRF_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    5 GPIO_InitTypeDef VSY_init_struct;  // VSY@@@@@@@@
VSY_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    6 DMA_InitTypeDef  DMA_init_struct;  // DMA@@@@@@
DMA_init_struct:
        DS8 44

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    7 UART_InitTypeDef  uart_init_struct;
uart_init_struct:
        DS8 28
//    8 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    9 uint8 Src_Img_Data[V][H]={0};  // @@@@@@@
Src_Img_Data:
        DS8 60000

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   10 uint8 Bin_Img_Data[V][H]={0};  // @@@@@@@@@
Bin_Img_Data:
        DS8 60000
//   11 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   12 uint8 Has_Img=0;  // @@@@@
Has_Img:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   13 uint8 Row_Count = 0;  // @@@
Row_Count:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//   14 uint8 Field_Count = 0;  // @@@
Field_Count:
        DS8 1
//   15 
//   16 
//   17 // @@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   18 void Camera_Handler(void) 
//   19 {
Camera_Handler:
        PUSH     {R7,LR}
//   20   EnableInterrupts; //@@@@@@@@@@@
        CPSIE    I
//   21  
//   22   // @@@
//   23   if(LPLD_GPIO_IsPinxExt(PORTC,GPIO_Pin6))
        LDR.N    R0,??DataTable5_1  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+25
        BPL.N    ??Camera_Handler_0
//   24   {
//   25     Row_Count++;
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_2
        STRB     R0,[R1, #+0]
//   26     if(Row_Count <= V) // @@@@@@@@DMA@@
        LDR.N    R0,??DataTable5_2
        LDRB     R0,[R0, #+0]
        CMP      R0,#+201
        BGE.N    ??Camera_Handler_1
//   27     {
//   28       LPLD_DMA_EnableReq(DMA_CH0);
        LDR.N    R0,??DataTable5_3  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.N    R1,??DataTable5_3  ;; 0x4000800c
        STR      R0,[R1, #+0]
        B.N      ??Camera_Handler_0
//   29     }
//   30     else // @@@@@@@@@@
//   31     {  
//   32       Field_Count--;
??Camera_Handler_1:
        LDR.N    R0,??DataTable5_4
        LDRB     R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable5_4
        STRB     R0,[R1, #+0]
//   33       Send_Img();
        BL       Send_Img
//   34     }   
//   35   }
//   36   
//   37 
//   38   // @@@
//   39   if(LPLD_GPIO_IsPinxExt(PORTC,GPIO_Pin7))
??Camera_Handler_0:
        LDR.N    R0,??DataTable5_1  ;; 0x4004b0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+24
        BPL.N    ??Camera_Handler_2
//   40   {
//   41     if(Field_Count==0)
        LDR.N    R0,??DataTable5_4
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??Camera_Handler_2
//   42     {
//   43       Field_Count++;
        LDR.N    R0,??DataTable5_4
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable5_4
        STRB     R0,[R1, #+0]
//   44       Row_Count=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_2
        STRB     R0,[R1, #+0]
//   45       LPLD_DMA_LoadDstAddr(DMA_CH0,Src_Img_Data);
        LDR.N    R0,??DataTable5_5
        LDR.N    R1,??DataTable5_6  ;; 0x40009010
        STR      R0,[R1, #+0]
//   46     }
//   47   }
//   48   EnableInterrupts; //@@@@
??Camera_Handler_2:
        CPSIE    I
//   49 }
        POP      {R0,PC}          ;; return
//   50 
//   51 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 void Camera_GPIO_Init(void)
//   53 {
Camera_GPIO_Init:
        PUSH     {R7,LR}
//   54   //@@@@@@@(PTD0~PTD7)
//   55   Data_init_struct.GPIO_PTx=PTD;
        LDR.N    R0,??DataTable5_7  ;; 0x400ff0c0
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+0]
//   56   Data_init_struct.GPIO_Pins=GPIO_Pin0_7;
        MOVS     R0,#+255
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+4]
//   57   Data_init_struct.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_8
        STRB     R0,[R1, #+12]
//   58   Data_init_struct.GPIO_PinControl=INPUT_PULL_UP;
        MOVS     R0,#+3
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+8]
//   59   LPLD_GPIO_Init(Data_init_struct);
        LDR.N    R1,??DataTable5_8
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   60    
//   61   //PCLK@@@(PTA19)
//   62   PCLK_init_struct.GPIO_PTx=PTA;
        LDR.N    R0,??DataTable5_9  ;; 0x400ff000
        LDR.N    R1,??DataTable5_10
        STR      R0,[R1, #+0]
//   63   PCLK_init_struct.GPIO_Pins=GPIO_Pin19;
        MOVS     R0,#+524288
        LDR.N    R1,??DataTable5_10
        STR      R0,[R1, #+4]
//   64   PCLK_init_struct.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_10
        STRB     R0,[R1, #+12]
//   65   PCLK_init_struct.GPIO_PinControl=IRQC_DMARI;
        MOVS     R0,#+65536
        LDR.N    R1,??DataTable5_10
        STR      R0,[R1, #+8]
//   66   LPLD_GPIO_Init(PCLK_init_struct);
        LDR.N    R1,??DataTable5_10
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   67   
//   68   //@@@@@@(PTC6)
//   69   HRF_init_struct.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable5_11  ;; 0x400ff080
        LDR.N    R1,??DataTable5_12
        STR      R0,[R1, #+0]
//   70   HRF_init_struct.GPIO_Pins = GPIO_Pin6;
        MOVS     R0,#+64
        LDR.N    R1,??DataTable5_12
        STR      R0,[R1, #+4]
//   71   HRF_init_struct.GPIO_PinControl = IRQC_RI;
        MOVS     R0,#+589824
        LDR.N    R1,??DataTable5_12
        STR      R0,[R1, #+8]
//   72   HRF_init_struct.GPIO_Dir = DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_12
        STRB     R0,[R1, #+12]
//   73   HRF_init_struct.GPIO_Isr=Camera_Handler;
        LDR.N    R0,??DataTable5_13
        LDR.N    R1,??DataTable5_12
        STR      R0,[R1, #+16]
//   74   LPLD_GPIO_Init(HRF_init_struct);
        LDR.N    R1,??DataTable5_12
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   75   
//   76   //@@@@@@(PTC7)
//   77   VSY_init_struct.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable5_11  ;; 0x400ff080
        LDR.N    R1,??DataTable5_14
        STR      R0,[R1, #+0]
//   78   VSY_init_struct.GPIO_Pins = GPIO_Pin7;
        MOVS     R0,#+128
        LDR.N    R1,??DataTable5_14
        STR      R0,[R1, #+4]
//   79   VSY_init_struct.GPIO_PinControl = IRQC_FA;
        MOVS     R0,#+655360
        LDR.N    R1,??DataTable5_14
        STR      R0,[R1, #+8]
//   80   VSY_init_struct.GPIO_Dir= DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_14
        STRB     R0,[R1, #+12]
//   81   VSY_init_struct.GPIO_Isr=Camera_Handler;
        LDR.N    R0,??DataTable5_13
        LDR.N    R1,??DataTable5_14
        STR      R0,[R1, #+16]
//   82   LPLD_GPIO_Init(VSY_init_struct);
        LDR.N    R1,??DataTable5_14
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   83 }
        POP      {R0,PC}          ;; return
//   84 
//   85 
//   86 
//   87 
//   88 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   89 void Camera_DMA_Init(void)
//   90 {
Camera_DMA_Init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   91   DMA_init_struct.DMA_CHx=DMA_CH0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_15
        STRB     R0,[R1, #+0]
//   92   DMA_init_struct.DMA_Req=PORTA_DMAREQ;
        MOVS     R0,#+49
        LDR.N    R1,??DataTable5_15
        STRB     R0,[R1, #+1]
//   93   DMA_init_struct.DMA_MajorLoopCnt=H;
        MOV      R0,#+300
        LDR.N    R1,??DataTable5_15
        STRH     R0,[R1, #+4]
//   94   DMA_init_struct.DMA_MinorByteCnt=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_15
        STR      R0,[R1, #+8]
//   95   
//   96   DMA_init_struct.DMA_SourceAddr=(uint32)&PTD->PDIR;
        LDR.N    R0,??DataTable5_16  ;; 0x400ff0d0
        LDR.N    R1,??DataTable5_15
        STR      R0,[R1, #+12]
//   97   DMA_init_struct.DMA_DestAddr=(uint32)Src_Img_Data;
        LDR.N    R0,??DataTable5_5
        LDR.N    R1,??DataTable5_15
        STR      R0,[R1, #+24]
//   98   
//   99   DMA_init_struct.DMA_DestAddrOffset=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_15
        STRH     R0,[R1, #+30]
//  100   DMA_init_struct.DMA_AutoDisableReq=TRUE;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_15
        STRB     R0,[R1, #+36]
//  101   LPLD_DMA_Init(DMA_init_struct);
        LDR.N    R1,??DataTable5_15
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//  102 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//  103 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  104 void Camera_Init(void)
//  105 {
Camera_Init:
        PUSH     {R7,LR}
//  106  Camera_GPIO_Init();
        BL       Camera_GPIO_Init
//  107  Camera_DMA_Init();
        BL       Camera_DMA_Init
//  108  enable_irq(PORTC_IRQn);
        MOVS     R0,#+89
        BL       __NVIC_EnableIRQ
//  109 }
        POP      {R0,PC}          ;; return
//  110 
//  111 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  112 void Blue_Init(void)
//  113 {
Blue_Init:
        PUSH     {R5-R7,LR}
//  114   uart_init_struct.UART_Uartx=UART4;
        LDR.N    R0,??DataTable5_17  ;; 0x400ea000
        LDR.N    R1,??DataTable5_18
        STR      R0,[R1, #+0]
//  115   uart_init_struct.UART_BaudRate=115200;
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable5_18
        STR      R0,[R1, #+4]
//  116   uart_init_struct.UART_TxPin=PTE24;
        MOVS     R0,#+148
        LDR.N    R1,??DataTable5_18
        STRB     R0,[R1, #+8]
//  117   uart_init_struct.UART_RxPin=PTE25;
        MOVS     R0,#+149
        LDR.N    R1,??DataTable5_18
        STRB     R0,[R1, #+9]
//  118   LPLD_UART_Init(uart_init_struct);
        LDR.N    R1,??DataTable5_18
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//  119 }
        POP      {R0-R2,PC}       ;; return
//  120 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  121 void Send_Img(void)
//  122 {
Send_Img:
        PUSH     {R3-R5,LR}
//  123   LPLD_UART_PutChar(UART4,0xff);//@@@@@@
        MOVS     R1,#-1
        LDR.N    R0,??DataTable5_17  ;; 0x400ea000
        BL       LPLD_UART_PutChar
//  124   uint16 i,j;
//  125   for(i=0;i<V;i++) 
        MOVS     R4,#+0
        B.N      ??Send_Img_0
//  126   {
//  127     for(j=0;j<H;j++)
//  128     {
//  129       if(Src_Img_Data[i][j]==0xff)
??Send_Img_1:
        LDR.N    R1,??DataTable5_5
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R0,#+300
        MULS     R2,R0,R2
        ADD      R0,R1,R2
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDRB     R0,[R0, R1]
        CMP      R0,#+255
        BNE.N    ??Send_Img_2
//  130       {
//  131         Src_Img_Data[i][j]=0xfe;
        LDR.N    R1,??DataTable5_5
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R0,#+300
        MULS     R2,R0,R2
        ADD      R0,R1,R2
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R2,#+254
        STRB     R2,[R0, R1]
//  132       }
//  133       LPLD_UART_PutChar(UART4,Src_Img_Data[i][j]);
??Send_Img_2:
        LDR.N    R1,??DataTable5_5
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R0,#+300
        MULS     R2,R0,R2
        ADD      R0,R1,R2
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDRSB    R0,[R0, R1]
        MOVS     R1,R0
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable5_17  ;; 0x400ea000
        BL       LPLD_UART_PutChar
//  134     }
        ADDS     R5,R5,#+1
??Send_Img_3:
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+300
        BLT.N    ??Send_Img_1
        ADDS     R4,R4,#+1
??Send_Img_0:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+200
        BGE.N    ??Send_Img_4
        MOVS     R5,#+0
        B.N      ??Send_Img_3
//  135   } 
//  136 }
??Send_Img_4:
        POP      {R0,R4,R5,PC}    ;; return

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
        DC32     Field_Count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     Src_Img_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40009010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x400ff0c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     Data_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     PCLK_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     HRF_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     Camera_Handler

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_14:
        DC32     VSY_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_15:
        DC32     DMA_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_16:
        DC32     0x400ff0d0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_17:
        DC32     0x400ea000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_18:
        DC32     uart_init_struct

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 120 155 bytes in section .bss
//     666 bytes in section .text
// 
//     666 bytes of CODE memory
// 120 155 bytes of DATA memory
//
//Errors: none
//Warnings: none
