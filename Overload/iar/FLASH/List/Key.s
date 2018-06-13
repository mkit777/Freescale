///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Jun/2018  18:03:58
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Key.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWDB01.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Key.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\Key.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LCD_CLS
        EXTERN LCD_P6x8Str
        EXTERN LPLD_GPIO_EnableIrq
        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4
        EXTERN should_send
        EXTERN sprintf

        PUBLIC Key_Handler
        PUBLIC Key_Init
        PUBLIC LCD_Flush
        PUBLIC duty
        PUBLIC key_init_struct

// D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Key.c
//    1 #include "include.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    3 GPIO_InitTypeDef key_init_struct;
key_init_struct:
        DS8 20

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//    4 uint32 duty=1000;
duty:
        DC32 1000

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    5 void Key_Handler(void)
//    6 {
Key_Handler:
        PUSH     {R7,LR}
//    7   DisableInterrupts;
        CPSID    I
//    8   if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin20))
        LDR.N    R0,??DataTable3  ;; 0x4004a0a0
        LDR      R1,[R0, #+0]
        LSLS     R1,R1,#+11
        BPL.N    ??Key_Handler_0
//    9   {
//   10     if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin20))
        LDR      R1,[R0, #+0]
        LSLS     R1,R1,#+11
        BPL.N    ??Key_Handler_0
//   11     {
//   12       //@
//   13       duty-=100;
        LDR.N    R1,??DataTable3_1
        LDR      R2,[R1, #+0]
        SUBS     R2,R2,#+100
        STR      R2,[R1, #+0]
//   14     }
//   15 
//   16   }
//   17   if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin21))
??Key_Handler_0:
        LDR      R1,[R0, #+0]
        LSLS     R1,R1,#+10
        BPL.N    ??Key_Handler_1
//   18   {
//   19     if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin21))
        LDR      R1,[R0, #+0]
        LSLS     R1,R1,#+10
        BPL.N    ??Key_Handler_1
//   20     {
//   21       //@
//   22       duty+=100;
        LDR.N    R1,??DataTable3_1
        LDR      R2,[R1, #+0]
        ADDS     R2,R2,#+100
        STR      R2,[R1, #+0]
//   23     }
//   24 
//   25   }
//   26   if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin22))
??Key_Handler_1:
        LDR      R1,[R0, #+0]
        LSLS     R1,R1,#+9
        BPL.N    ??Key_Handler_2
//   27   {
//   28     if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin22))
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+9
        BPL.N    ??Key_Handler_2
//   29     {
//   30       //@
//   31       if(should_send==0)
        LDR.N    R0,??DataTable3_2
        LDRB     R1,[R0, #+0]
        SUBS     R1,R1,#+1
        SBCS     R1,R1,R1
        LSRS     R1,R1,#+31
        STRB     R1,[R0, #+0]
//   32       {
//   33         should_send=1;
//   34       }
//   35       else should_send=0;
//   36     }
//   37   }
//   38  // Morter_Drive(duty);
//   39   LCD_Flush();
??Key_Handler_2:
        BL       LCD_Flush
//   40   EnableInterrupts;
        CPSIE    I
//   41 }
        POP      {R0,PC}          ;; return
//   42 
//   43 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   44 void LCD_Flush(void)
//   45 {
LCD_Flush:
        PUSH     {LR}
        SUB      SP,SP,#+100
//   46   LCD_CLS();
        BL       LCD_CLS
//   47   char str[100];
//   48   sprintf(str, "duty:\t%d", duty);
        LDR.N    R0,??DataTable3_1
        LDR      R2,[R0, #+0]
        ADR.W    R1,?_0
        MOV      R0,SP
        BL       sprintf
//   49   LCD_P6x8Str(0, 0, str);
        MOV      R2,SP
        MOVS     R1,#+0
        MOV      R0,R1
        BL       LCD_P6x8Str
//   50 }
        ADD      SP,SP,#+100
        POP      {PC}             ;; return
//   51 
//   52 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   53 void Key_Init(void)
//   54 {
Key_Init:
        PUSH     {R2-R4,LR}
//   55   key_init_struct.GPIO_PTx=PTB;
        LDR.N    R4,??DataTable3_3
        LDR.N    R0,??DataTable3_4  ;; 0x400ff040
        STR      R0,[R4, #+0]
//   56   key_init_struct.GPIO_Pins=GPIO_Pin20|GPIO_Pin21|GPIO_Pin22;
        MOV      R0,#+7340032
        STR      R0,[R4, #+4]
//   57   key_init_struct.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        STRB     R0,[R4, #+12]
//   58   key_init_struct.GPIO_PinControl=IRQC_FA;
        MOV      R0,#+655360
        STR      R0,[R4, #+8]
//   59   key_init_struct.GPIO_Isr=Key_Handler;
        LDR.N    R0,??DataTable3_5
        STR      R0,[R4, #+16]
//   60   LPLD_GPIO_Init(key_init_struct);
        MOV      R1,R4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   61   LPLD_GPIO_EnableIrq(key_init_struct);
        MOV      R1,R4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_EnableIrq
//   62 }
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4004a0a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     duty

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     should_send

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     key_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     Key_Handler

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
?_0:
        DC8 "duty:\t%d"
        DC8 0, 0, 0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//  20 bytes in section .bss
//   4 bytes in section .data
// 216 bytes in section .text
// 
// 216 bytes of CODE memory
//  24 bytes of DATA memory
//
//Errors: none
//Warnings: 2
