///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Jun/2018  18:03:58
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Overload.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWDC4B.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Overload.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\Overload.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Blue_Init
        EXTERN Camera_Init
        EXTERN Encoder_Init
        EXTERN Get_Bound_Qian
        EXTERN Has_Img
        EXTERN Key_Init
        EXTERN LCD_Init
        EXTERN Led_Init
        EXTERN Led_Off
        EXTERN Motor_Init
        EXTERN Server_Init

        PUBLIC main

// D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Overload.c
//    1 /**
//    2  * --------------基于"拉普兰德K60底层库V3"的工程（Overload）-----------------
//    3  * @file Overload.c
//    4  * @version 0.0
//    5  * @date 2013-9-29
//    6  * @brief 关于该工程的描述
//    7  *
//    8  * 版权所有:北京拉普兰德电子技术有限公司
//    9  * http://www.lpld.cn
//   10  * mail:support@lpld.cn
//   11  * 硬件平台:  LPLD K60 Card / LPLD K60 Nano
//   12  *
//   13  * 本工程基于"拉普兰德K60底层库V3"开发，
//   14  * 所有开源代码均在"lib"文件夹下，用户不必更改该目录下代码，
//   15  * 所有用户工程需保存在"project"文件夹下，以工程名定义文件夹名，
//   16  * 底层库使用方法见相关文档。 
//   17  *
//   18  */
//   19 #include "include.h"
//   20 
//   21 
//   22    
//   23    

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   24 void main (void)
//   25 {
main:
        PUSH     {R7,LR}
//   26   DisableInterrupts;
        CPSID    I
//   27   Led_Init();
        BL       Led_Init
//   28   LCD_Init();
        BL       LCD_Init
//   29   Camera_Init();
        BL       Camera_Init
//   30   Blue_Init();
        BL       Blue_Init
//   31   Key_Init();
        BL       Key_Init
//   32   Server_Init();
        BL       Server_Init
//   33   Motor_Init();  
        BL       Motor_Init
//   34   Led_Off();
        BL       Led_Off
//   35   Encoder_Init();
        BL       Encoder_Init
//   36   EnableInterrupts;
        CPSIE    I
//   37   while(1)
//   38   {
//   39     if(Has_Img)
??main_1:
        LDR.N    R1,??main_0
        LDR      R0,[R1, #+0]
        CMP      R0,#+0
        BEQ.N    ??main_1
//   40     {
//   41       Has_Img=0;
        MOVS     R0,#+0
        STR      R0,[R1, #+0]
//   42       Get_Bound_Qian();
        BL       Get_Bound_Qian
        B.N      ??main_1
        DATA
??main_0:
        DC32     Has_Img
//   43     }
//   44   } 
//   45   
//   46 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//   47 
// 
// 64 bytes in section .text
// 
// 64 bytes of CODE memory
//
//Errors: none
//Warnings: none
