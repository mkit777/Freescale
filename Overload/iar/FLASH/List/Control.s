///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Jun/2018  18:03:57
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Control.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWD774.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Control.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\Control.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FTM_GetCounter
        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN LPLD_FTM_QD_Enable
        EXTERN LPLD_PIT_EnableIrq
        EXTERN LPLD_PIT_Init
        EXTERN Speed_Control
        EXTERN __aeabi_memcpy4
        EXTERN abs

        PUBLIC Encoder_Init
        PUBLIC Encoder_PIT_Init
        PUBLIC Encoder_PWM_Init
        PUBLIC Last_QD_Result
        PUBLIC Motor_Drive
        PUBLIC Motor_Init
        PUBLIC QD_Interval
        PUBLIC QD_Result
        PUBLIC Server_Drive
        PUBLIC Server_Init
        PUBLIC encoder_pit_init_struct
        PUBLIC encoder_pwm_init_struct
        PUBLIC motor_PWM_init_struct
        PUBLIC pit_isr0
        PUBLIC server_PWM_init_struct

// D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\Control.c
//    1 #include "include.h"
//    2 
//    3 
//    4 /*  @@@@   */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//    5 FTM_InitTypeDef motor_PWM_init_struct;
motor_PWM_init_struct:
        DS8 28

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    6 void Motor_Init(void)
//    7 {
Motor_Init:
        PUSH     {R0-R4,LR}
//    8   motor_PWM_init_struct.FTM_Ftmx=FTM0;
        LDR.N    R1,??DataTable4
        LDR.N    R4,??DataTable4_1  ;; 0x40038000
        STR      R4,[R1, #+0]
//    9   motor_PWM_init_struct.FTM_Mode= FTM_MODE_PWM;
        MOVS     R0,#+1
        STRB     R0,[R1, #+4]
//   10   motor_PWM_init_struct.FTM_PwmFreq=10000;
        MOVW     R0,#+10000
        STR      R0,[R1, #+8]
//   11   LPLD_FTM_Init(motor_PWM_init_struct);
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   12   
//   13   LPLD_FTM_PWM_Enable(FTM0, FTM_Ch0, 0,PTC1,ALIGN_LEFT);
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+61
        MOVS     R2,#+0
        MOV      R1,R2
        MOV      R0,R4
        BL       LPLD_FTM_PWM_Enable
//   14   LPLD_FTM_PWM_Enable(FTM0, FTM_Ch1, 480,PTC2,ALIGN_LEFT);
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+62
        MOV      R2,#+480
        MOVS     R1,#+1
        MOV      R0,R4
        BL       LPLD_FTM_PWM_Enable
//   15   Motor_Drive(1300);
        MOVW     R0,#+1300
        ADD      SP,SP,#+16
        POP      {R4,LR}
        REQUIRE Motor_Drive
        ;; // Fall through to label Motor_Drive
//   16 }
//   17 
//   18 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   19 void Motor_Drive(int16 duty)
//   20 {
Motor_Drive:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
//   21   /*@@and@@@@@@@@*/
//   22   if(duty>=0)
        BMI.N    ??Motor_Drive_0
//   23   {
//   24     duty=duty>1700?1700:duty;
        MOVW     R1,#+1701
        CMP      R0,R1
        BLT.N    ??Motor_Drive_1
        MOVW     R4,#+1700
//   25     LPLD_FTM_PWM_ChangeDuty(FTM0,FTM_Ch0,0);
??Motor_Drive_1:
        LDR.N    R5,??DataTable4_1  ;; 0x40038000
        MOVS     R2,#+0
        MOV      R1,R2
        MOV      R0,R5
        BL       LPLD_FTM_PWM_ChangeDuty
//   26     LPLD_FTM_PWM_ChangeDuty(FTM0,FTM_Ch1,duty);  
        MOV      R2,R4
        MOVS     R1,#+1
        MOV      R0,R5
        POP      {R3-R5,LR}
        B.W      LPLD_FTM_PWM_ChangeDuty
//   27   }else{
//   28     duty=abs(duty);
??Motor_Drive_0:
        BL       abs
        MOV      R2,R0
//   29     duty=duty>2000?2000:duty;
        SXTH     R0,R0
        MOVW     R1,#+2001
        CMP      R0,R1
        BLT.N    ??Motor_Drive_2
        MOV      R2,#+2000
//   30     LPLD_FTM_PWM_ChangeDuty(FTM0,FTM_Ch0,duty);
??Motor_Drive_2:
        LDR.N    R4,??DataTable4_1  ;; 0x40038000
        SXTH     R2,R2
        MOVS     R1,#+0
        MOV      R0,R4
        BL       LPLD_FTM_PWM_ChangeDuty
//   31     LPLD_FTM_PWM_ChangeDuty(FTM0,FTM_Ch1,0);  
        MOVS     R2,#+0
        MOVS     R1,#+1
        MOV      R0,R4
        POP      {R3-R5,LR}
        B.W      LPLD_FTM_PWM_ChangeDuty
//   32   }
//   33 }
//   34 
//   35 
//   36 /*  @@@@   */

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   37 FTM_InitTypeDef server_PWM_init_struct;
server_PWM_init_struct:
        DS8 28

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   38 void Server_Init(void)
//   39 {
Server_Init:
        PUSH     {R1-R5,LR}
//   40   server_PWM_init_struct.FTM_Ftmx=FTM2;
        LDR.N    R1,??DataTable4_2
        LDR.N    R4,??DataTable4_3  ;; 0x400b8000
        STR      R4,[R1, #+0]
//   41   server_PWM_init_struct.FTM_Mode=FTM_MODE_PWM;
        MOVS     R0,#+1
        STRB     R0,[R1, #+4]
//   42   server_PWM_init_struct.FTM_PwmFreq=Server_PWM_FREQ;
        MOVS     R0,#+50
        STR      R0,[R1, #+8]
//   43   
//   44   LPLD_FTM_Init(server_PWM_init_struct);
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   45   // FTM2 ch1@@@@@@,B19@@@@@@
//   46   LPLD_FTM_PWM_Enable(FTM2,FTM_Ch1,Server_PWM_MIDDLE,PTB19,ALIGN_LEFT); 
        MOVW     R5,#+730
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+51
        MOV      R2,R5
        MOVS     R1,#+1
        MOV      R0,R4
        BL       LPLD_FTM_PWM_Enable
//   47   Server_Drive(Server_PWM_MIDDLE);
        MOV      R0,R5
        POP      {R1-R5,LR}
        REQUIRE Server_Drive
        ;; // Fall through to label Server_Drive
//   48 }
//   49 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   50 void Server_Drive(uint32 duty)
//   51 {
Server_Drive:
        MOV      R2,R0
//   52   if(duty < Server_PWM_LEFT_MAX) duty = Server_PWM_LEFT_MAX;
        CMP      R2,#+490
        BCS.N    ??Server_Drive_0
        MOV      R2,#+490
//   53   if(duty > Server_PWM_RIGHT_MAX) duty = Server_PWM_RIGHT_MAX;
??Server_Drive_0:
        MOVW     R0,#+970
        CMP      R2,R0
        BLS.N    ??Server_Drive_1
        MOV      R2,R0
//   54   LPLD_FTM_PWM_ChangeDuty(FTM2,FTM_Ch1,duty);
??Server_Drive_1:
        MOVS     R1,#+1
        LDR.N    R0,??DataTable4_3  ;; 0x400b8000
        B.W      LPLD_FTM_PWM_ChangeDuty
//   55 }
//   56 
//   57 /*  @@@@@   */
//   58 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   59 int32 QD_Interval=0;
QD_Interval:
        DS8 4
//   60 int32 QD_Result=0;
QD_Result:
        DS8 4
//   61 int32 Last_QD_Result=0;
Last_QD_Result:
        DS8 4
//   62 
//   63 // FTM@@@

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   64 FTM_InitTypeDef encoder_pwm_init_struct;
encoder_pwm_init_struct:
        DS8 28

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   65 void Encoder_PWM_Init(void)
//   66 {
Encoder_PWM_Init:
        PUSH     {R0-R4,LR}
//   67   encoder_pwm_init_struct.FTM_Ftmx = FTM1;
        LDR.N    R1,??DataTable4_4
        LDR.N    R4,??DataTable4_5  ;; 0x40039000
        STR      R4,[R1, #+0]
//   68   encoder_pwm_init_struct.FTM_Mode = FTM_MODE_QD;
        MOVS     R0,#+4
        STRB     R0,[R1, #+4]
//   69   encoder_pwm_init_struct.FTM_QdMode = QD_MODE_CNTDIR;
        MOVS     R0,#+8
        STRB     R0,[R1, #+18]
//   70   LPLD_FTM_Init(encoder_pwm_init_struct);
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   71   LPLD_FTM_QD_Enable(FTM1,PTA12,PTA13);
        MOVS     R2,#+13
        MOVS     R1,#+12
        MOV      R0,R4
        ADD      SP,SP,#+16
        POP      {R4,LR}
        B.W      LPLD_FTM_QD_Enable
//   72 }
//   73 
//   74 //@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   75 void pit_isr0(void)
//   76 {
pit_isr0:
        PUSH     {R4,LR}
//   77   QD_Result  =  LPLD_FTM_GetCounter(FTM1);
        LDR.N    R4,??DataTable4_6
        LDR.N    R0,??DataTable4_5  ;; 0x40039000
        BL       LPLD_FTM_GetCounter
        STR      R0,[R4, #+4]
//   78   
//   79   if(QD_Result<=Last_QD_Result)
        LDR      R0,[R4, #+8]
        LDR      R1,[R4, #+4]
        CMP      R0,R1
        BLT.N    ??pit_isr0_0
//   80   {
//   81     QD_Interval = Last_QD_Result - QD_Result;
        SUBS     R0,R0,R1
        STR      R0,[R4, #+0]
        B.N      ??pit_isr0_1
//   82   }
//   83   else
//   84   {
//   85     QD_Interval = 65535 + Last_QD_Result-QD_Result;
??pit_isr0_0:
        ADD      R0,R0,#+65280
        ADDS     R0,R0,#+255
        SUBS     R0,R0,R1
        STR      R0,[R4, #+0]
//   86   }
//   87   Last_QD_Result = QD_Result;
??pit_isr0_1:
        STR      R1,[R4, #+8]
//   88   Speed_Control();
        POP      {R4,LR}
        B.W      Speed_Control
//   89 }
//   90 
//   91 
//   92 // PIT@@@

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   93 PIT_InitTypeDef encoder_pit_init_struct;
encoder_pit_init_struct:
        DS8 20

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   94 void Encoder_PIT_Init(void)
//   95 {
Encoder_PIT_Init:
        PUSH     {R2-R4,LR}
//   96   encoder_pit_init_struct.PIT_Pitx = PIT0;
        LDR.N    R4,??DataTable4_7
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
//   97   encoder_pit_init_struct.PIT_PeriodMs = 10;
        MOVS     R0,#+10
        STR      R0,[R4, #+8]
//   98   encoder_pit_init_struct.PIT_Isr = pit_isr0;
        LDR.N    R0,??DataTable4_8
        STR      R0,[R4, #+16]
//   99   LPLD_PIT_Init(encoder_pit_init_struct);
        MOV      R1,R4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_Init
//  100   LPLD_PIT_EnableIrq(encoder_pit_init_struct);
        MOV      R1,R4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_EnableIrq
//  101 }
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     motor_PWM_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     server_PWM_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x400b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     encoder_pwm_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x40039000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     QD_Interval

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     encoder_pit_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     pit_isr0
//  102 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  103 void Encoder_Init(void)
//  104 {
Encoder_Init:
        PUSH     {R7,LR}
//  105   Encoder_PWM_Init();
        BL       Encoder_PWM_Init
//  106   Encoder_PIT_Init();
        POP      {R0,LR}
        B.N      Encoder_PIT_Init
//  107   
//  108 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 116 bytes in section .bss
// 452 bytes in section .text
// 
// 452 bytes of CODE memory
// 116 bytes of DATA memory
//
//Errors: none
//Warnings: 1
