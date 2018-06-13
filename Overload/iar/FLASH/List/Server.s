///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      07/Apr/2018  20:23:05
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Server.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EW7C9.tmp
//        (E:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Server.c -D
//        LPLD_K60 -D USE_K60DZ10 -lCN
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\FLASH\List -lB
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\FLASH\List -o
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\FLASH\Obj
//        --no_cse --no_unroll --no_inline --no_code_motion --no_tbaa
//        --no_clustering --no_scheduling --debug --endian=little
//        --cpu=Cortex-M4 -e --fpu=None --dlib_config "D:\Program Files\IAR
//        Systems\Embedded Workbench 8.0\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\app\ -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\CPU\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\common\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\HW\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\FatFs\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\FatFs\option\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\common\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\driver\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\descriptor\
//        -I
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\..\..\..\lib\USB\class\
//        -On -I "D:\Program Files\IAR Systems\Embedded Workbench
//        8.0\arm\CMSIS\Include\" -D ARM_MATH_CM4)
//    Locale       =  C
//    List file    =  
//        E:\workspace\LPLD_OSKinetis_V3\project\Overload\iar\FLASH\List\Server.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN __aeabi_memcpy4

        PUBLIC Server_Drive
        PUBLIC Server_Init
        PUBLIC server_PWM_init_struct

// E:\workspace\LPLD_OSKinetis_V3\project\Overload\app\Server.c
//    1 #include "include.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    2 FTM_InitTypeDef server_PWM_init_struct;
server_PWM_init_struct:
        DS8 28
//    3 
//    4 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    5 void Server_Init(void)
//    6 {
Server_Init:
        PUSH     {R5-R7,LR}
//    7   server_PWM_init_struct.FTM_Ftmx=FTM2;
        LDR.N    R0,??DataTable1  ;; 0x400b8000
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
//    8   server_PWM_init_struct.FTM_Mode=FTM_MODE_PWM;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_1
        STRB     R0,[R1, #+4]
//    9   server_PWM_init_struct.FTM_PwmFreq=Server_PWM_FREQ; // 50Hz
        MOVS     R0,#+50
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+8]
//   10   
//   11   LPLD_FTM_Init(server_PWM_init_struct);
        LDR.N    R1,??DataTable1_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   12   // FTM2 ch1@@@@@@,B19@@@@@@
//   13   LPLD_FTM_PWM_Enable(FTM2,FTM_Ch1,Server_PWM_MIDDLE,PTB19,ALIGN_LEFT); 
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+51
        MOV      R2,#+800
        MOVS     R1,#+1
        LDR.N    R0,??DataTable1  ;; 0x400b8000
        BL       LPLD_FTM_PWM_Enable
//   14   Server_Drive(Server_PWM_MIDDLE);
        MOV      R0,#+800
        BL       Server_Drive
//   15 }
        POP      {R0-R2,PC}       ;; return
//   16 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void Server_Drive(uint32 error)
//   18 {
Server_Drive:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   19   int duty = Server_PWM_MIDDLE + error*10;
        MOVS     R5,#+10
        MUL      R5,R5,R4
        ADDS     R5,R5,#+800
//   20   /*@@@@@@@@*/
//   21   LPLD_FTM_PWM_ChangeDuty(FTM2,FTM_Ch1,duty);
        MOVS     R2,R5
        MOVS     R1,#+1
        LDR.N    R0,??DataTable1  ;; 0x400b8000
        BL       LPLD_FTM_PWM_ChangeDuty
//   22 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     server_PWM_init_struct

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
//  28 bytes in section .bss
// 100 bytes in section .text
// 
// 100 bytes of CODE memory
//  28 bytes of DATA memory
//
//Errors: none
//Warnings: none
