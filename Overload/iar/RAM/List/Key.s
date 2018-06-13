///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Mar/2018  21:10:48
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Key.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EW304E.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Key.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\RAM\List\Key.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_EnableIrq
        EXTERN LPLD_GPIO_Init
        EXTERN Server_Drive
        EXTERN Time_Delay
        EXTERN __aeabi_memcpy4

        PUBLIC Key_Handler
        PUBLIC Key_Init
        PUBLIC duty
        PUBLIC key_init_struct

// D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Key.c
//    1 #include "include.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    3 GPIO_InitTypeDef key_init_struct;
key_init_struct:
        DS8 20
//    4 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    5 uint32 duty=0;
duty:
        DS8 4
//    6 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void Key_Handler(void)
//    8 {
Key_Handler:
        PUSH     {R7,LR}
//    9   DisableInterrupts;
        CPSID    I
//   10   if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin20))
        LDR.N    R0,??DataTable1  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+11
        BPL.N    ??Key_Handler_0
//   11   {
//   12     Time_Delay(100);
        MOVS     R0,#+100
        BL       Time_Delay
//   13     if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin20))
        LDR.N    R0,??DataTable1  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+11
        BPL.N    ??Key_Handler_0
//   14     {
//   15       duty-=100;
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+100
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   16       Server_Drive();
        BL       Server_Drive
//   17     }
//   18 
//   19   }
//   20   if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin21))
??Key_Handler_0:
        LDR.N    R0,??DataTable1  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+10
        BPL.N    ??Key_Handler_1
//   21   {
//   22     Time_Delay(100);
        MOVS     R0,#+100
        BL       Time_Delay
//   23     if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin21))
        LDR.N    R0,??DataTable1  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+10
        BPL.N    ??Key_Handler_1
//   24     {
//   25       duty+=100;
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+100
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   26       Server_Drive();    
        BL       Server_Drive
//   27     }
//   28 
//   29   }
//   30   if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin22))
??Key_Handler_1:
        LDR.N    R0,??DataTable1  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+9
        BPL.N    ??Key_Handler_2
//   31   {
//   32     Time_Delay(100);
        MOVS     R0,#+100
        BL       Time_Delay
//   33     if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin22))
        LDR.N    R0,??DataTable1  ;; 0x4004a0a0
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+9
        BPL.N    ??Key_Handler_2
//   34     {
//   35       duty=5000;
        MOVW     R0,#+5000
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//   36       Server_Drive();    
        BL       Server_Drive
//   37     }
//   38   }
//   39     EnableInterrupts;
??Key_Handler_2:
        CPSIE    I
//   40 }
        POP      {R0,PC}          ;; return
//   41 
//   42 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   43 void Key_Init(void)
//   44 {
Key_Init:
        PUSH     {R7,LR}
//   45   key_init_struct.GPIO_PTx=PTB;
        LDR.N    R0,??DataTable1_2  ;; 0x400ff040
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+0]
//   46   key_init_struct.GPIO_Pins=GPIO_Pin20|GPIO_Pin21|GPIO_Pin22;
        MOVS     R0,#+7340032
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+4]
//   47   key_init_struct.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_3
        STRB     R0,[R1, #+12]
//   48   key_init_struct.GPIO_PinControl=IRQC_FA;
        MOVS     R0,#+655360
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+8]
//   49   key_init_struct.GPIO_Isr=Key_Handler;
        LDR.N    R0,??DataTable1_4
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+16]
//   50   LPLD_GPIO_Init(key_init_struct);
        LDR.N    R1,??DataTable1_3
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   51   LPLD_GPIO_EnableIrq(key_init_struct);
        LDR.N    R1,??DataTable1_3
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_EnableIrq
//   52 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     duty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     key_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     Key_Handler

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//  24 bytes in section .bss
// 208 bytes in section .text
// 
// 208 bytes of CODE memory
//  24 bytes of DATA memory
//
//Errors: none
//Warnings: none
