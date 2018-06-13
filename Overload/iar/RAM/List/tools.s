///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      05/Mar/2018  12:19:03
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\tools.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWE491.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\tools.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\RAM\List\tools.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC GPIO_Init

// D:\workspace\LPLD_OSKinetis_V3\project\Overload\app\tools.c
//    1 #include "include.h"
//    2 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    3 void GPIO_Init(GPIO_Type *ptx,uint32 pin,uint8 dir,uint8 out)
//    4 {
GPIO_Init:
        SUB      SP,SP,#+20
//    5   GPIO_InitTypeDef gpio_init_struct;
//    6   gpio_init_struct.GPIO_PTx = ptx;
        STR      R0,[SP, #+0]
//    7   gpio_init_struct.GPIO_Pins = pin;
        STR      R1,[SP, #+4]
//    8   gpio_init_struct.GPIO_Dir = dir;
        STRB     R2,[SP, #+12]
//    9   gpio_init_struct.GPIO_Output=out;
        STRB     R3,[SP, #+13]
//   10   gpio_init_struct.GPIO_PinControl = NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//   11 }
        ADD      SP,SP,#+20
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 22 bytes in section .text
// 
// 22 bytes of CODE memory
//
//Errors: none
//Warnings: 1
