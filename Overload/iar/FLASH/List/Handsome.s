///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Jun/2018  18:03:57
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Handsome.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWD9B8.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Handsome.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\Handsome.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

        PUBLIC Led_Init
        PUBLIC Led_Off
        PUBLIC Led_On
        PUBLIC led_init_struct_a17
        PUBLIC led_init_struct_c0
        PUBLIC led_init_struct_d15
        PUBLIC led_init_struct_e26

// D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Handsome.c
//    1 #include "include.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    2 GPIO_InitTypeDef led_init_struct_a17;
led_init_struct_a17:
        DS8 20
//    3 GPIO_InitTypeDef led_init_struct_c0;
led_init_struct_c0:
        DS8 20
//    4 GPIO_InitTypeDef led_init_struct_d15;
led_init_struct_d15:
        DS8 20
//    5 GPIO_InitTypeDef led_init_struct_e26;
led_init_struct_e26:
        DS8 20

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    6 void Led_Init()
//    7 {
Led_Init:
        PUSH     {R2-R6,LR}
//    8   led_init_struct_a17.GPIO_PTx = PTA;
        LDR.N    R4,??DataTable2
        LDR.N    R0,??DataTable2_1  ;; 0x400ff000
        STR      R0,[R4, #+0]
//    9   led_init_struct_a17.GPIO_Pins=GPIO_Pin17;
        MOV      R0,#+131072
        STR      R0,[R4, #+4]
//   10   led_init_struct_a17.GPIO_Dir=DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[R4, #+12]
//   11   led_init_struct_a17.GPIO_Output=OUTPUT_L;
        MOVS     R0,#+0
        STRB     R0,[R4, #+13]
//   12   LPLD_GPIO_Init(led_init_struct_a17);
        MOV      R1,R4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   13   
//   14   led_init_struct_c0.GPIO_PTx = PTC;
        LDR.N    R5,??DataTable2_2  ;; 0x400ff080
        STR      R5,[R4, #+20]
//   15   led_init_struct_c0.GPIO_Pins=GPIO_Pin0;
        MOVS     R0,#+1
        STR      R0,[R4, #+24]
//   16   led_init_struct_c0.GPIO_Dir=DIR_OUTPUT;
        STRB     R0,[R4, #+32]
//   17   led_init_struct_c0.GPIO_Output=OUTPUT_L;
        MOVS     R0,#+0
        STRB     R0,[R4, #+33]
//   18   LPLD_GPIO_Init(led_init_struct_c0);
        ADD      R1,R4,#+20
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   19   
//   20   led_init_struct_d15.GPIO_PTx = PTD;
        ADD      R6,R4,#+40
        ADD      R0,R5,#+64
        STR      R0,[R6, #+0]
//   21   led_init_struct_d15.GPIO_Pins=GPIO_Pin15;
        MOV      R0,#+32768
        STR      R0,[R6, #+4]
//   22   led_init_struct_d15.GPIO_Dir=DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[R6, #+12]
//   23   led_init_struct_d15.GPIO_Output=OUTPUT_L;
        MOVS     R0,#+0
        STRB     R0,[R6, #+13]
//   24   LPLD_GPIO_Init(led_init_struct_d15); 
        MOV      R1,R6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   25   
//   26   led_init_struct_e26.GPIO_PTx = PTE;
        LDR.N    R0,??DataTable2_3  ;; 0x400ff100
        STR      R0,[R6, #+20]
//   27   led_init_struct_e26.GPIO_Pins=GPIO_Pin26;
        MOV      R0,#+67108864
        STR      R0,[R6, #+24]
//   28   led_init_struct_e26.GPIO_Dir=DIR_OUTPUT;
        ADD      R0,R4,#+72
        MOVS     R1,#+1
        STRB     R1,[R0, #+0]
//   29   led_init_struct_e26.GPIO_Output=OUTPUT_L;
        MOVS     R1,#+0
        STRB     R1,[R0, #+1]
//   30   LPLD_GPIO_Init(led_init_struct_e26);
        ADD      R1,R4,#+60
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   31 }
        POP      {R0,R1,R4-R6,PC}  ;; return
//   32 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   33 void Led_On()
//   34 {
//   35   PTA17_O = 0;
Led_On:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_4  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//   36   PTC0_O = 0;
        LDR.N    R1,??DataTable2_5  ;; 0x43fe1000
        STR      R0,[R1, #+0]
//   37   PTD15_O = 0;
        LDR.N    R1,??DataTable2_6  ;; 0x43fe183c
        STR      R0,[R1, #+0]
//   38   PTE26_O = 0;
        LDR.N    R1,??DataTable2_7  ;; 0x43fe2068
        STR      R0,[R1, #+0]
//   39 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   40 void Led_Off()
//   41 {
//   42   PTA17_O = 1;
Led_Off:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_4  ;; 0x43fe0044
        STR      R0,[R1, #+0]
//   43   PTC0_O = 1;
        LDR.N    R1,??DataTable2_5  ;; 0x43fe1000
        STR      R0,[R1, #+0]
//   44   PTD15_O = 1;
        LDR.N    R1,??DataTable2_6  ;; 0x43fe183c
        STR      R0,[R1, #+0]
//   45   PTE26_O = 1;
        LDR.N    R1,??DataTable2_7  ;; 0x43fe2068
        STR      R0,[R1, #+0]
//   46 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     led_init_struct_a17

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x43fe0044

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     0x43fe1000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x43fe183c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x43fe2068

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//  80 bytes in section .bss
// 236 bytes in section .text
// 
// 236 bytes of CODE memory
//  80 bytes of DATA memory
//
//Errors: none
//Warnings: none
