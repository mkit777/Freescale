///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      09/Jun/2018  07:35:30
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\core.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWD910.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\core.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\core.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Img_Data
        EXTERN LCD_CLS
        EXTERN LCD_P6x8Str
        EXTERN Led_Off
        EXTERN Led_On
        EXTERN Motor_Drive
        EXTERN QD_Interval
        EXTERN Server_Drive
        EXTERN Show_Img
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_i2f
        EXTERN abs
        EXTERN sprintf

        PUBLIC Check_Stop_Line
        PUBLIC Dir_Kd
        PUBLIC Dir_Ki
        PUBLIC Dir_Kp
        PUBLIC Direction_Control
        PUBLIC Direction_Control_Out
        PUBLIC Direction_Error
        PUBLIC Direction_Error_Last
        PUBLIC Direction_Error_Last2
        PUBLIC Error
        PUBLIC Error_Hang
        PUBLIC Error_Last
        PUBLIC Error_count0
        PUBLIC Error_count1
        PUBLIC Error_count2
        PUBLIC Error_count3
        PUBLIC Get_Bound_Qian
        PUBLIC Img_Handler
        PUBLIC LEFT_Flag
        PUBLIC Left_Bound
        PUBLIC MID_LINE
        PUBLIC Mid_Bound
        PUBLIC No_Bound
        PUBLIC RIGHT_Flag
        PUBLIC Right_Bound
        PUBLIC Show_Num
        PUBLIC Spe_Kd
        PUBLIC Spe_Ki
        PUBLIC Spe_Kp
        PUBLIC Spe_nD
        PUBLIC Spe_nI
        PUBLIC Spe_nI_Last
        PUBLIC Spe_nP
        PUBLIC Speed_Control
        PUBLIC Speed_Control_Out
        PUBLIC Speed_Error
        PUBLIC Speed_Error_Last
        PUBLIC Speed_Flag
        PUBLIC Speed_Set
        PUBLIC YUZHI
        PUBLIC check_left_bound
        PUBLIC check_right_bound
        PUBLIC count
        PUBLIC has_right_bound
        PUBLIC i
        PUBLIC j
        PUBLIC judge_road_type
        PUBLIC left_bottom_index
        PUBLIC left_index
        PUBLIC lft01_index
        PUBLIC point
        PUBLIC point_max
        PUBLIC ret
        PUBLIC right_bottom_index
        PUBLIC right_index
        PUBLIC road_type
        PUBLIC scan_hang
        PUBLIC should_send
        PUBLIC should_stop
        PUBLIC stop_line_count
        PUBLIC value_hang

// D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\core.c
//    1 #include "include.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//    3 uint8 should_send=0;
should_send:
        DS8 1
//    4 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    5 void Img_Handler(void)
//    6 {
Img_Handler:
        PUSH     {R7,LR}
//    7   Show_Img();
        BL       Show_Img
//    8   if(should_send==1)Show_Num();
        LDR.W    R0,??DataTable17
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??Img_Handler_0
        POP      {R0,LR}
        B.N      Show_Num
//    9 }
??Img_Handler_0:
        POP      {R0,PC}          ;; return
//   10 
//   11 int YUZHI=120;
//   12 void Error_count0();
//   13 void Error_count1();
//   14 void Error_count2();
//   15 void Error_count3();
//   16 void check_right_bound();
//   17 void check_left_bound();

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   18 int Left_Bound[51] = {0};
Left_Bound:
        DS8 204

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   19 int Right_Bound[51] = {0};
Right_Bound:
        DS8 204
//   20 int Error = 0;
//   21 int Error_Last = 0;
//   22 int MID_LINE=H/2;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   23 int right_index=0;
right_index:
        DS8 4
//   24 int left_index=0;
left_index:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   25 int right_bottom_index=0;
right_bottom_index:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   26 int left_bottom_index=0;
left_bottom_index:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   27 int lft01_index=0;
lft01_index:
        DS8 4
//   28 uint8 count=0;
//   29 uint8 LEFT_Flag = 1;
//   30 uint8 RIGHT_Flag = 1;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   31 int Error_Hang[51]={0}; //@@@@@
Error_Hang:
        DS8 204
//   32 int16 Mid_Bound[51]={0}; //@@@@@
//   33 uint8 No_Bound=0;
//   34 uint8 road_type=0;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   35 int has_right_bound=0;
has_right_bound:
        DS8 4
//   36 int i,j;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
//   37 int point,point_max;
point:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
        DATA
point_max:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
count:
        DC8 0
road_type:
        DC8 0
//   38 /*************************************************************************
//   39 * @@@@@Get_Bound_Qian
//   40 * @@@@@@@@@@@
//   41 * @@@@@value_hang  @@@
//   42 * @@@@@Error       @@
//   43 *************************************************************************/
//   44 uint8 scan_hang=50;
//   45 uint8 value_hang=70; 
//   46 uint8 should_stop=0;
should_stop:
        DC8 0
//   47 uint8 stop_line_count=0;
stop_line_count:
        DC8 0
Mid_Bound:
        DC16 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
YUZHI:
        DC32 120
Error:
        DC32 0
Error_Last:
        DC32 0
MID_LINE:
        DC32 158
i:
        DC8 0, 0, 0, 0

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
LEFT_Flag:
        DC8 1
RIGHT_Flag:
        DC8 1
No_Bound:
        DC8 0
scan_hang:
        DC8 50
value_hang:
        DC8 70
        DC8 0, 0, 0
j:
        DC8 0, 0, 0, 0
//   48 #define stop_row 70

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   49 void Check_Stop_Line(void)
//   50 {
Check_Stop_Line:
        PUSH     {R3-R5}
//   51   //@@@@@
//   52   int up_dpwn_count=0;
        MOVS     R1,#+0
//   53   for(i=H/2;i>10;i--)
        LDR.W    R0,??DataTable17_1
        MOVS     R2,#+158
        STR      R2,[R0, #+124]
        B.N      ??Check_Stop_Line_0
//   54   {
//   55     //@@@@
//   56     if(Img_Data[stop_row][i+1]>YUZHI&&Img_Data[stop_row][i]>YUZHI && Img_Data[stop_row][i-1]<YUZHI && Img_Data[stop_row][i-2]<YUZHI)
??Check_Stop_Line_1:
        LDR.W    R3,??DataTable17_2
        ADD      R3,R3,R2
        MOVW     R4,#+22118
        ADD      R3,R3,R4
        LDR      R4,[R0, #+108]
        LDRB     R5,[R3, #+3]
        CMP      R4,R5
        BGE.N    ??Check_Stop_Line_2
        LDRB     R5,[R3, #+2]
        CMP      R4,R5
        BGE.N    ??Check_Stop_Line_2
        LDRB     R5,[R3, #+1]
        CMP      R5,R4
        BGE.N    ??Check_Stop_Line_2
        LDRB     R3,[R3, #+0]
        CMP      R3,R4
        BGE.N    ??Check_Stop_Line_2
//   57     {
//   58       up_dpwn_count++; 
        ADDS     R1,R1,#+1
//   59       if(up_dpwn_count>8)
        CMP      R1,#+9
        BGE.N    ??Check_Stop_Line_3
//   60       {
//   61         stop_line_count++;
//   62         return;
//   63       }
//   64     }
//   65   }  
??Check_Stop_Line_2:
        SUBS     R2,R2,#+1
        STR      R2,[R0, #+124]
??Check_Stop_Line_0:
        LDR      R2,[R0, #+124]
        CMP      R2,#+11
        BGE.N    ??Check_Stop_Line_1
//   66   for(i=H/2;i<H-10;i++)
        MOVS     R2,#+158
        STR      R2,[R0, #+124]
??Check_Stop_Line_4:
        LDR      R3,[R0, #+124]
        CMP      R3,#+306
        BGE.N    ??Check_Stop_Line_5
//   67   {
//   68     //@@@@
//   69     if(Img_Data[stop_row][i-1]<YUZHI && Img_Data[stop_row][i]<YUZHI && Img_Data[stop_row][i+1]>YUZHI && Img_Data[stop_row][i+2]>YUZHI)
        LDR.W    R2,??DataTable17_2
        ADD      R2,R2,R3
        MOVW     R4,#+22119
        ADD      R4,R2,R4
        LDR      R2,[R0, #+108]
        LDRB     R5,[R4, #+0]
        CMP      R5,R2
        BGE.N    ??Check_Stop_Line_6
        LDRB     R5,[R4, #+1]
        CMP      R5,R2
        BGE.N    ??Check_Stop_Line_6
        LDRB     R5,[R4, #+2]
        CMP      R2,R5
        BGE.N    ??Check_Stop_Line_6
        LDRB     R4,[R4, #+3]
        CMP      R2,R4
        BGE.N    ??Check_Stop_Line_6
//   70     {
//   71       up_dpwn_count++; 
        ADDS     R1,R1,#+1
//   72       if(up_dpwn_count>8)
        CMP      R1,#+9
        BGE.N    ??Check_Stop_Line_3
??Check_Stop_Line_6:
        ADDS     R3,R3,#+1
        STR      R3,[R0, #+124]
        B.N      ??Check_Stop_Line_4
//   73       {
//   74         stop_line_count++;
??Check_Stop_Line_3:
        LDRB     R1,[R0, #+3]
        ADDS     R1,R1,#+1
        STRB     R1,[R0, #+3]
//   75         return;
//   76       }
//   77     }
//   78   }
//   79 }
??Check_Stop_Line_5:
        POP      {R0,R4,R5}
        BX       LR               ;; return
//   80 
//   81 

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   82 void Get_Bound_Qian(void)      
//   83 {
Get_Bound_Qian:
        PUSH     {R2-R10,LR}
//   84   Led_On();
        BL       Led_On
//   85   count=0;
        LDR.W    R4,??DataTable17_1
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
//   86   No_Bound=0;  
        LDR.W    R5,??DataTable17_3
        STRB     R0,[R5, #+2]
//   87   Check_Stop_Line();
        BL       Check_Stop_Line
//   88   if(stop_line_count>2) should_stop=1;
        LDRB     R0,[R4, #+3]
        CMP      R0,#+2
        BLE.N    ??Get_Bound_Qian_1
        MOVS     R0,#+1
        STRB     R0,[R4, #+2]
//   89   if(Img_Data[value_hang][H/2] > YUZHI)
??Get_Bound_Qian_1:
        LDRB     R2,[R5, #+4]
        LDR      R3,[R4, #+108]
        MOV      R6,#+316
        LDR.W    R7,??DataTable17_2
        ADD      R0,R7,#+158
        SMULBB   R1,R6,R2
        LDRB     R0,[R0, R1]
        CMP      R3,R0
        BGE.W    ??Get_Bound_Qian_2
//   90   {	
//   91     for(i=value_hang; i>=value_hang-scan_hang; i--)
        STR      R2,[R4, #+124]
        B.N      ??Get_Bound_Qian_3
??Get_Bound_Qian_4:
        SUB      R12,R12,#+1
        STR      R12,[R4, #+124]
??Get_Bound_Qian_3:
        LDR      R12,[R4, #+124]
        LDRB     R0,[R5, #+3]
        SUBS     R0,R2,R0
        CMP      R12,R0
        BLT.W    ??Get_Bound_Qian_5
//   92     {	
//   93       /****@@@@@****/
//   94       for(j=H/2; j>1; j--)
        MOVS     R0,#+158
        STR      R0,[R5, #+8]
        B.N      ??Get_Bound_Qian_6
??Get_Bound_Qian_7:
        SUBS     R0,R0,#+1
        STR      R0,[R5, #+8]
??Get_Bound_Qian_6:
        LDR      R0,[R5, #+8]
        CMP      R0,#+1
        BLE.N    ??Get_Bound_Qian_8
//   95       {
//   96         if((Img_Data[i][j+1] > YUZHI) && (Img_Data[i][j] < YUZHI)&& (Img_Data[i][j-1] < YUZHI))
        MUL      R1,R6,R12
        ADD      R1,R7,R1
        ADD      LR,R1,R0
        LDRB     R8,[LR, #+1]
        CMP      R3,R8
        BGE.N    ??Get_Bound_Qian_7
        LDRB     R1,[R1, R0]
        CMP      R1,R3
        BGE.N    ??Get_Bound_Qian_7
        LDRB     R1,[LR, #-1]
        CMP      R1,R3
        BGE.N    ??Get_Bound_Qian_7
//   97         {
//   98           Left_Bound[count] = j+1;
        ADDS     R1,R0,#+1
        LDR.W    LR,??DataTable17_4
        LDRB     R8,[R4, #+0]
        STR      R1,[LR, R8, LSL #+2]
//   99           LEFT_Flag = 1;
        MOVS     R1,#+1
        STRB     R1,[R5, #+0]
//  100           break;
//  101         }
//  102       }
//  103       /****@@@@@@@****/
//  104       if(j <= 1) 
??Get_Bound_Qian_8:
        LDRB     LR,[R4, #+0]
        MOV      R8,LR
        CMP      R0,#+1
        BGT.N    ??Get_Bound_Qian_9
//  105       {
//  106         Left_Bound[count] = 1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable17_4
        STR      R0,[R1, R8, LSL #+2]
//  107         LEFT_Flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R5, #+0]
//  108       }
//  109       
//  110       /****@@@@@****/
//  111       for(j=H/2;j<H-2;j++)
??Get_Bound_Qian_9:
        MOVS     R0,#+158
        STR      R0,[R5, #+8]
        B.N      ??Get_Bound_Qian_10
??Get_Bound_Qian_11:
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+8]
??Get_Bound_Qian_10:
        LDR      R0,[R5, #+8]
        CMP      R0,#+314
        BGE.N    ??Get_Bound_Qian_12
//  112       {
//  113         if((Img_Data[i][j-1] > YUZHI)  && (Img_Data[i][j] <YUZHI)&& (Img_Data[i][j+1] < YUZHI))
        MUL      R1,R6,R12
        ADD      R1,R7,R1
        ADD      R9,R1,R0
        LDRB     R10,[R9, #-1]
        CMP      R3,R10
        BGE.N    ??Get_Bound_Qian_11
        LDRB     R1,[R1, R0]
        CMP      R1,R3
        BGE.N    ??Get_Bound_Qian_11
        LDRB     R1,[R9, #+1]
        CMP      R1,R3
        BGE.N    ??Get_Bound_Qian_11
//  114         {
//  115           Right_Bound[count] = j-1;
        SUBS     R1,R0,#+1
        LDR.W    R9,??DataTable17_5
        STR      R1,[R9, R8, LSL #+2]
//  116           RIGHT_Flag = 1;
        MOVS     R1,#+1
        STRB     R1,[R5, #+1]
//  117           break;
//  118         }
//  119       }
//  120       /****@@@@@@@****/
//  121       if(j >= H-2) 
??Get_Bound_Qian_12:
        LDR.W    R9,??DataTable17_5
        CMP      R0,#+314
        BLT.N    ??Get_Bound_Qian_13
//  122       {
//  123         Right_Bound[count] = H-2;
        MOV      R0,#+314
        STR      R0,[R9, R8, LSL #+2]
//  124         RIGHT_Flag = 0;
        MOVS     R0,#+0
        STRB     R0,[R5, #+1]
//  125       }
//  126       
//  127       
//  128       
//  129       /****@@@@@@@@@****/
//  130       if(((LEFT_Flag == 1) && (RIGHT_Flag == 0)))
??Get_Bound_Qian_13:
        LDRB     R0,[R5, #+1]
        LDRB     R1,[R5, #+0]
        MOV      R10,R1
        CMP      R10,#+1
        BNE.N    ??Get_Bound_Qian_14
        CMP      R0,#+0
        BNE.N    ??Get_Bound_Qian_14
//  131       {
//  132         Right_Bound[count] = H+Left_Bound[count];
        LDR.W    R10,??DataTable17_4
        LDR      R10,[R10, R8, LSL #+2]
        ADD      R10,R10,#+316
        STR      R10,[R9, R8, LSL #+2]
//  133       }
//  134       if(((LEFT_Flag == 0) && (RIGHT_Flag == 1)))
??Get_Bound_Qian_14:
        CMP      R1,#+0
        BNE.N    ??Get_Bound_Qian_15
        MOV      R10,R0
        CMP      R10,#+1
        BNE.N    ??Get_Bound_Qian_15
//  135       {
//  136         Left_Bound[count] = -H+Right_Bound[count]; 
        LDR      R0,[R9, R8, LSL #+2]
        SUB      R0,R0,#+316
        LDR.W    R1,??DataTable17_4
        STR      R0,[R1, R8, LSL #+2]
        B.N      ??Get_Bound_Qian_16
//  137       }
//  138       
//  139       /*******@@@@@@@****/
//  140       else if((LEFT_Flag == 0) && (RIGHT_Flag == 0)) 
??Get_Bound_Qian_15:
        ORRS     R0,R0,R1
        BNE.N    ??Get_Bound_Qian_16
//  141       {
//  142         Left_Bound[count]=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable17_4
        STR      R0,[R1, R8, LSL #+2]
//  143         Right_Bound[count]=H-1;
        MOVW     R0,#+315
        STR      R0,[R9, R8, LSL #+2]
//  144         No_Bound++;
        LDRB     R0,[R5, #+2]
        ADDS     R0,R0,#+1
        STRB     R0,[R5, #+2]
//  145       } 
//  146       
//  147       Mid_Bound[count]=(Right_Bound[count] + Left_Bound[count])/2;
??Get_Bound_Qian_16:
        LDR      R1,[R9, R8, LSL #+2]
        LDR.W    R0,??DataTable17_4
        LDR      R0,[R0, R8, LSL #+2]
        ADDS     R1,R0,R1
        ADD      R1,R1,R1, LSR #+31
        ASRS     R1,R1,#+1
        ADDS     R0,R4,#+4
        STRH     R1,[R0, R8, LSL #+1]
//  148       
//  149       count++;             //@@@@@@count+1
        ADD      LR,LR,#+1
        STRB     LR,[R4, #+0]
//  150       
//  151       if(Img_Data[i][H/2] <YUZHI)
        MUL      R0,R6,R12
        ADD      R0,R7,R0
        LDRB     R0,[R0, #+158]
        CMP      R0,R3
        BGE.W    ??Get_Bound_Qian_4
//  152       {
//  153         break;
//  154       }
//  155     }
//  156     
//  157     /*****************@@@@*************************/
//  158     check_right_bound();
??Get_Bound_Qian_5:
        BL       check_right_bound
//  159     check_left_bound() ;
        BL       check_left_bound
//  160     judge_road_type();
        BL       judge_road_type
//  161     
//  162     /****************@@@@@@@*************************/
//  163     if(count>6)  
        LDRB     R0,[R4, #+0]
        CMP      R0,#+7
        BLT.N    ??Get_Bound_Qian_2
//  164     {
//  165       switch(road_type)
        LDRB     R0,[R4, #+1]
        CMP      R0,#+3
        BHI.N    ??Get_Bound_Qian_17
        TBB      [PC, R0]
        DATA
??Get_Bound_Qian_0:
        DC8      0x2,0x5,0x8,0xB
        THUMB
//  166       {
//  167         case 0: Error_count0();break;
??Get_Bound_Qian_18:
        BL       Error_count0
        B.N      ??Get_Bound_Qian_17
//  168         case 1: Error_count1();break;
??Get_Bound_Qian_19:
        BL       Error_count1
        B.N      ??Get_Bound_Qian_17
//  169         case 2: Error_count2();break;
??Get_Bound_Qian_20:
        BL       Error_count2
        B.N      ??Get_Bound_Qian_17
//  170         case 3: Error_count3();break;
??Get_Bound_Qian_21:
        BL       Error_count3
//  171       }
//  172       Error_Last = Error;
??Get_Bound_Qian_17:
        LDR      R0,[R4, #+112]
        STR      R0,[R4, #+116]
        B.N      ??Get_Bound_Qian_22
//  173     }
//  174     else
//  175     {
//  176       Error = Error_Last;
//  177     }
//  178   }
//  179   else
//  180   {
//  181     Error = Error_Last;
??Get_Bound_Qian_2:
        LDR      R0,[R4, #+116]
        STR      R0,[R4, #+112]
//  182   }
//  183   
//  184   //Speed_Control();
//  185   Direction_Control();     //@@@@ 
??Get_Bound_Qian_22:
        BL       Direction_Control
//  186   Led_Off();
        POP      {R0,R1,R4-R10,LR}
        B.W      Led_Off
//  187 }
//  188 
//  189 
//  190 
//  191 
//  192 /****************************************/
//  193 /*@@@@@@@@@@@@1@@@@0  
//  194 /**************************************/
//  195 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  196 void check_right_bound()
//  197 {
check_right_bound:
        PUSH     {R4}
//  198   right_index=0;
        LDR.N    R0,??DataTable17_6
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
//  199   for(i=0;i<count-3;i++)
        LDR.N    R1,??DataTable17_1
        MOVS     R2,#+0
        STR      R2,[R1, #+124]
        B.N      ??check_right_bound_0
??check_right_bound_1:
        ADDS     R2,R2,#+1
        STR      R2,[R1, #+124]
??check_right_bound_0:
        LDR      R2,[R1, #+124]
        LDRB     R3,[R1, #+0]
        SUBS     R3,R3,#+3
        CMP      R2,R3
        BGE.N    ??check_right_bound_2
//  200   {
//  201     if(Right_Bound[i+1] - Right_Bound[i] < -10)
        LDR.N    R3,??DataTable17_5
        ADD      R4,R3,R2, LSL #+2
        LDR      R4,[R4, #+4]
        LDR      R3,[R3, R2, LSL #+2]
        SUBS     R4,R4,R3
        CMN      R4,#+10
        BGE.N    ??check_right_bound_1
//  202     {
//  203       right_index = i;
        STR      R2,[R0, #+0]
//  204       break;
//  205     }
//  206   }
//  207 }
??check_right_bound_2:
        POP      {R4}
        BX       LR               ;; return
//  208 
//  209 
//  210 /****************************************/
//  211 /*@@@@@@@@@@@@@@
//  212 /**************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  213 void check_left_bound() 
//  214 {
check_left_bound:
        PUSH     {R4}
//  215   left_index=0;
        LDR.N    R0,??DataTable17_6
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
//  216   for(i=0;i<count-3;i++)
        LDR.N    R1,??DataTable17_1
        MOVS     R2,#+0
        STR      R2,[R1, #+124]
        B.N      ??check_left_bound_0
??check_left_bound_1:
        ADDS     R2,R2,#+1
        STR      R2,[R1, #+124]
??check_left_bound_0:
        LDR      R2,[R1, #+124]
        LDRB     R3,[R1, #+0]
        SUBS     R3,R3,#+3
        CMP      R2,R3
        BGE.N    ??check_left_bound_2
//  217   {
//  218     if(Left_Bound[i+1] - Left_Bound[i] > 10)
        LDR.N    R3,??DataTable17_4
        ADDS     R4,R3,#+4
        LDR      R4,[R4, R2, LSL #+2]
        LDR      R3,[R3, R2, LSL #+2]
        SUBS     R4,R4,R3
        CMP      R4,#+11
        BLT.N    ??check_left_bound_1
//  219     {
//  220       left_index = i;
        STR      R2,[R0, #+4]
//  221       break;
//  222     }
//  223   }
//  224 }
??check_left_bound_2:
        POP      {R4}
        BX       LR               ;; return
//  225 
//  226 
//  227 /****************************************/
//  228 /*@@@@@@@@@@@@@@
//  229 /**************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  230 void judge_road_type()
//  231 {
//  232   if(right_index==0 && left_index==0) road_type = 0;
judge_road_type:
        LDR.N    R2,??DataTable17_6
        LDR      R0,[R2, #+0]
        LDR      R1,[R2, #+4]
        ORRS     R0,R1,R0
        BEQ.N    ??judge_road_type_0
//  233   else if (right_index=0 && left_index!=0) road_type=1;
        MOVS     R0,#+0
        STR      R0,[R2, #+0]
//  234   else if (right_index!=0 && left_index==0) road_type=2;
//  235   else road_type=0;
??judge_road_type_0:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable17_1
        STRB     R0,[R1, #+1]
//  236   //road_type=3; 
//  237 }
        BX       LR               ;; return
//  238 
//  239 // @@@@@@@@@@30@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  240 void Error_count0(void)
//  241 {
Error_count0:
        PUSH     {R3-R7,LR}
//  242   int cc=0;
        MOVS     R5,#+0
//  243   float sum=0;
        MOV      R6,R5
//  244   for(i=0;i<count;i++)
        LDR.N    R4,??DataTable17_1
        MOV      R0,R5
        STR      R0,[R4, #+124]
??Error_count0_0:
        LDR      R7,[R4, #+124]
        LDRB     R0,[R4, #+0]
        CMP      R7,R0
        BGE.N    ??Error_count0_1
//  245   {
//  246     cc++;
        ADDS     R5,R5,#+1
//  247     sum+=(Mid_Bound[i]-MID_LINE);
        ADD      R0,R4,R7, LSL #+1
        LDRSH    R0,[R0, #+4]
        LDR      R1,[R4, #+120]
        SUBS     R0,R0,R1
        BL       __aeabi_i2f
        MOV      R1,R6
        BL       __aeabi_fadd
        MOV      R6,R0
//  248     if(i>30) break;
        CMP      R7,#+31
        BGE.N    ??Error_count0_1
//  249   }
        ADDS     R7,R7,#+1
        STR      R7,[R4, #+124]
        B.N      ??Error_count0_0
//  250   Error=(int)sum/cc*2;
??Error_count0_1:
        MOV      R0,R6
        BL       __aeabi_f2iz
        SDIV     R0,R0,R5
        LSLS     R0,R0,#+1
        STR      R0,[R4, #+112]
//  251 }
        POP      {R0,R4-R7,PC}    ;; return
//  252 
//  253 // @@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  254 void Error_count1() // @@@@@@@@@@@
//  255 {
//  256   Error=(int) Mid_Bound[right_index+1]-MID_LINE;
//  257   Error=0;
Error_count1:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable17_1
        STR      R0,[R1, #+112]
//  258 }
        BX       LR               ;; return
//  259 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  260 void Error_count2()
//  261 {
//  262   Error=(int) Mid_Bound[left_index+1]-MID_LINE;
//  263   Error=0;
Error_count2:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable17_1
        STR      R0,[R1, #+112]
//  264 }
        BX       LR               ;; return
//  265 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  266 void Error_count3()
//  267 {
Error_count3:
        PUSH     {R3-R7,LR}
//  268   float sum=0;
        MOVS     R5,#+0
//  269   for(i=0;i<left_index-1&&i<count;i++)
        LDR.N    R4,??DataTable17_1
        MOV      R0,R5
        STR      R0,[R4, #+124]
??Error_count3_0:
        LDRB     R7,[R4, #+0]
        LDR      R6,[R4, #+124]
        LDR.N    R0,??DataTable17_6
        LDR      R0,[R0, #+4]
        SUBS     R0,R0,#+1
        CMP      R6,R0
        BGE.N    ??Error_count3_1
        CMP      R6,R7
        BGE.N    ??Error_count3_1
//  270   {
//  271     sum += Left_Bound[i] - MID_LINE + i;
        LDR.N    R0,??DataTable17_4
        LDR      R0,[R0, R6, LSL #+2]
        LDR      R1,[R4, #+120]
        SUBS     R0,R0,R1
        ADDS     R0,R6,R0
        BL       __aeabi_i2f
        MOV      R1,R5
        BL       __aeabi_fadd
        MOV      R5,R0
//  272   }
        ADDS     R6,R6,#+1
        STR      R6,[R4, #+124]
        B.N      ??Error_count3_0
//  273   Error = (int)sum/count;
??Error_count3_1:
        MOV      R0,R5
        BL       __aeabi_f2iz
        SDIV     R0,R0,R7
        STR      R0,[R4, #+112]
//  274 
//  275 }
        POP      {R0,R4-R7,PC}    ;; return
//  276 
//  277 /*************************************************************************
//  278 * @@@@@Direction_Control
//  279 * @@@@@@@@@
//  280 * @@@@@Dir_Kp     @@@@@@
//  281 Dir_Kd     @@@@@@
//  282 * @@@@@@
//  283 *************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(2)
        DATA
//  284 uint8 Dir_Kp=1;
Dir_Kp:
        DC8 1
//  285 uint8 Dir_Ki=1;
Dir_Ki:
        DC8 1
//  286 uint8 Dir_Kd=0;
Dir_Kd:
        DC8 0
        DC8 0
//  287 int16 Direction_Error;
Direction_Error:
        DC8 0, 0
//  288 int16 Direction_Error_Last;
Direction_Error_Last:
        DC8 0, 0
//  289 int16 Direction_Error_Last2 ;
Direction_Error_Last2:
        DC8 0, 0
        DC8 0, 0
//  290 int Direction_Control_Out = 0;
Direction_Control_Out:
        DC32 0
//  291 int ret;
ret:
        DC8 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  292 void Direction_Control(void)
//  293 {
Direction_Control:
        PUSH     {R3-R6}
//  294   
//  295   int16 Dir_nP = 0;
//  296   int16 Dir_nI = 0;
//  297   int16 Dir_nD = 0;
//  298   
//  299   Direction_Error_Last2 =Direction_Error_Last;
        LDR.N    R1,??DataTable17_7
        LDRSH    R2,[R1, #+6]
        STRH     R2,[R1, #+8]
//  300   Direction_Error_Last = Direction_Error;
        LDRSH    R3,[R1, #+4]
        STRH     R3,[R1, #+6]
//  301   Direction_Error =Error; 
        LDR.N    R0,??DataTable17_1
        LDR      R0,[R0, #+112]
        STRH     R0,[R1, #+4]
//  302   
//  303   
//  304   //@@@
//  305   Dir_nP = Dir_Kp*(Direction_Error-Direction_Error_Last);    //@@@@@@@
//  306   Dir_nI = Dir_Ki*Direction_Error;                         //@@@@@@@
//  307   Dir_nD = Dir_Kd*(Direction_Error-2*Direction_Error_Last+Direction_Error_Last2);  //@@@@@@@
//  308   
//  309   
//  310   /****@@@@@@@****/
//  311   ret = (Dir_nP+Dir_nD+Dir_nI);
        LDRSH    R4,[R1, #+4]
        LDRB     R5,[R1, #+0]
        SUBS     R0,R4,R3
        MULS     R5,R0,R5
        LDRB     R6,[R1, #+2]
        SUB      R0,R4,R3, LSL #+1
        ADDS     R0,R0,R2
        MULS     R6,R0,R6
        SXTH     R6,R6
        SXTAH    R0,R6,R5
        LDRB     R2,[R1, #+1]
        SMULBB   R4,R4,R2
        SXTAH    R0,R0,R4
        STR      R0,[R1, #+16]
//  312   Direction_Control_Out =  730+ret; 
        ADDW     R0,R0,#+730
        STR      R0,[R1, #+12]
//  313   Server_Drive(Direction_Control_Out);
        POP      {R1,R4-R6}
        B.W      Server_Drive
//  314   
//  315 }
//  316 
//  317 /*************************************************************************
//  318 * @@@@@Speed_Control
//  319 * @@@@@@@@@@@@@@@PID@@
//  320 * @@@@@Speed_Set  @@@@
//  321             Spe_Kp     @@@@@@
//  322             Spe_Ki     @@@@@@
//  323             Spe_Kd     @@@@@@
//  324 * @@@@@@
//  325 *************************************************************************/

        SECTION `.data`:DATA:REORDER:NOROOT(1)
        DATA
//  326 uint8 Spe_Kp = 4;
Spe_Kp:
        DC8 4
//  327 uint8 Spe_Ki = 1;
Spe_Ki:
        DC8 1
//  328 uint8 Spe_Kd = 0;
Spe_Kd:
        DC8 0
        DC8 0
//  329 
//  330 int16 Speed_Control_Out=0;
Speed_Control_Out:
        DC16 0
//  331 int16 Speed_Set=100;
Speed_Set:
        DC16 100
//  332 int16 Speed_Error = 0;
Speed_Error:
        DC16 0
//  333 
//  334 int16 Spe_nP = 0;
Spe_nP:
        DC16 0
//  335 int16 Spe_nI = 0;
Spe_nI:
        DC16 0
//  336 int16 Spe_nD= 0;
Spe_nD:
        DC16 0
//  337 int16 Spe_nI_Last=0;
Spe_nI_Last:
        DC16 0
//  338 int16 Speed_Error_Last = 0;  
Speed_Error_Last:
        DC16 0

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
        DATA
//  339 int8 Speed_Flag = 0;
Speed_Flag:
        DS8 1
//  340 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  341 void Speed_Control()
//  342 { 
Speed_Control:
        PUSH     {R4-R6,LR}
//  343   int8 delt_error= abs(Error-Error_Last);
        LDR.N    R5,??DataTable17_1
        LDR      R0,[R5, #+112]
        LDR      R1,[R5, #+116]
        SUBS     R0,R0,R1
        BL       abs
        MOV      R6,R0
//  344   if(should_stop==1)Speed_Set=0;
        LDR.N    R4,??DataTable17_8
        LDRB     R0,[R5, #+2]
        CMP      R0,#+1
        BNE.N    ??Speed_Control_0
        MOVS     R0,#+0
        STRH     R0,[R4, #+6]
        B.N      ??Speed_Control_1
//  345   /*else if(abs(Error)<10 && delt_error<5 && QD_Interval>150)
//  346   {
//  347     Speed_Set=175;
//  348   }
//  349   else if(abs(Error)<20 && delt_error<10 && QD_Interval>130)
//  350   {
//  351     Speed_Set=155;
//  352   }*/
//  353   else if(abs(Error)<40 && delt_error<10)
??Speed_Control_0:
        LDR      R0,[R5, #+112]
        BL       abs
        CMP      R0,#+40
        BGE.N    ??Speed_Control_2
        SXTB     R6,R6
        CMP      R6,#+10
        BGE.N    ??Speed_Control_2
//  354   {
//  355     Speed_Set=190;
        MOVS     R0,#+190
        STRH     R0,[R4, #+6]
        B.N      ??Speed_Control_1
//  356   }
//  357   else{
//  358     Speed_Set=100;
??Speed_Control_2:
        MOVS     R0,#+100
        STRH     R0,[R4, #+6]
//  359   }
//  360    
//  361   /****@@@-@@@****/
//  362    Speed_Error = Speed_Set-QD_Interval;
??Speed_Control_1:
        LDRH     R0,[R4, #+6]
        LDR.N    R1,??DataTable17_9
        LDR      R3,[R1, #+0]
        SUBS     R3,R0,R3
        STRH     R3,[R4, #+8]
//  363 
//  364   
//  365   /****@@@@@@@****/
//  366    Spe_nP = Spe_Kp*Speed_Error;
        LDRB     R0,[R4, #+0]
        SMULBB   R1,R0,R3
        STRH     R1,[R4, #+10]
//  367   
//  368   /****@@@@@@@****/
//  369     Spe_nI = Spe_Ki*Speed_Error;
//  370     Spe_nI= Spe_nI_Last+Spe_nI;
        LDRH     R0,[R4, #+16]
        LDRB     R2,[R4, #+1]
        SMLABB   R0,R2,R3,R0
        STRH     R0,[R4, #+12]
//  371     Spe_nI_Last = Spe_nI;
        STRH     R0,[R4, #+16]
//  372   
//  373   /****@@@@@@@****/
//  374     Spe_nD = Spe_Kd*(Speed_Error-Speed_Error_Last);
        LDRB     R2,[R4, #+2]
        LDRH     R5,[R4, #+18]
        SUBS     R5,R3,R5
        SMULBB   R2,R2,R5
        STRH     R2,[R4, #+14]
//  375     Speed_Error_Last = Speed_Error;
        STRH     R3,[R4, #+18]
//  376   
//  377   
//  378   
//  379   /****@@@@@@@****/
//  380   if(Spe_nI > Spe_nI_MAX)
        SXTH     R0,R0
        MOVW     R3,#+2001
        CMP      R0,R3
        BLT.N    ??Speed_Control_3
//  381     Spe_nI = Spe_nI_MAX;
        MOV      R3,#+2000
        STRH     R3,[R4, #+12]
//  382   if(Spe_nI < Spe_nI_MIN)
??Speed_Control_3:
        LDRSH    R3,[R4, #+12]
        CMN      R3,#+1800
        BGE.N    ??Speed_Control_4
//  383     Spe_nI= Spe_nI_MIN;  
        LDR.N    R3,??DataTable17_10  ;; 0xfffff8f8
        STRH     R3,[R4, #+12]
//  384   if(Spe_nI_Last > Spe_nI_Last_MAX)
??Speed_Control_4:
        MOVW     R3,#+1801
        CMP      R0,R3
        BLT.N    ??Speed_Control_5
//  385     Spe_nI_Last = Spe_nI_Last_MAX;
        MOV      R0,#+1800
        STRH     R0,[R4, #+16]
//  386   if(Spe_nI_Last< Spe_nI_Last_MIN)
??Speed_Control_5:
        LDRSH    R0,[R4, #+16]
        CMN      R0,#+1600
        BGE.N    ??Speed_Control_6
//  387     Spe_nI_Last = Spe_nI_Last_MIN;
        LDR.N    R0,??DataTable17_11  ;; 0xfffff9c0
        STRH     R0,[R4, #+16]
//  388  
//  389   /****@@@@@@@****/  
//  390   Speed_Control_Out = (Spe_nP+Spe_nI+Spe_nD);
??Speed_Control_6:
        LDRH     R0,[R4, #+12]
        ADDS     R1,R0,R1
        ADDS     R1,R2,R1
        STRH     R1,[R4, #+4]
//  391   
//  392   if(Speed_Control_Out > Speed_Control_Out_MAX)
        SXTH     R1,R1
        MOVW     R0,#+2201
        CMP      R1,R0
        BLT.N    ??Speed_Control_7
//  393     Speed_Control_Out = Speed_Control_Out_MAX;
        MOVW     R0,#+2200
        STRH     R0,[R4, #+4]
        B.N      ??Speed_Control_8
//  394   else if(Speed_Control_Out < Speed_Control_Out_MIN)
??Speed_Control_7:
        CMN      R1,#+2000
        BGE.N    ??Speed_Control_8
//  395     Speed_Control_Out = Speed_Control_Out_MIN;
        LDR.N    R0,??DataTable17_12  ;; 0xfffff830
        STRH     R0,[R4, #+4]
//  396   //Speed_Control_Out*=8;
//  397   Motor_Drive((int16)(Speed_Control_Out));
??Speed_Control_8:
        LDRSH    R0,[R4, #+4]
        POP      {R4-R6,LR}
        B.W      Motor_Drive
//  398   
//  399 }
//  400 
//  401 
//  402 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  403 void Show_Num(void)
//  404 {
Show_Num:
        PUSH     {R3-R5,LR}
        SUB      SP,SP,#+80
//  405   LCD_CLS();
        BL       LCD_CLS
//  406   char error[15];
//  407   char set[15];
//  408   char speed[15];
//  409   char out[15];
//  410   char stop[15];
//  411   sprintf(error, "Error:%d", Error);
        LDR.N    R4,??DataTable17_1
        LDR      R2,[R4, #+112]
        ADR.W    R1,?_0
        ADD      R0,SP,#+64
        BL       sprintf
//  412   sprintf(set, "SpeedSet:%d", Speed_Set);
        LDR.N    R5,??DataTable17_8
        LDRSH    R2,[R5, #+6]
        ADR.W    R1,?_1
        ADD      R0,SP,#+48
        BL       sprintf
//  413   sprintf(speed, "Speed:%d", QD_Interval);
        LDR.N    R0,??DataTable17_9
        LDR      R2,[R0, #+0]
        ADR.W    R1,?_2
        ADD      R0,SP,#+32
        BL       sprintf
//  414   sprintf(out, "Out:%d", Speed_Control_Out); 
        LDRSH    R2,[R5, #+4]
        ADR.W    R1,?_3
        ADD      R0,SP,#+16
        BL       sprintf
//  415   sprintf(stop, "Stop:%d", should_stop); 
        LDRB     R2,[R4, #+2]
        ADR.W    R1,?_4
        MOV      R0,SP
        BL       sprintf
//  416   LCD_P6x8Str(0, 0, error);
        ADD      R2,SP,#+64
        MOVS     R1,#+0
        MOV      R0,R1
        BL       LCD_P6x8Str
//  417   LCD_P6x8Str(0, 1, set);
        ADD      R2,SP,#+48
        MOVS     R1,#+1
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  418   LCD_P6x8Str(0, 2, speed);
        ADD      R2,SP,#+32
        MOVS     R1,#+2
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  419   LCD_P6x8Str(0, 3, out);
        ADD      R2,SP,#+16
        MOVS     R1,#+3
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  420   LCD_P6x8Str(0, 4, stop);
        MOV      R2,SP
        MOVS     R1,#+4
        MOVS     R0,#+0
        BL       LCD_P6x8Str
//  421 }
        ADD      SP,SP,#+84
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     should_send

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_1:
        DC32     count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_2:
        DC32     Img_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_3:
        DC32     LEFT_Flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_4:
        DC32     Left_Bound

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_5:
        DC32     Right_Bound

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_6:
        DC32     right_index

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_7:
        DC32     Dir_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_8:
        DC32     Spe_Kp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_9:
        DC32     QD_Interval

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_10:
        DC32     0xfffff8f8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_11:
        DC32     0xfffff9c0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_12:
        DC32     0xfffff830

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
?_0:
        DC8 "Error:%d"
        DC8 0, 0, 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
?_1:
        DC8 "SpeedSet:%d"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
?_2:
        DC8 "Speed:%d"
        DC8 0, 0, 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
?_3:
        DC8 "Out:%d"
        DC8 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
?_4:
        DC8 "Stop:%d"

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  422 
// 
//   646 bytes in section .bss
//   180 bytes in section .data
// 1 452 bytes in section .text
// 
// 1 452 bytes of CODE memory
//   826 bytes of DATA memory
//
//Errors: none
//Warnings: 14
