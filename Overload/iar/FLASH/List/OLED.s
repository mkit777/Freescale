///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      08/Jun/2018  18:03:58
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\OLED.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EWDB60.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\OLED.c -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\OLED.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Img_Data
        EXTERN LPLD_GPIO_Init
        EXTERN YUZHI
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fmul
        EXTERN __aeabi_memcpy4

        PUBLIC Draw_BMP
        PUBLIC Draw_MyLogo
        PUBLIC F14x16
        PUBLIC F14x16_Idx
        PUBLIC F6x8
        PUBLIC F8X16
        PUBLIC LCD_CLS
        PUBLIC LCD_ClrDot
        PUBLIC LCD_DLY_ms
        PUBLIC LCD_Fill
        PUBLIC LCD_GPIO_Init
        PUBLIC LCD_Init
        PUBLIC LCD_P14x16Str
        PUBLIC LCD_P6x8Str
        PUBLIC LCD_P8x16Str
        PUBLIC LCD_Print
        PUBLIC LCD_PrintFloat
        PUBLIC LCD_PrintU16
        PUBLIC LCD_PutPixel
        PUBLIC LCD_Rectangle
        PUBLIC LCD_Set_Pos
        PUBLIC LCD_WrCmd
        PUBLIC LCD_WrDat
        PUBLIC OverLoad
        PUBLIC Show_Img
        PUBLIC Time_Delay

// D:\workspace\LPLD_OSKinetis_V3\project\Overload3\app\OLED.c
//    1 /********************************************
//    2 ����MC9S12XEP100�๦�ܿ����� 
//    3 Designed by Chiu Sir
//    4 E-mail:chiusir@163.com
//    5 �����汾:V1.1
//    6 ������:2009��4��12��
//    7 �����Ϣ�ο����е�ַ��
//    8 ���ͣ�  http://longqiu.21ic.org
//    9 �Ա��꣺http://shop36265907.taobao.com
//   10 ------------------------------------
//   11 Code Warrior 5.0
//   12 Target : MC9S12XEP100
//   13 Crystal: 16.000Mhz
//   14 busclock:16.000MHz
//   15 pllclock:32.000MHz
//   16 ============================================*/
//   17 #include "include.h"
//   18 
//   19 
//   20 
//   21 //--------@@@@@@@@------//
//   22 
//   23 //---------@@@@@@@@@@@IO@@@@--------------------//
//   24 
//   25 #define LCD_DC	PTC13_O  //C19
//   26 #define LCD_RST	PTC14_O  //C18
//   27 #define LCD_SDA	PTC15_O  //C17
//   28 #define LCD_SCL	PTC16_O  //C16 
//   29 
//   30 
//   31 
//   32 
//   33 
//   34 
//   35 #define X_WIDTH 128
//   36 #define Y_WIDTH 64
//   37 
//   38 
//   39 
//   40 
//   41 //======================================
//   42 const unsigned char F6x8[][6] =
//   43 {
//   44     { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },   // sp
//   45     { 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00 },   // !
//   46     { 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 },   // "
//   47     { 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14 },   // #
//   48     { 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12 },   // $
//   49     { 0x00, 0x62, 0x64, 0x08, 0x13, 0x23 },   // %
//   50     { 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 },   // &
//   51     { 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 },   // '
//   52     { 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00 },   // (
//   53     { 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00 },   // )
//   54     { 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 },   // *
//   55     { 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 },   // +
//   56     { 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00 },   // ,
//   57     { 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 },   // -
//   58     { 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 },   // .
//   59     { 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 },   // /
//   60     { 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E },   // 0
//   61     { 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 },   // 1
//   62     { 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 },   // 2
//   63     { 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 },   // 3
//   64     { 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 },   // 4
//   65     { 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 },   // 5
//   66     { 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 },   // 6
//   67     { 0x00, 0x01, 0x71, 0x09, 0x05, 0x03 },   // 7
//   68     { 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 },   // 8
//   69     { 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E },   // 9
//   70     { 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 },   // :
//   71     { 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 },   // ;
//   72     { 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 },   // <
//   73     { 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 },   // =
//   74     { 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 },   // >
//   75     { 0x00, 0x02, 0x01, 0x51, 0x09, 0x06 },   // ?
//   76     { 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E },   // @
//   77     { 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C },   // A
//   78     { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36 },   // B
//   79     { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 },   // C
//   80     { 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C },   // D
//   81     { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41 },   // E
//   82     { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01 },   // F
//   83     { 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A },   // G
//   84     { 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F },   // H
//   85     { 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 },   // I
//   86     { 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 },   // J
//   87     { 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 },   // K
//   88     { 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 },   // L
//   89     { 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F },   // M
//   90     { 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F },   // N
//   91     { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E },   // O
//   92     { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 },   // P
//   93     { 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E },   // Q
//   94     { 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 },   // R
//   95     { 0x00, 0x46, 0x49, 0x49, 0x49, 0x31 },   // S
//   96     { 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 },   // T
//   97     { 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F },   // U
//   98     { 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F },   // V
//   99     { 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F },   // W
//  100     { 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 },   // X
//  101     { 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 },   // Y
//  102     { 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 },   // Z
//  103     { 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 },   // [
//  104     { 0x00, 0x55, 0x2A, 0x55, 0x2A, 0x55 },   // 55
//  105     { 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 },   // ]
//  106     { 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 },   // ^
//  107     { 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 },   // _
//  108     { 0x00, 0x00, 0x01, 0x02, 0x04, 0x00 },   // '
//  109     { 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 },   // a
//  110     { 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 },   // b
//  111     { 0x00, 0x38, 0x44, 0x44, 0x44, 0x20 },   // c
//  112     { 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F },   // d
//  113     { 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 },   // e
//  114     { 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02 },   // f
//  115     { 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C },   // g
//  116     { 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 },   // h
//  117     { 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 },   // i
//  118     { 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00 },   // j
//  119     { 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00 },   // k
//  120     { 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 },   // l
//  121     { 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78 },   // m
//  122     { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 },   // n
//  123     { 0x00, 0x38, 0x44, 0x44, 0x44, 0x38 },   // o
//  124     { 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18 },   // p
//  125     { 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC },   // q
//  126     { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 },   // r
//  127     { 0x00, 0x48, 0x54, 0x54, 0x54, 0x20 },   // s
//  128     { 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 },   // t
//  129     { 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C },   // u
//  130     { 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C },   // v
//  131     { 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C },   // w
//  132     { 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 },   // x
//  133     { 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C },   // y
//  134     { 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 },   // z
//  135     { 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 }    // horiz lines
//  136 };
//  137 const unsigned char F14x16_Idx[] = 
//  138 {
//  139 	"@@@@@@@@@@@@@@@@@@@@@@@@@"
//  140 };
//  141 const unsigned char F14x16[] = {  
//  142 0x20,0x20,0x20,0x20,0xFF,0x00,0x00,0x00,0xFF,0x40,0x20,0x30,0x18,0x10,
//  143 0x30,0x18,0x08,0x04,0x7F,0x00,0x00,0x00,0x3F,0x40,0x40,0x40,0x40,0x78,//@0
//  144 0x04,0x04,0xE4,0x24,0x24,0x25,0x26,0x24,0x24,0x24,0xE4,0x06,0x04,0x00,
//  145 0x20,0x10,0x19,0x0D,0x41,0x81,0x7F,0x01,0x01,0x05,0x0D,0x38,0x10,0x00,//@1
//  146 0x10,0x10,0x10,0x10,0x10,0xFF,0x10,0xF0,0x12,0x1C,0xD0,0x10,0x10,0x10,
//  147 0x40,0x20,0x10,0x0C,0x03,0x10,0x08,0x3F,0x42,0x41,0x40,0x40,0x40,0x70,//@2
//  148 0x00,0x00,0xFE,0x84,0x84,0x84,0x84,0x82,0x82,0x82,0x82,0xC0,0x80,0x00,
//  149 0x20,0x20,0x3F,0x20,0x20,0x20,0x20,0x20,0x3F,0x20,0x20,0x20,0x30,0x20,//@3
//  150 0x00,0xFC,0x24,0x24,0xE2,0x22,0x22,0x00,0xFE,0x02,0x22,0x52,0x8E,0x02,
//  151 0x10,0x1F,0x10,0x08,0x0F,0x08,0x08,0x00,0xFF,0x00,0x08,0x08,0x10,0x0F,//@4
//  152 0x12,0x92,0x72,0xFE,0x51,0x91,0x00,0x22,0xCC,0x00,0x00,0xFF,0x00,0x00,
//  153 0x02,0x01,0x00,0xFF,0x00,0x04,0x04,0x04,0x02,0x02,0x02,0xFF,0x01,0x01,//@5
//  154 0x08,0x88,0xFF,0x48,0x28,0x00,0xC8,0x48,0x48,0x7F,0x48,0xC8,0x48,0x08,
//  155 0x41,0x80,0x7F,0x00,0x40,0x40,0x20,0x13,0x0C,0x0C,0x12,0x21,0x60,0x20,//@6
//  156 0x42,0x42,0x42,0x42,0xFE,0x42,0x42,0x42,0x42,0xFE,0x42,0x42,0x42,0x42,
//  157 0x40,0x20,0x10,0x0C,0x03,0x00,0x00,0x00,0x00,0x7F,0x00,0x00,0x00,0x00,//@7
//  158 0x10,0x3E,0x10,0x10,0xF0,0x9F,0x90,0x90,0x92,0x94,0x1C,0x10,0x10,0x10,
//  159 0x20,0x10,0x88,0x87,0x41,0x46,0x28,0x10,0x28,0x27,0x40,0xC0,0x40,0x00,//@8
//  160 0x10,0xD0,0xFF,0x50,0x90,0x00,0xFE,0x62,0xA2,0x22,0x21,0xA1,0x61,0x00,
//  161 0x03,0x00,0x7F,0x00,0x11,0x0E,0x41,0x20,0x11,0x0A,0x0E,0x31,0x60,0x20,//@9
//  162 0x14,0x13,0x92,0x7E,0x32,0x52,0x92,0x00,0x7C,0x44,0x44,0x44,0x7C,0x00,
//  163 0x01,0x01,0x00,0xFF,0x49,0x49,0x49,0x49,0x49,0x49,0xFF,0x00,0x00,0x00,//@10
//  164 0xB8,0x97,0x92,0x90,0x94,0xB8,0x10,0x00,0x7F,0x48,0x48,0x44,0x74,0x20,
//  165 0xFF,0x0A,0x0A,0x4A,0x8A,0x7F,0x00,0x00,0x3F,0x44,0x44,0x42,0x72,0x20,//@11
//  166 0x04,0x84,0xC4,0xA4,0x9C,0x87,0x84,0xF4,0x84,0x84,0x84,0x84,0x84,0x00,
//  167 0x04,0x04,0x04,0x04,0x04,0x04,0x04,0xFF,0x04,0x04,0x04,0x04,0x04,0x04,//@12
//  168 0x04,0x04,0xE4,0x25,0x26,0x34,0x2C,0x24,0x24,0x26,0xE5,0x04,0x04,0x04,
//  169 0x00,0x00,0x7F,0x25,0x25,0x25,0x25,0x25,0x25,0x25,0x7F,0x00,0x00,0x00,//@13
//  170 0x40,0x42,0xCC,0x00,0x50,0x4E,0xC8,0x48,0x7F,0xC8,0x48,0x48,0x40,0x00,
//  171 0x40,0x20,0x1F,0x20,0x48,0x46,0x41,0x40,0x40,0x47,0x48,0x48,0x4E,0x40,//@14
//  172 0x61,0x06,0xE0,0x18,0x84,0xE4,0x1C,0x84,0x65,0xBE,0x24,0xA4,0x64,0x04,
//  173 0x04,0xFF,0x00,0x01,0x00,0xFF,0x41,0x21,0x12,0x0C,0x1B,0x61,0xC0,0x40,//@15
//  174 0x00,0x00,0x00,0x7E,0x2A,0x2A,0x2A,0x2A,0x2A,0x2A,0x7E,0x00,0x00,0x00,
//  175 0x7F,0x25,0x25,0x25,0x25,0x7F,0x00,0x00,0x7F,0x25,0x25,0x25,0x25,0x7F,//@16
//  176 0x10,0x2C,0x24,0xA4,0x64,0x25,0x26,0x24,0x24,0xA4,0x24,0x34,0x2C,0x04,
//  177 0x40,0x48,0x49,0x49,0x49,0x49,0x7F,0x49,0x49,0x49,0x4B,0x48,0x40,0x40,//@17
//  178 0x21,0x86,0x70,0x00,0x7E,0x4A,0x4A,0x4A,0x4A,0x4A,0x7E,0x00,0x00,0x00,
//  179 0xFE,0x01,0x40,0x7F,0x41,0x41,0x7F,0x41,0x41,0x7F,0x41,0x41,0x7F,0x40,//@18
//  180 0x00,0xFC,0x04,0x24,0x24,0xFC,0xA5,0xA6,0xA4,0xFC,0x24,0x24,0x24,0x04,
//  181 0x60,0x1F,0x80,0x80,0x42,0x46,0x2A,0x12,0x12,0x2A,0x26,0x42,0xC0,0x40,//@19
//  182 0x10,0x10,0xFF,0x90,0x50,0x98,0x88,0x88,0xE9,0x8E,0x88,0x88,0x98,0x88,
//  183 0x42,0x81,0x7F,0x00,0x40,0x40,0x26,0x25,0x18,0x08,0x16,0x31,0x60,0x20,//@20
//  184 0x30,0xEF,0x28,0x28,0x44,0x64,0xDC,0x10,0x54,0xFF,0x54,0x54,0x7C,0x10,
//  185 0x01,0x7F,0x21,0x51,0x22,0x14,0x0F,0x14,0x25,0x3F,0x45,0x45,0x45,0x44,//@21
//  186 0x02,0x1C,0xC0,0x30,0x4C,0x30,0x0F,0x08,0xF8,0x08,0x08,0x28,0x18,0x08,
//  187 0x5E,0x43,0x20,0x20,0x10,0x08,0x04,0x03,0x01,0x06,0x08,0x30,0x60,0x20,//@22
//  188 0x00,0xF8,0x48,0x48,0x48,0x48,0xFF,0x48,0x48,0x48,0x48,0xF8,0x00,0x00,
//  189 0x00,0x0F,0x04,0x04,0x04,0x04,0x3F,0x44,0x44,0x44,0x44,0x4F,0x40,0x70,//@23
//  190 0x00,0xFE,0x02,0x42,0x42,0x42,0x42,0xFA,0x42,0x42,0x42,0x62,0x42,0x02,
//  191 0x18,0x27,0x20,0x20,0x20,0x20,0x20,0x3F,0x20,0x21,0x2E,0x24,0x20,0x20,//@24  
//  192 };
//  193 
//  194 //======================================================
//  195 // 128X64I@@@@@@[8X16]@@@
//  196 // @@@: powerint
//  197 // @  @: [8X16]@@@@@@@@@ (@@@@,@@@@)
//  198 // !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
//  199 //======================================================
//  200 const unsigned char F8X16[]=
//  201 {
//  202 	0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,// 0
//  203   0x00,0x00,0x00,0xF8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x33,0x30,0x00,0x00,0x00,//!1
//  204   0x00,0x10,0x0C,0x06,0x10,0x0C,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//"2
//  205   0x40,0xC0,0x78,0x40,0xC0,0x78,0x40,0x00,0x04,0x3F,0x04,0x04,0x3F,0x04,0x04,0x00,//#3
//  206   0x00,0x70,0x88,0xFC,0x08,0x30,0x00,0x00,0x00,0x18,0x20,0xFF,0x21,0x1E,0x00,0x00,//$4
//  207   0xF0,0x08,0xF0,0x00,0xE0,0x18,0x00,0x00,0x00,0x21,0x1C,0x03,0x1E,0x21,0x1E,0x00,//%5
//  208   0x00,0xF0,0x08,0x88,0x70,0x00,0x00,0x00,0x1E,0x21,0x23,0x24,0x19,0x27,0x21,0x10,//&6
//  209   0x10,0x16,0x0E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//'7
//  210   0x00,0x00,0x00,0xE0,0x18,0x04,0x02,0x00,0x00,0x00,0x00,0x07,0x18,0x20,0x40,0x00,//(8
//  211   0x00,0x02,0x04,0x18,0xE0,0x00,0x00,0x00,0x00,0x40,0x20,0x18,0x07,0x00,0x00,0x00,//)9
//  212   0x40,0x40,0x80,0xF0,0x80,0x40,0x40,0x00,0x02,0x02,0x01,0x0F,0x01,0x02,0x02,0x00,//*10
//  213   0x00,0x00,0x00,0xF0,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x1F,0x01,0x01,0x01,0x00,//+11
//  214   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xB0,0x70,0x00,0x00,0x00,0x00,0x00,//,12
//  215   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x01,//-13
//  216   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,0x00,0x00,//.14
//  217   0x00,0x00,0x00,0x00,0x80,0x60,0x18,0x04,0x00,0x60,0x18,0x06,0x01,0x00,0x00,0x00,///15
//  218   0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x0F,0x10,0x20,0x20,0x10,0x0F,0x00,//016
//  219   0x00,0x10,0x10,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//117
//  220   0x00,0x70,0x08,0x08,0x08,0x88,0x70,0x00,0x00,0x30,0x28,0x24,0x22,0x21,0x30,0x00,//218
//  221   0x00,0x30,0x08,0x88,0x88,0x48,0x30,0x00,0x00,0x18,0x20,0x20,0x20,0x11,0x0E,0x00,//319
//  222   0x00,0x00,0xC0,0x20,0x10,0xF8,0x00,0x00,0x00,0x07,0x04,0x24,0x24,0x3F,0x24,0x00,//420
//  223   0x00,0xF8,0x08,0x88,0x88,0x08,0x08,0x00,0x00,0x19,0x21,0x20,0x20,0x11,0x0E,0x00,//521
//  224   0x00,0xE0,0x10,0x88,0x88,0x18,0x00,0x00,0x00,0x0F,0x11,0x20,0x20,0x11,0x0E,0x00,//622
//  225   0x00,0x38,0x08,0x08,0xC8,0x38,0x08,0x00,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x00,//723
//  226   0x00,0x70,0x88,0x08,0x08,0x88,0x70,0x00,0x00,0x1C,0x22,0x21,0x21,0x22,0x1C,0x00,//824
//  227   0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x00,0x31,0x22,0x22,0x11,0x0F,0x00,//925
//  228   0x00,0x00,0x00,0xC0,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,//:26
//  229   0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x60,0x00,0x00,0x00,0x00,//;27
//  230   0x00,0x00,0x80,0x40,0x20,0x10,0x08,0x00,0x00,0x01,0x02,0x04,0x08,0x10,0x20,0x00,//<28
//  231   0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x00,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x00,//=29
//  232   0x00,0x08,0x10,0x20,0x40,0x80,0x00,0x00,0x00,0x20,0x10,0x08,0x04,0x02,0x01,0x00,//>30
//  233   0x00,0x70,0x48,0x08,0x08,0x08,0xF0,0x00,0x00,0x00,0x00,0x30,0x36,0x01,0x00,0x00,//?31
//  234   0xC0,0x30,0xC8,0x28,0xE8,0x10,0xE0,0x00,0x07,0x18,0x27,0x24,0x23,0x14,0x0B,0x00,//@32
//  235   0x00,0x00,0xC0,0x38,0xE0,0x00,0x00,0x00,0x20,0x3C,0x23,0x02,0x02,0x27,0x38,0x20,//A33
//  236   0x08,0xF8,0x88,0x88,0x88,0x70,0x00,0x00,0x20,0x3F,0x20,0x20,0x20,0x11,0x0E,0x00,//B34
//  237   0xC0,0x30,0x08,0x08,0x08,0x08,0x38,0x00,0x07,0x18,0x20,0x20,0x20,0x10,0x08,0x00,//C35
//  238   0x08,0xF8,0x08,0x08,0x08,0x10,0xE0,0x00,0x20,0x3F,0x20,0x20,0x20,0x10,0x0F,0x00,//D36
//  239   0x08,0xF8,0x88,0x88,0xE8,0x08,0x10,0x00,0x20,0x3F,0x20,0x20,0x23,0x20,0x18,0x00,//E37
//  240   0x08,0xF8,0x88,0x88,0xE8,0x08,0x10,0x00,0x20,0x3F,0x20,0x00,0x03,0x00,0x00,0x00,//F38
//  241   0xC0,0x30,0x08,0x08,0x08,0x38,0x00,0x00,0x07,0x18,0x20,0x20,0x22,0x1E,0x02,0x00,//G39
//  242   0x08,0xF8,0x08,0x00,0x00,0x08,0xF8,0x08,0x20,0x3F,0x21,0x01,0x01,0x21,0x3F,0x20,//H40
//  243   0x00,0x08,0x08,0xF8,0x08,0x08,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//I41
//  244   0x00,0x00,0x08,0x08,0xF8,0x08,0x08,0x00,0xC0,0x80,0x80,0x80,0x7F,0x00,0x00,0x00,//J42
//  245   0x08,0xF8,0x88,0xC0,0x28,0x18,0x08,0x00,0x20,0x3F,0x20,0x01,0x26,0x38,0x20,0x00,//K43
//  246   0x08,0xF8,0x08,0x00,0x00,0x00,0x00,0x00,0x20,0x3F,0x20,0x20,0x20,0x20,0x30,0x00,//L44
//  247   0x08,0xF8,0xF8,0x00,0xF8,0xF8,0x08,0x00,0x20,0x3F,0x00,0x3F,0x00,0x3F,0x20,0x00,//M45
//  248   0x08,0xF8,0x30,0xC0,0x00,0x08,0xF8,0x08,0x20,0x3F,0x20,0x00,0x07,0x18,0x3F,0x00,//N46
//  249   0xE0,0x10,0x08,0x08,0x08,0x10,0xE0,0x00,0x0F,0x10,0x20,0x20,0x20,0x10,0x0F,0x00,//O47
//  250   0x08,0xF8,0x08,0x08,0x08,0x08,0xF0,0x00,0x20,0x3F,0x21,0x01,0x01,0x01,0x00,0x00,//P48
//  251   0xE0,0x10,0x08,0x08,0x08,0x10,0xE0,0x00,0x0F,0x18,0x24,0x24,0x38,0x50,0x4F,0x00,//Q49
//  252   0x08,0xF8,0x88,0x88,0x88,0x88,0x70,0x00,0x20,0x3F,0x20,0x00,0x03,0x0C,0x30,0x20,//R50
//  253   0x00,0x70,0x88,0x08,0x08,0x08,0x38,0x00,0x00,0x38,0x20,0x21,0x21,0x22,0x1C,0x00,//S51
//  254   0x18,0x08,0x08,0xF8,0x08,0x08,0x18,0x00,0x00,0x00,0x20,0x3F,0x20,0x00,0x00,0x00,//T52
//  255   0x08,0xF8,0x08,0x00,0x00,0x08,0xF8,0x08,0x00,0x1F,0x20,0x20,0x20,0x20,0x1F,0x00,//U53
//  256   0x08,0x78,0x88,0x00,0x00,0xC8,0x38,0x08,0x00,0x00,0x07,0x38,0x0E,0x01,0x00,0x00,//V54
//  257   0xF8,0x08,0x00,0xF8,0x00,0x08,0xF8,0x00,0x03,0x3C,0x07,0x00,0x07,0x3C,0x03,0x00,//W55
//  258   0x08,0x18,0x68,0x80,0x80,0x68,0x18,0x08,0x20,0x30,0x2C,0x03,0x03,0x2C,0x30,0x20,//X56
//  259   0x08,0x38,0xC8,0x00,0xC8,0x38,0x08,0x00,0x00,0x00,0x20,0x3F,0x20,0x00,0x00,0x00,//Y57
//  260   0x10,0x08,0x08,0x08,0xC8,0x38,0x08,0x00,0x20,0x38,0x26,0x21,0x20,0x20,0x18,0x00,//Z58
//  261   0x00,0x00,0x00,0xFE,0x02,0x02,0x02,0x00,0x00,0x00,0x00,0x7F,0x40,0x40,0x40,0x00,//[59
//  262   0x00,0x0C,0x30,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x06,0x38,0xC0,0x00,//\60
//  263   0x00,0x02,0x02,0x02,0xFE,0x00,0x00,0x00,0x00,0x40,0x40,0x40,0x7F,0x00,0x00,0x00,//]61
//  264   0x00,0x00,0x04,0x02,0x02,0x02,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//^62
//  265   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,//_63
//  266   0x00,0x02,0x02,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//`64
//  267   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x19,0x24,0x22,0x22,0x22,0x3F,0x20,//a65
//  268   0x08,0xF8,0x00,0x80,0x80,0x00,0x00,0x00,0x00,0x3F,0x11,0x20,0x20,0x11,0x0E,0x00,//b66
//  269   0x00,0x00,0x00,0x80,0x80,0x80,0x00,0x00,0x00,0x0E,0x11,0x20,0x20,0x20,0x11,0x00,//c67
//  270   0x00,0x00,0x00,0x80,0x80,0x88,0xF8,0x00,0x00,0x0E,0x11,0x20,0x20,0x10,0x3F,0x20,//d68
//  271   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x1F,0x22,0x22,0x22,0x22,0x13,0x00,//e69
//  272   0x00,0x80,0x80,0xF0,0x88,0x88,0x88,0x18,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//f70
//  273   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x6B,0x94,0x94,0x94,0x93,0x60,0x00,//g71
//  274   0x08,0xF8,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x3F,0x21,0x00,0x00,0x20,0x3F,0x20,//h72
//  275   0x00,0x80,0x98,0x98,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//i73
//  276   0x00,0x00,0x00,0x80,0x98,0x98,0x00,0x00,0x00,0xC0,0x80,0x80,0x80,0x7F,0x00,0x00,//j74
//  277   0x08,0xF8,0x00,0x00,0x80,0x80,0x80,0x00,0x20,0x3F,0x24,0x02,0x2D,0x30,0x20,0x00,//k75
//  278   0x00,0x08,0x08,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//l76
//  279   0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x20,0x3F,0x20,0x00,0x3F,0x20,0x00,0x3F,//m77
//  280   0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x3F,0x21,0x00,0x00,0x20,0x3F,0x20,//n78
//  281   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x1F,0x20,0x20,0x20,0x20,0x1F,0x00,//o79
//  282   0x80,0x80,0x00,0x80,0x80,0x00,0x00,0x00,0x80,0xFF,0xA1,0x20,0x20,0x11,0x0E,0x00,//p80
//  283   0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x0E,0x11,0x20,0x20,0xA0,0xFF,0x80,//q81
//  284   0x80,0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x20,0x20,0x3F,0x21,0x20,0x00,0x01,0x00,//r82
//  285   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x33,0x24,0x24,0x24,0x24,0x19,0x00,//s83
//  286   0x00,0x80,0x80,0xE0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x1F,0x20,0x20,0x00,0x00,//t84
//  287   0x80,0x80,0x00,0x00,0x00,0x80,0x80,0x00,0x00,0x1F,0x20,0x20,0x20,0x10,0x3F,0x20,//u85
//  288   0x80,0x80,0x80,0x00,0x00,0x80,0x80,0x80,0x00,0x01,0x0E,0x30,0x08,0x06,0x01,0x00,//v86
//  289   0x80,0x80,0x00,0x80,0x00,0x80,0x80,0x80,0x0F,0x30,0x0C,0x03,0x0C,0x30,0x0F,0x00,//w87
//  290   0x00,0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x31,0x2E,0x0E,0x31,0x20,0x00,//x88
//  291   0x80,0x80,0x80,0x00,0x00,0x80,0x80,0x80,0x80,0x81,0x8E,0x70,0x18,0x06,0x01,0x00,//y89
//  292   0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x21,0x30,0x2C,0x22,0x21,0x30,0x00,//z90
//  293   0x00,0x00,0x00,0x00,0x80,0x7C,0x02,0x02,0x00,0x00,0x00,0x00,0x00,0x3F,0x40,0x40,//{91
//  294   0x00,0x00,0x00,0x00,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0x00,0x00,0x00,//|92
//  295   0x00,0x02,0x02,0x7C,0x80,0x00,0x00,0x00,0x00,0x40,0x40,0x3F,0x00,0x00,0x00,0x00,//}93
//  296   0x00,0x06,0x01,0x01,0x02,0x02,0x04,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//~94
//  297 
//  298 };
//  299 //@@@@@@@@@
//  300 const unsigned char OverLoad[1024] = {
//  301   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  302   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  303   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  304   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,
//  305   0x80,0x00,0x00,0x00,0x80,0xC0,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  306   0x00,0x00,0x00,0x80,0x80,0x80,0x80,0xC0,0xC0,0xC0,0xC0,0xC0,0xC0,0x80,
//  307   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  308   0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  309   0x00,0x00,0x00,0x00,0x60,0x60,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  310   0x00,0x00,0x00,0x00,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  311   0x00,0x18,0x1C,0x0C,0x0E,0x06,0x06,0x06,0x06,0x06,0x07,0x02,0x00,0x00,
//  312   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x00,
//  313   0x00,0x00,0x02,0x03,0x03,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,0x01,
//  314   0x01,0x01,0x03,0x07,0x0E,0x0F,0x07,0x01,0x00,0x00,0x00,0x00,0x00,0x00,
//  315   0x00,0x00,0x60,0x60,0x01,0x01,0x01,0x01,0x01,0x01,0x00,0x00,0x00,0x00,
//  316   0x01,0x03,0x07,0x06,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  317   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x00,0x00,0x00,0x00,0x00,
//  318   0x00,0x00,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  319   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x00,0x00,0x00,0x00,
//  320   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0C,0x0E,0x06,
//  321   0x07,0x03,0x03,0x03,0x66,0x6E,0x1C,0x18,0x18,0x18,0x18,0x1E,0x0F,0x03,
//  322   0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x20,
//  323   0x30,0x38,0x18,0x1C,0x0C,0x1C,0x78,0xF0,0xC0,0xE0,0x78,0x3E,0x0F,0x02,
//  324   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x08,
//  325   0x0C,0x0C,0x0E,0x06,0x06,0x06,0x06,0x06,0x07,0x03,0x03,0x07,0x3E,0xFC,
//  326   0xE0,0xC0,0xC0,0xF0,0x7E,0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  327   0x00,0x00,0x00,0x00,0x03,0x03,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  328   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xC0,0xF0,0xF8,
//  329   0xFC,0x3C,0x1E,0x0E,0x0E,0x0E,0x1E,0x1E,0x7C,0xF8,0xF8,0xE0,0x00,0x00,
//  330   0x00,0x80,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,
//  331   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00,
//  332   0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x80,0x80,0x80,
//  333   0x80,0x00,0x00,0x00,0xFE,0xFE,0xFE,0xFE,0x00,0x00,0x00,0x00,0x00,0x00,
//  334   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x00,
//  335   0x00,0x01,0x01,0x01,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x00,
//  336   0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0xFE,0xFE,
//  337   0xFE,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,
//  338   0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0xFF,0xFF,
//  339   0x00,0x00,0x00,0x01,0x0F,0x3F,0xFF,0xF8,0xC0,0x00,0x80,0xF0,0xFE,0x7F,
//  340   0x0F,0x03,0x00,0x00,0x00,0xF8,0xFE,0xFF,0xEF,0xE7,0xE3,0xE3,0xE3,0xE7,
//  341   0xFF,0xFE,0xFC,0xC0,0x00,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x06,0x07,0x03,
//  342   0x03,0x07,0x03,0x01,0x00,0x00,0xFF,0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,
//  343   0x00,0xFC,0xFE,0xFF,0x0F,0x07,0x03,0x03,0x07,0x07,0xFF,0xFF,0xFE,0xE0,
//  344   0x00,0x00,0x00,0x80,0xC3,0xC7,0xE7,0xE3,0xE3,0xE3,0xE7,0xEF,0xFF,0xFE,
//  345   0xFC,0x00,0x00,0x00,0x00,0xFC,0xFF,0xFF,0x0F,0x07,0x03,0x03,0x07,0x0E,
//  346   0xFF,0xFF,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  347   0x00,0x01,0x07,0x0F,0x1F,0x1E,0x3C,0x38,0x38,0x38,0x3C,0x3C,0x1F,0x0F,
//  348   0x0F,0x03,0x00,0x00,0xC0,0xC0,0x00,0x00,0x01,0x0F,0x3F,0x3F,0x3F,0x0F,
//  349   0x01,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x0F,0x1F,0x1E,0x3C,0x38,0x38,
//  350   0x38,0x3C,0x1C,0x1C,0x08,0x00,0x00,0x00,0x00,0x3F,0x3F,0x3F,0x3F,0x00,
//  351   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x0F,0x1F,0x3F,0x3F,0x38,0x38,
//  352   0x00,0x00,0x00,0x07,0x0F,0x1F,0x3E,0x3C,0x38,0x38,0x3C,0x3C,0x1F,0x1F,
//  353   0x0F,0x00,0x00,0x00,0x00,0x1F,0x1F,0x3F,0x38,0x38,0x38,0x38,0x18,0x1C,
//  354   0x3F,0x3F,0x3F,0x00,0x00,0x00,0x00,0x07,0x1F,0x1F,0x3E,0x3C,0x38,0x38,
//  355   0x1C,0x0E,0x3F,0x3F,0x3F,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  356   0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,0x00,0x00,0x00,
//  357   0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  358   0x00,0x00,0x00,0x00,0x00,0x0C,0x0C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  359   0x00,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x00,0x00,
//  360   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xC0,0x80,0x00,0x00,
//  361   0x00,0x00,0x00,0x00,0x00,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x0C,0x0C,
//  362   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,
//  363   0x00,0x00,0x00,0x00,0x60,0x60,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,
//  364   0x30,0x00,0x00,0x18,0x18,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  365   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  366   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x03,0x00,0x00,0x00,
//  367   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  368   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x00,0x00,
//  369   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  370   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  371   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  372   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  373   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,
//  374   0x00,0x00,/*"C:\Users\JoyC\Desktop\logo.bmp",0*/
//  375 };

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  376 void LCD_WrDat(unsigned char data)
//  377 {
//  378 	unsigned char i=8;
LCD_WrDat:
        MOVS     R1,#+8
//  379 	//LCD_CS=0;;
//  380 	LCD_DC=1;;
        LDR.W    R2,??DataTable10  ;; 0x43fe1034
        MOVS     R3,#+1
        STR      R3,[R2, #+0]
//  381   LCD_SCL=0;;
        MOVS     R3,#+0
        STR      R3,[R2, #+12]
        B.N      ??LCD_WrDat_0
//  382   //asm("nop");    
//  383   while(i--)
//  384   {
//  385     if(data&0x80){LCD_SDA=1;}
??LCD_WrDat_1:
        AND      R3,R0,#0x80
        SUBS     R3,R3,#+1
        SBCS     R3,R3,R3
        MVNS     R3,R3
        LSRS     R3,R3,#+31
        STR      R3,[R2, #+8]
//  386     else{LCD_SDA=0;}
//  387     LCD_SCL=1; 
        MOVS     R3,#+1
        STR      R3,[R2, #+12]
//  388     asm("nop");;
        nop
//  389 		//asm("nop");            
//  390     LCD_SCL=0;;    
        MOVS     R3,#+0
        STR      R3,[R2, #+12]
//  391     data<<=1;    
        LSLS     R0,R0,#+1
//  392   }
??LCD_WrDat_0:
        MOV      R3,R1
        SUBS     R1,R3,#+1
        UXTB     R3,R3
        CMP      R3,#+0
        BNE.N    ??LCD_WrDat_1
//  393 	//LCD_CS=1;
//  394 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  395 void LCD_WrCmd(unsigned char cmd)
//  396 {
//  397 	unsigned char i=8;
LCD_WrCmd:
        MOVS     R1,#+8
//  398 	
//  399 	//LCD_CS=0;;
//  400 	LCD_DC=0;;
        LDR.W    R2,??DataTable10  ;; 0x43fe1034
        MOVS     R3,#+0
        STR      R3,[R2, #+0]
//  401   LCD_SCL=0;;
        STR      R3,[R2, #+12]
        B.N      ??LCD_WrCmd_0
//  402   //asm("nop");   
//  403   while(i--)
//  404   {
//  405     if(cmd&0x80){LCD_SDA=1;}
??LCD_WrCmd_1:
        AND      R3,R0,#0x80
        SUBS     R3,R3,#+1
        SBCS     R3,R3,R3
        MVNS     R3,R3
        LSRS     R3,R3,#+31
        STR      R3,[R2, #+8]
//  406     else{LCD_SDA=0;;}
//  407     LCD_SCL=1;;
        MOVS     R3,#+1
        STR      R3,[R2, #+12]
//  408     asm("nop");;
        nop
//  409 		//asm("nop");             
//  410     LCD_SCL=0;;    
        MOVS     R3,#+0
        STR      R3,[R2, #+12]
//  411     cmd<<=1;;   
        LSLS     R0,R0,#+1
//  412   } 	
??LCD_WrCmd_0:
        MOV      R3,R1
        SUBS     R1,R3,#+1
        UXTB     R3,R3
        CMP      R3,#+0
        BNE.N    ??LCD_WrCmd_1
//  413 	//LCD_CS=1;
//  414 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  415 void LCD_Set_Pos(unsigned char x, unsigned char y)
//  416 { 
LCD_Set_Pos:
        PUSH     {R4,LR}
        MOV      R4,R0
//  417   LCD_WrCmd(0xb0+y);
        SUB      R0,R1,#+80
        UXTB     R0,R0
        BL       LCD_WrCmd
//  418   LCD_WrCmd(((x&0xf0)>>4)|0x10);
        MOV      R0,R4
        LSRS     R0,R0,#+4
        ORR      R0,R0,#0x10
        BL       LCD_WrCmd
//  419   LCD_WrCmd((x&0x0f)|0x01); 
        AND      R4,R4,#0xF
        ORR      R4,R4,#0x1
        MOV      R0,R4
        POP      {R4,LR}
        B.N      LCD_WrCmd
//  420 } 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  421 void LCD_Fill(unsigned char bmp_data)
//  422 {
LCD_Fill:
        PUSH     {R4-R6,LR}
        MOV      R4,R0
//  423 	unsigned char y,x;
//  424 	
//  425 	for(y=0;y<8;y++)
        MOVS     R5,#+0
        B.N      ??LCD_Fill_0
//  426 	{
//  427 		LCD_WrCmd(0xb0+y);
//  428 		LCD_WrCmd(0x01);
//  429 		LCD_WrCmd(0x10);
//  430 		for(x=0;x<X_WIDTH;x++)
//  431 			LCD_WrDat(bmp_data);
??LCD_Fill_1:
        MOV      R0,R4
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
??LCD_Fill_2:
        MOV      R0,R6
        UXTB     R0,R0
        CMP      R0,#+128
        BLT.N    ??LCD_Fill_1
        ADDS     R5,R5,#+1
??LCD_Fill_0:
        MOV      R0,R5
        UXTB     R0,R0
        CMP      R0,#+8
        BGE.N    ??LCD_Fill_3
        SUB      R0,R5,#+80
        UXTB     R0,R0
        BL       LCD_WrCmd
        MOVS     R0,#+1
        BL       LCD_WrCmd
        MOVS     R0,#+16
        BL       LCD_WrCmd
        MOVS     R6,#+0
        B.N      ??LCD_Fill_2
//  432 	}
//  433 }
??LCD_Fill_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  434 void LCD_CLS(void)
//  435 {
LCD_CLS:
        PUSH     {R3-R5,LR}
//  436 	unsigned char y,x;	
//  437 	for(y=0;y<8;y++)
        MOVS     R4,#+0
        B.N      ??LCD_CLS_0
//  438 	{
//  439 		LCD_WrCmd(0xb0+y);
//  440 		LCD_WrCmd(0x01);
//  441 		LCD_WrCmd(0x10); 
//  442 		for(x=0;x<X_WIDTH;x++)
//  443 			LCD_WrDat(0);
??LCD_CLS_1:
        MOVS     R0,#+0
        BL       LCD_WrDat
        ADDS     R5,R5,#+1
??LCD_CLS_2:
        MOV      R0,R5
        UXTB     R0,R0
        CMP      R0,#+128
        BLT.N    ??LCD_CLS_1
        ADDS     R4,R4,#+1
??LCD_CLS_0:
        MOV      R0,R4
        UXTB     R0,R0
        CMP      R0,#+8
        BGE.N    ??LCD_CLS_3
        SUB      R0,R4,#+80
        UXTB     R0,R0
        BL       LCD_WrCmd
        MOVS     R0,#+1
        BL       LCD_WrCmd
        MOVS     R0,#+16
        BL       LCD_WrCmd
        MOVS     R5,#+0
        B.N      ??LCD_CLS_2
//  444 	}
//  445 }
??LCD_CLS_3:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  446 void LCD_DLY_ms(unsigned int ms)
//  447 {                         
LCD_DLY_ms:
        CMP      R0,#+0
        B.N      ??LCD_DLY_ms_0
//  448   unsigned int a;
//  449   while(ms)
//  450   {
//  451     a=1335;
??LCD_DLY_ms_1:
        MOVW     R2,#+1335
//  452     while(a--);
??LCD_DLY_ms_2:
        MOV      R1,R2
        SUBS     R2,R1,#+1
        CMP      R1,#+0
        BNE.N    ??LCD_DLY_ms_2
//  453     ms--;
        SUBS     R0,R0,#+1
//  454   }
??LCD_DLY_ms_0:
        BNE.N    ??LCD_DLY_ms_1
//  455   //delayms(ms);
//  456   return;
        BX       LR               ;; return
//  457 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  458 void Time_Delay(unsigned int ms)
//  459 {
//  460 
//  461   LCD_DLY_ms(ms);
Time_Delay:
        B.N      LCD_DLY_ms
//  462 
//  463 }

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  464 void LCD_GPIO_Init(void)
//  465 {
LCD_GPIO_Init:
        PUSH     {R7,LR}
        SUB      SP,SP,#+24
//  466   GPIO_InitTypeDef oled_gpio_init_struct;
//  467   oled_gpio_init_struct.GPIO_PTx=PTC;
        LDR.W    R0,??DataTable10_1  ;; 0x400ff080
        STR      R0,[SP, #+4]
//  468   oled_gpio_init_struct.GPIO_Pins=GPIO_Pin13 |GPIO_Pin14|GPIO_Pin15|GPIO_Pin16;
        MOV      R0,#+122880
        STR      R0,[SP, #+8]
//  469   oled_gpio_init_struct.GPIO_Dir=DIR_OUTPUT;
        MOVS     R0,#+1
        STRB     R0,[SP, #+16]
//  470   oled_gpio_init_struct.GPIO_PinControl=NULL;
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
//  471   oled_gpio_init_struct.GPIO_Output=OUTPUT_L;
        STRB     R0,[SP, #+17]
//  472   LPLD_GPIO_Init(oled_gpio_init_struct);
        ADD      R1,SP,#+4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//  473 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return
//  474 
//  475 
//  476 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  477 void LCD_Init(void)        
//  478 { 
LCD_Init:
        PUSH     {R4,LR}
//  479     //-----@@@@@----//
//  480      /* GPIO_Init(PORTC,16,GPO,0);
//  481       GPIO_Init(PORTC,15,GPO,0);
//  482       GPIO_Init(PORTC,14,GPO,0);
//  483       GPIO_Init(PORTC,13,GPO,0);*/
//  484       LCD_GPIO_Init();
        BL       LCD_GPIO_Init
//  485   
//  486 	LCD_SCL=1;
        LDR.W    R4,??DataTable10_2  ;; 0x43fe1038
        MOVS     R0,#+1
        STR      R0,[R4, #+8]
//  487 	//LCD_CS=1;	//@@SLK@SS@@@@   	
//  488 	
//  489 	LCD_RST=0;
        MOVS     R0,#+0
        STR      R0,[R4, #+0]
//  490 	LCD_DLY_ms(50);
        MOVS     R0,#+50
        BL       LCD_DLY_ms
//  491 	LCD_RST=1;
        MOVS     R0,#+1
        STR      R0,[R4, #+0]
//  492 
//  493   LCD_WrCmd(0xae);//--turn off oled panel
        MOVS     R0,#+174
        BL       LCD_WrCmd
//  494   LCD_WrCmd(0x00);//---set low column address
        MOVS     R0,#+0
        BL       LCD_WrCmd
//  495   LCD_WrCmd(0x10);//---set high column address
        MOVS     R0,#+16
        BL       LCD_WrCmd
//  496   LCD_WrCmd(0x40);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
        MOVS     R0,#+64
        BL       LCD_WrCmd
//  497   LCD_WrCmd(0x81);//--set contrast control register
        MOVS     R0,#+129
        BL       LCD_WrCmd
//  498   LCD_WrCmd(0xcf); // Set SEG Output Current Brightness
        MOVS     R0,#+207
        BL       LCD_WrCmd
//  499   LCD_WrCmd(0xa1);//--Set SEG/Column Mapping     0xa0@@@@ 0xa1@@
        MOVS     R0,#+161
        BL       LCD_WrCmd
//  500   LCD_WrCmd(0xc8);//Set COM/Row Scan Direction   0xc0@@@@ 0xc8@@
        MOVS     R0,#+200
        BL       LCD_WrCmd
//  501   LCD_WrCmd(0xa6);//--set normal display
        MOVS     R0,#+166
        BL       LCD_WrCmd
//  502   LCD_WrCmd(0xa8);//--set multiplex ratio(1 to 64)
        MOVS     R0,#+168
        BL       LCD_WrCmd
//  503   LCD_WrCmd(0x3f);//--1/64 duty
        MOVS     R0,#+63
        BL       LCD_WrCmd
//  504   LCD_WrCmd(0xd3);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
        MOVS     R0,#+211
        BL       LCD_WrCmd
//  505   LCD_WrCmd(0x00);//-not offset
        MOVS     R0,#+0
        BL       LCD_WrCmd
//  506   LCD_WrCmd(0xd5);//--set display clock divide ratio/oscillator frequency
        MOVS     R0,#+213
        BL       LCD_WrCmd
//  507   LCD_WrCmd(0x80);//--set divide ratio, Set Clock as 100 Frames/Sec
        MOVS     R0,#+128
        BL       LCD_WrCmd
//  508   LCD_WrCmd(0xd9);//--set pre-charge period
        MOVS     R0,#+217
        BL       LCD_WrCmd
//  509   LCD_WrCmd(0xf1);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
        MOVS     R0,#+241
        BL       LCD_WrCmd
//  510   LCD_WrCmd(0xda);//--set com pins hardware configuration
        MOVS     R0,#+218
        BL       LCD_WrCmd
//  511   LCD_WrCmd(0x12);
        MOVS     R0,#+18
        BL       LCD_WrCmd
//  512   LCD_WrCmd(0xdb);//--set vcomh
        MOVS     R0,#+219
        BL       LCD_WrCmd
//  513   LCD_WrCmd(0x40);//Set VCOM Deselect Level
        MOVS     R0,#+64
        BL       LCD_WrCmd
//  514   LCD_WrCmd(0x20);//-Set Page Addressing Mode (0x00/0x01/0x02)
        MOVS     R0,#+32
        BL       LCD_WrCmd
//  515   LCD_WrCmd(0x02);//
        MOVS     R0,#+2
        BL       LCD_WrCmd
//  516   LCD_WrCmd(0x8d);//--set Charge Pump enable/disable
        MOVS     R0,#+141
        BL       LCD_WrCmd
//  517   LCD_WrCmd(0x14);//--set(0x10) disable
        MOVS     R0,#+20
        BL       LCD_WrCmd
//  518   LCD_WrCmd(0xa4);// Disable Entire Display On (0xa4/0xa5)
        MOVS     R0,#+164
        BL       LCD_WrCmd
//  519   LCD_WrCmd(0xa6);// Disable Inverse Display On (0xa6/a7) 
        MOVS     R0,#+166
        BL       LCD_WrCmd
//  520   LCD_WrCmd(0xaf);//--turn on oled panel
        MOVS     R0,#+175
        BL       LCD_WrCmd
//  521   LCD_Fill(0x00);  //@@@@
        MOVS     R0,#+0
        BL       LCD_Fill
//  522   LCD_Set_Pos(0,0);  
        MOVS     R1,#+0
        MOV      R0,R1
        POP      {R4,LR}
        B.N      LCD_Set_Pos
//  523 	
//  524 } 
//  525 //==============================================================
//  526 //@@@@ void LCD_PutPixel(unsigned char x,unsigned char y)
//  527 //@@@@@@@@@@@x,y@
//  528 //@@@@@@@@(x,y),x@@@0@127@y@@@0@64
//  529 //@@@@
//  530 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  531 void LCD_PutPixel(unsigned char x,unsigned char y)
//  532 {
LCD_PutPixel:
        PUSH     {R4-R6,LR}
        MOV      R4,R0
        MOV      R5,R1
//  533 	unsigned char data1;  //data1@@@@@@ 
//  534 
//  535 	LCD_Set_Pos(x,(unsigned char)(y>>3)); 
        MOV      R6,R5
        LSRS     R6,R6,#+3
        MOV      R1,R6
        BL       LCD_Set_Pos
//  536 	data1 =(unsigned char)(0x01<<(y%8)); 	
        MOVS     R0,#+1
        MOV      R1,R5
        ASRS     R1,R1,#+2
        ADD      R1,R5,R1, LSR #+29
        ASRS     R1,R1,#+3
        SUB      R5,R5,R1, LSL #+3
        LSL      R5,R0,R5
//  537 	LCD_WrCmd((unsigned char)(0xb0+(y>>3)));
        SUB      R0,R6,#+80
        UXTB     R0,R0
        BL       LCD_WrCmd
//  538 	LCD_WrCmd((unsigned char)(((x&0xf0)>>4)|0x10));
        MOV      R0,R4
        LSRS     R0,R0,#+4
        ORR      R0,R0,#0x10
        BL       LCD_WrCmd
//  539 	LCD_WrCmd((unsigned char)((x&0x0f)|0x00));
        AND      R4,R4,#0xF
        MOV      R0,R4
        BL       LCD_WrCmd
//  540 	LCD_WrDat(data1); 	 	
        MOV      R0,R5
        UXTB     R0,R0
        POP      {R4-R6,LR}
        B.N      LCD_WrDat
//  541 }
//  542 //==============================================================
//  543 //@@@@ void LCD_Rectangle(unsigned char x1,unsigned char y1,
//  544 //                   unsigned char x2,unsigned char y2,unsigned char color,unsigned char gif)
//  545 //@@@@@@@@@@@@@
//  546 //@@@@@@@@@x1,y1@,@@@@@@x2@y2@
//  547 //      @@x1@x2@@@0@127@y1@y2@@@0@63@@@@@@@
//  548 //@@@@
//  549 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  550 void LCD_Rectangle(unsigned char x1,unsigned char y1,unsigned char x2,unsigned char y2,unsigned char gif)
//  551 {
LCD_Rectangle:
        PUSH     {R3-R9,LR}
        MOV      R7,R0
        MOV      R8,R1
        MOV      R4,R2
        MOV      R5,R3
        LDR      R6,[SP, #+32]
//  552 	unsigned char n; 
//  553 		
//  554 	LCD_Set_Pos(x1,y1>>3);
        LSRS     R1,R1,#+3
        BL       LCD_Set_Pos
//  555 	for(n=x1;n<=x2;n++)
        MOV      R9,R7
        B.N      ??LCD_Rectangle_0
//  556 	{
//  557 		LCD_WrDat(0x01<<(y1%8)); 			
??LCD_Rectangle_1:
        MOV      R0,R8
        MOVS     R1,#+1
        MOV      R2,R0
        ASRS     R2,R2,#+2
        ADD      R2,R0,R2, LSR #+29
        ASRS     R2,R2,#+3
        SUB      R0,R0,R2, LSL #+3
        LSL      R0,R1,R0
        UXTB     R0,R0
        BL       LCD_WrDat
//  558 		if(gif == 1) 	LCD_DLY_ms(50);
        MOV      R0,R6
        CMP      R0,#+1
        BNE.N    ??LCD_Rectangle_2
        MOVS     R0,#+50
        BL       LCD_DLY_ms
//  559 	}  
??LCD_Rectangle_2:
        ADD      R9,R9,#+1
??LCD_Rectangle_0:
        MOV      R0,R4
        MOV      R1,R9
        UXTB     R1,R1
        CMP      R0,R1
        BCS.N    ??LCD_Rectangle_1
//  560 	LCD_Set_Pos(x1,y2>>3);
        MOV      R1,R5
        LSRS     R1,R1,#+3
        MOV      R0,R7
        BL       LCD_Set_Pos
//  561   for(n=x1;n<=x2;n++)
        B.N      ??LCD_Rectangle_3
//  562 	{
//  563 		LCD_WrDat(0x01<<(y2%8)); 			
??LCD_Rectangle_4:
        MOV      R0,R5
        MOVS     R1,#+1
        MOV      R2,R0
        ASRS     R2,R2,#+2
        ADD      R2,R0,R2, LSR #+29
        ASRS     R2,R2,#+3
        SUB      R0,R0,R2, LSL #+3
        LSL      R0,R1,R0
        UXTB     R0,R0
        BL       LCD_WrDat
//  564 		if(gif == 1) 	LCD_DLY_ms(5);
        MOV      R0,R6
        CMP      R0,#+1
        BNE.N    ??LCD_Rectangle_5
        MOVS     R0,#+5
        BL       LCD_DLY_ms
//  565 	}
??LCD_Rectangle_5:
        ADDS     R7,R7,#+1
??LCD_Rectangle_3:
        MOV      R0,R4
        MOV      R1,R7
        UXTB     R1,R1
        CMP      R0,R1
        BCS.N    ??LCD_Rectangle_4
//  566 	
//  567 }  
        POP      {R0,R4-R9,PC}    ;; return
//  568 //==============================================================
//  569 //@@@@LCD_P6x8Str(unsigned char x,unsigned char y,unsigned char *p)
//  570 //@@@@@@@@@@@ASCII@@@
//  571 //@@@@@@@@@x,y@@y@@@@0@7@@@@@@@@
//  572 //@@@@
//  573 //==============================================================  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  574 void LCD_P6x8Str(unsigned char x,unsigned char y,unsigned char ch[])
//  575 {
LCD_P6x8Str:
        PUSH     {R3-R9,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOV      R6,R2
//  576   unsigned char c=0,i=0,j=0;      
        MOVS     R7,#+0
        B.N      ??LCD_P6x8Str_0
//  577   while (ch[j]!='\0')
//  578   {    
//  579     c =ch[j]-32;
//  580     if(x>126){x=0;y++;}
//  581     LCD_Set_Pos(x,y);    
//  582   	for(i=0;i<6;i++)     
//  583   	  LCD_WrDat(F6x8[c][i]);  
??LCD_P6x8Str_1:
        ADR.W    R1,F6x8
        ADD      R2,R9,R9, LSL #+1
        ADD      R1,R1,R2, LSL #+1
        LDRB     R0,[R1, R0]
        BL       LCD_WrDat
        ADD      R8,R8,#+1
??LCD_P6x8Str_2:
        MOV      R0,R8
        UXTB     R0,R0
        CMP      R0,#+6
        BLT.N    ??LCD_P6x8Str_1
//  584   	x+=6;
        ADDS     R4,R4,#+6
//  585   	j++;
        ADDS     R7,R7,#+1
??LCD_P6x8Str_0:
        MOV      R0,R7
        UXTB     R0,R0
        LDRB     R0,[R6, R0]
        CMP      R0,#+0
        BEQ.N    ??LCD_P6x8Str_3
        SUB      R9,R0,#+32
        UXTB     R9,R9
        MOV      R0,R4
        UXTB     R0,R0
        CMP      R0,#+127
        BLT.N    ??LCD_P6x8Str_4
        MOVS     R4,#+0
        ADDS     R5,R5,#+1
??LCD_P6x8Str_4:
        MOV      R1,R5
        UXTB     R1,R1
        MOV      R0,R4
        UXTB     R0,R0
        BL       LCD_Set_Pos
        MOV      R8,#+0
        B.N      ??LCD_P6x8Str_2
//  586   }
//  587 }
??LCD_P6x8Str_3:
        POP      {R0,R4-R9,PC}    ;; return
//  588 //==============================================================
//  589 //@@@@LCD_P8x16Str(unsigned char x,unsigned char y,unsigned char *p)
//  590 //@@@@@@@@@@@ASCII@@@
//  591 //@@@@@@@@@x,y@@y@@@@0@7@@@@@@@@
//  592 //@@@@
//  593 //==============================================================  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  594 void LCD_P8x16Str(unsigned char x,unsigned char y,unsigned char ch[])
//  595 {
LCD_P8x16Str:
        PUSH     {R3-R9,LR}
        MOV      R6,R0
        MOV      R7,R1
        MOV      R4,R2
//  596   unsigned char c=0,i=0,j=0;
        MOVS     R5,#+0
        B.N      ??LCD_P8x16Str_0
//  597         
//  598   while (ch[j]!='\0')
//  599   {    
//  600     c =ch[j]-32;
//  601     if(x>120){x=0;y++;}
//  602     LCD_Set_Pos(x,y);    
//  603   	for(i=0;i<8;i++)     
//  604   	  LCD_WrDat(F8X16[c*16+i]);
//  605   	LCD_Set_Pos(x,y+1);    
//  606   	for(i=0;i<8;i++)     
//  607   	  LCD_WrDat(F8X16[c*16+i+8]);  
??LCD_P8x16Str_1:
        ADR.W    R1,F8X16
        ADD      R0,R0,R8, LSL #+4
        ADD      R0,R1,R0
        LDRB     R0,[R0, #+8]
        BL       LCD_WrDat
        ADD      R9,R9,#+1
??LCD_P8x16Str_2:
        MOV      R0,R9
        UXTB     R0,R0
        CMP      R0,#+8
        BLT.N    ??LCD_P8x16Str_1
//  608   	x+=8;
        ADDS     R6,R6,#+8
//  609   	j++;
        ADDS     R5,R5,#+1
??LCD_P8x16Str_0:
        MOV      R0,R5
        UXTB     R0,R0
        LDRB     R0,[R4, R0]
        CMP      R0,#+0
        BEQ.N    ??LCD_P8x16Str_3
        SUB      R8,R0,#+32
        UXTB     R8,R8
        MOV      R0,R6
        UXTB     R0,R0
        CMP      R0,#+121
        BLT.N    ??LCD_P8x16Str_4
        MOVS     R6,#+0
        ADDS     R7,R7,#+1
??LCD_P8x16Str_4:
        MOV      R1,R7
        UXTB     R1,R1
        MOV      R0,R6
        UXTB     R0,R0
        BL       LCD_Set_Pos
        MOV      R9,#+0
        B.N      ??LCD_P8x16Str_5
??LCD_P8x16Str_6:
        ADR.W    R1,F8X16
        ADD      R0,R0,R8, LSL #+4
        LDRB     R0,[R1, R0]
        BL       LCD_WrDat
        ADD      R9,R9,#+1
??LCD_P8x16Str_5:
        MOV      R0,R9
        UXTB     R0,R0
        CMP      R0,#+8
        BLT.N    ??LCD_P8x16Str_6
        ADDS     R1,R7,#+1
        UXTB     R1,R1
        MOV      R0,R6
        UXTB     R0,R0
        BL       LCD_Set_Pos
        MOV      R9,#+0
        B.N      ??LCD_P8x16Str_2
//  610   }
//  611 }
??LCD_P8x16Str_3:
        POP      {R0,R4-R9,PC}    ;; return
//  612 //@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  613 void LCD_P14x16Str(unsigned char x,unsigned char y,unsigned char ch[])
//  614 {
LCD_P14x16Str:
        PUSH     {R3-R9,LR}
        MOV      R8,R0
        MOV      R7,R1
        MOV      R5,R2
//  615 	unsigned char wm=0,ii = 0;
        MOVS     R4,#+0
//  616 	unsigned int adder=1; 
        B.N      ??LCD_P14x16Str_0
//  617 	
//  618 	while(ch[ii] != '\0')
//  619 	{
//  620   	wm = 0;
//  621   	adder = 1;
//  622   	while(F14x16_Idx[wm] > 127)
//  623   	{
//  624   		if(F14x16_Idx[wm] == ch[ii])
//  625   		{
//  626   			if(F14x16_Idx[wm + 1] == ch[ii + 1])
//  627   			{
//  628   				adder = wm * 14;
//  629   				break;
//  630   			}
//  631   		}
//  632   		wm += 2;			
//  633   	}
//  634   	if(x>118){x=0;y++;}
//  635   	LCD_Set_Pos(x , y); 
//  636   	if(adder != 1)// @@@@					
//  637   	{
//  638   		LCD_Set_Pos(x , y);
//  639   		for(wm = 0;wm < 14;wm++)               
//  640   		{
//  641   			LCD_WrDat(F14x16[adder]);	
//  642   			adder += 1;
//  643   		}      
//  644   		LCD_Set_Pos(x,y + 1); 
//  645   		for(wm = 0;wm < 14;wm++)          
//  646   		{
//  647   			LCD_WrDat(F14x16[adder]);
//  648   			adder += 1;
//  649   		}   		
//  650   	}
//  651   	else			  //@@@@@@			
//  652   	{
//  653   		ii += 1;
//  654       LCD_Set_Pos(x,y);
//  655   		for(wm = 0;wm < 16;wm++)
//  656   		{
//  657   				LCD_WrDat(0);
//  658   		}
//  659   		LCD_Set_Pos(x,y + 1);
//  660   		for(wm = 0;wm < 16;wm++)
//  661   		{   		
//  662   				LCD_WrDat(0);	
??LCD_P14x16Str_1:
        MOVS     R0,#+0
        BL       LCD_WrDat
//  663   		}
        ADDS     R6,R6,#+1
??LCD_P14x16Str_2:
        MOV      R0,R6
        UXTB     R0,R0
        CMP      R0,#+16
        BLT.N    ??LCD_P14x16Str_1
//  664   	}
//  665   	x += 14;
??LCD_P14x16Str_3:
        ADD      R8,R8,#+14
//  666   	ii += 2;
        ADDS     R4,R4,#+2
        UXTB     R4,R4
??LCD_P14x16Str_0:
        LDRB     R0,[R5, R4]
        CMP      R0,#+0
        BEQ.N    ??LCD_P14x16Str_4
        MOVS     R1,#+0
        MOVS     R6,#+1
        B.N      ??LCD_P14x16Str_5
??LCD_P14x16Str_6:
        ADDS     R1,R1,#+2
??LCD_P14x16Str_5:
        MOV      R0,R1
        UXTB     R0,R0
        ADR.W    R2,F14x16_Idx
        LDRB     R3,[R2, R0]
        MOV      R12,R3
        CMP      R12,#+128
        BLT.N    ??LCD_P14x16Str_7
        LDRB     R12,[R5, R4]
        CMP      R3,R12
        BNE.N    ??LCD_P14x16Str_6
        ADD      R2,R2,R0
        LDRB     R2,[R2, #+1]
        ADDS     R3,R5,R4
        LDRB     R3,[R3, #+1]
        CMP      R2,R3
        BNE.N    ??LCD_P14x16Str_6
        RSB      R1,R0,R0, LSL #+3
        LSLS     R6,R1,#+1
??LCD_P14x16Str_7:
        MOV      R0,R8
        UXTB     R0,R0
        CMP      R0,#+119
        BLT.N    ??LCD_P14x16Str_8
        MOV      R8,#+0
        ADDS     R7,R7,#+1
??LCD_P14x16Str_8:
        MOV      R1,R7
        UXTB     R1,R1
        MOV      R0,R8
        UXTB     R0,R0
        BL       LCD_Set_Pos
        CMP      R6,#+1
        BEQ.N    ??LCD_P14x16Str_9
        MOV      R1,R7
        UXTB     R1,R1
        MOV      R0,R8
        UXTB     R0,R0
        BL       LCD_Set_Pos
        MOV      R9,#+0
        B.N      ??LCD_P14x16Str_10
??LCD_P14x16Str_11:
        ADR.W    R0,F14x16
        LDRB     R0,[R0, R6]
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        ADD      R9,R9,#+1
??LCD_P14x16Str_10:
        MOV      R0,R9
        UXTB     R0,R0
        CMP      R0,#+14
        BLT.N    ??LCD_P14x16Str_11
        ADDS     R1,R7,#+1
        UXTB     R1,R1
        MOV      R0,R8
        UXTB     R0,R0
        BL       LCD_Set_Pos
        MOV      R9,#+0
??LCD_P14x16Str_12:
        MOV      R0,R9
        UXTB     R0,R0
        CMP      R0,#+14
        BGE.N    ??LCD_P14x16Str_3
        ADR.W    R0,F14x16
        LDRB     R0,[R0, R6]
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
        ADD      R9,R9,#+1
        B.N      ??LCD_P14x16Str_12
??LCD_P14x16Str_9:
        ADDS     R4,R4,#+1
        MOV      R1,R7
        UXTB     R1,R1
        MOV      R0,R8
        UXTB     R0,R0
        BL       LCD_Set_Pos
        MOVS     R6,#+0
        B.N      ??LCD_P14x16Str_13
??LCD_P14x16Str_14:
        MOVS     R0,#+0
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
??LCD_P14x16Str_13:
        MOV      R0,R6
        UXTB     R0,R0
        CMP      R0,#+16
        BLT.N    ??LCD_P14x16Str_14
        ADDS     R1,R7,#+1
        UXTB     R1,R1
        MOV      R0,R8
        UXTB     R0,R0
        BL       LCD_Set_Pos
        MOVS     R6,#+0
        B.N      ??LCD_P14x16Str_2
//  667 	}
//  668 }
??LCD_P14x16Str_4:
        POP      {R0,R4-R9,PC}    ;; return
//  669 //@@@@@@@@@@@@

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  670 void LCD_Print(unsigned char x, unsigned char y, unsigned char ch[])
//  671 {
LCD_Print:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOV      R6,R2
//  672 	unsigned char ch2[3];
//  673 	unsigned char ii=0;        
        MOVS     R7,#+0
        B.N      ??LCD_Print_0
//  674 	while(ch[ii] != '\0')
//  675 	{
//  676 		if(ch[ii] > 127)
//  677 		{
//  678 			ch2[0] = ch[ii];
//  679 	 		ch2[1] = ch[ii + 1];
??LCD_Print_1:
        ADDS     R0,R6,#+1
        LDRB     R0,[R0, R7]
        STRB     R0,[R1, #+1]
//  680 			ch2[2] = '\0';			//@@@@@@@
        MOVS     R0,#+0
        STRB     R0,[R1, #+2]
//  681 			LCD_P14x16Str(x , y, ch2);	//@@@@
        MOV      R2,SP
        MOV      R1,R5
        MOV      R0,R4
        UXTB     R0,R0
        BL       LCD_P14x16Str
//  682 			x += 14;
        ADDS     R4,R4,#+14
//  683 			ii += 2;
        ADDS     R7,R7,#+2
        UXTB     R7,R7
//  684 		}
??LCD_Print_0:
        LDRB     R0,[R6, R7]
        CMP      R0,#+0
        BEQ.N    ??LCD_Print_2
        MOV      R1,SP
        MOV      R2,R0
        CMP      R2,#+128
        STRB     R0,[SP, #+0]
        BGE.N    ??LCD_Print_1
//  685 		else
//  686 		{
//  687 			ch2[0] = ch[ii];	
//  688 			ch2[1] = '\0';			//@@@@@@@
        MOVS     R0,#+0
        STRB     R0,[R1, #+1]
//  689 			LCD_P8x16Str(x , y , ch2);	//@@@@
        MOV      R2,SP
        MOV      R1,R5
        MOV      R0,R4
        UXTB     R0,R0
        BL       LCD_P8x16Str
//  690 			x += 8;
        ADDS     R4,R4,#+8
//  691 			ii+= 1;
        ADDS     R7,R7,#+1
        UXTB     R7,R7
        B.N      ??LCD_Print_0
//  692 		}
//  693 	}
//  694 } 
??LCD_Print_2:
        POP      {R0,R4-R7,PC}    ;; return
//  695 
//  696 //==============================================================
//  697 //@@@@ void Draw_BMP(unsigned char x,unsigned char y)
//  698 //@@@@@@@BMP@@128�64
//  699 //@@@@@@@@(x,y),x@@@0@127@y@@@@@0@7
//  700 //@@@@
//  701 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  702 void Draw_BMP(unsigned char x0,unsigned char y0,unsigned char x1,unsigned char y1,unsigned char * bmp)
//  703 { 	
Draw_BMP:
        PUSH     {R4-R10,LR}
        MOV      R6,R0
        MOV      R5,R2
        MOV      R7,R3
        LDR      R9,[SP, #+32]
//  704   unsigned int ii=0;
        MOVS     R4,#+0
//  705   unsigned char x,y;
//  706   
//  707   if(y1%8==0) y=y1/8;      
//  708   else y=y1/8+1;
//  709 	for(y=y0;y<=y1;y++)
        MOV      R8,R1
        B.N      ??Draw_BMP_0
//  710 	{
//  711 		LCD_Set_Pos(x0,y);				
//  712     for(x=x0;x<x1;x++)
//  713 	    {      
//  714 	    	LCD_WrDat(bmp[ii++]);	    	
??Draw_BMP_1:
        LDRB     R0,[R9, R4]
        BL       LCD_WrDat
        ADDS     R4,R4,#+1
//  715 	    }
        ADD      R10,R10,#+1
??Draw_BMP_2:
        MOV      R0,R10
        MOV      R1,R5
        UXTB     R0,R0
        CMP      R0,R1
        BCC.N    ??Draw_BMP_1
        ADD      R8,R8,#+1
??Draw_BMP_0:
        MOV      R0,R7
        MOV      R1,R8
        UXTB     R1,R1
        CMP      R0,R1
        BCC.N    ??Draw_BMP_3
        MOV      R1,R8
        UXTB     R1,R1
        MOV      R0,R6
        BL       LCD_Set_Pos
        MOV      R10,R6
        B.N      ??Draw_BMP_2
//  716 	}
//  717 }
??Draw_BMP_3:
        POP      {R4-R10,PC}      ;; return
//  718 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  719 void Draw_MyLogo(void)
//  720 {
Draw_MyLogo:
        PUSH     {R4-R6,LR}
//  721   unsigned int ii=0;
        MOVS     R4,#+0
//  722   unsigned char x,y;
//  723   
//  724   for(y=0;y<8;y++)
        MOV      R5,R4
        B.N      ??Draw_MyLogo_0
//  725   {
//  726     LCD_Set_Pos(0,y);
//  727     for(x=0;x<128;x++)
//  728     {
//  729       LCD_WrDat(OverLoad[ii++]);
??Draw_MyLogo_1:
        ADR.W    R0,OverLoad
        LDRB     R0,[R0, R4]
        BL       LCD_WrDat
        ADDS     R4,R4,#+1
//  730     }
        ADDS     R6,R6,#+1
??Draw_MyLogo_2:
        MOV      R0,R6
        UXTB     R0,R0
        CMP      R0,#+128
        BLT.N    ??Draw_MyLogo_1
        ADDS     R5,R5,#+1
??Draw_MyLogo_0:
        MOV      R0,R5
        UXTB     R0,R0
        CMP      R0,#+8
        BGE.N    ??Draw_MyLogo_3
        MOV      R1,R5
        UXTB     R1,R1
        MOVS     R0,#+0
        BL       LCD_Set_Pos
        MOVS     R6,#+0
        B.N      ??Draw_MyLogo_2
//  731   }
//  732 }
??Draw_MyLogo_3:
        POP      {R4-R6,PC}       ;; return
//  733 
//  734 
//  735 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  736 void LCD_PrintU16(unsigned char x,unsigned char y,unsigned int num)
//  737 {
LCD_PrintU16:
        PUSH     {R2-R6,LR}
//  738 	unsigned char tmp[6],i;
//  739 	tmp[5]=0;
        MOVS     R3,#+0
        STRB     R3,[SP, #+5]
//  740 	tmp[4]=(unsigned char)(num%10+0x30);
        MOVS     R3,#+10
        UDIV     R5,R2,R3
        MLS      R4,R3,R5,R2
        ADDS     R4,R4,#+48
        STRB     R4,[SP, #+4]
//  741 	tmp[3]=(unsigned char)(num/10%10+0x30);
        MOV      R4,SP
        MOV      R6,R3
        UDIV     R6,R5,R6
        MLS      R5,R3,R6,R5
        ADDS     R5,R5,#+48
        STRB     R5,[R4, #+3]
//  742 	tmp[2]=(unsigned char)(num/100%10+0x30);
        MOVS     R5,#+100
        UDIV     R5,R2,R5
        MOV      R6,R3
        UDIV     R6,R5,R6
        MLS      R5,R3,R6,R5
        ADDS     R5,R5,#+48
        STRB     R5,[SP, #+2]
//  743 	tmp[1]=(unsigned char)(num/1000%10+0x30);
        MOV      R5,#+1000
        UDIV     R5,R2,R5
        MOV      R6,R3
        UDIV     R6,R5,R6
        MLS      R5,R3,R6,R5
        ADDS     R5,R5,#+48
        STRB     R5,[R4, #+1]
//  744 	tmp[0]=(unsigned char)(num/10000%10+0x30);
        MOVW     R5,#+10000
        UDIV     R2,R2,R5
        MOV      R5,R3
        UDIV     R5,R2,R5
        MLS      R3,R3,R5,R2
        ADDS     R3,R3,#+48
        STRB     R3,[SP, #+0]
//  745 	
//  746 	for(i=0;i<4;i++)
        MOVS     R2,#+0
??LCD_PrintU16_0:
        CMP      R2,#+3
        BGT.N    ??LCD_PrintU16_1
//  747 	{
//  748 		if(tmp[i]=='0')
        LDRB     R3,[R4, R2]
        CMP      R3,#+48
        BNE.N    ??LCD_PrintU16_1
//  749 			tmp[i]=' ';
        MOVS     R3,#+32
        STRB     R3,[R4, R2]
//  750 		else
//  751 			break;
//  752 	}
        ADDS     R2,R2,#+1
        UXTB     R2,R2
        B.N      ??LCD_PrintU16_0
//  753 	
//  754 	LCD_P6x8Str(x,y,tmp);
??LCD_PrintU16_1:
        MOV      R2,SP
        BL       LCD_P6x8Str
//  755 	
//  756 }
        POP      {R0,R1,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  757 void LCD_PrintFloat(unsigned char x,unsigned char y,float num)
//  758 {
LCD_PrintFloat:
        PUSH     {R1-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOV      R1,R2
//  759 	unsigned char tmp[6],i;
//  760 	tmp[5]=0;
        MOVS     R0,#+0
        STRB     R0,[SP, #+5]
//  761 	num *= 10;
        LDR.N    R0,??DataTable10_3  ;; 0x41200000
        BL       __aeabi_fmul
//  762 	if(num>0)
        MOVS     R6,#+10
        MOV      R7,SP
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??LCD_PrintFloat_0
//  763 	{
//  764 		tmp[0]='+';
        MOVS     R1,#+43
        STRB     R1,[SP, #+0]
//  765 		tmp[4]=(unsigned char)((int)num%10+0x30);
        BL       __aeabi_f2iz
        MOV      R1,R6
        SDIV     R1,R0,R1
        MLS      R2,R6,R1,R0
        ADDS     R2,R2,#+48
        STRB     R2,[R7, #+4]
//  766 		tmp[3]=(unsigned char)((int)num/10%10+0x30);
        MOV      R2,R6
        SDIV     R2,R1,R2
        MLS      R1,R6,R2,R1
        ADDS     R1,R1,#+48
        STRB     R1,[R7, #+3]
//  767 		tmp[2]=(unsigned char)((int)num/100%10+0x30);
        MOVS     R1,#+100
        SDIV     R1,R0,R1
        MOV      R2,R6
        SDIV     R2,R1,R2
        MLS      R1,R6,R2,R1
        ADDS     R1,R1,#+48
        STRB     R1,[R7, #+2]
//  768 		tmp[1]=(unsigned char)((int)num/1000%10+0x30);
        MOV      R1,#+1000
        SDIV     R0,R0,R1
        MOV      R1,R6
        SDIV     R1,R0,R1
        MLS      R6,R6,R1,R0
        ADDS     R6,R6,#+48
        STRB     R6,[R7, #+1]
        B.N      ??LCD_PrintFloat_1
//  769 	}
//  770 	else
//  771 	{
//  772 		tmp[0]='-';
??LCD_PrintFloat_0:
        MOVS     R1,#+45
        STRB     R1,[SP, #+0]
//  773 		num=-num;
        EOR      R0,R0,#0x80000000
//  774 		tmp[4]=(unsigned char)((int)num%10+0x30);
        BL       __aeabi_f2iz
        MOV      R1,R6
        SDIV     R1,R0,R1
        MLS      R2,R6,R1,R0
        ADDS     R2,R2,#+48
        STRB     R2,[R7, #+4]
//  775 		tmp[3]=(unsigned char)((int)num/10%10+0x30);
        MOV      R2,R6
        SDIV     R2,R1,R2
        MLS      R1,R6,R2,R1
        ADDS     R1,R1,#+48
        STRB     R1,[R7, #+3]
//  776 		tmp[2]=(unsigned char)((int)num/100%10+0x30);
        MOVS     R1,#+100
        SDIV     R1,R0,R1
        MOV      R2,R6
        SDIV     R2,R1,R2
        MLS      R1,R6,R2,R1
        ADDS     R1,R1,#+48
        STRB     R1,[R7, #+2]
//  777 		tmp[1]=(unsigned char)((int)num/1000%10+0x30);
        MOV      R1,#+1000
        SDIV     R0,R0,R1
        MOV      R1,R6
        SDIV     R1,R0,R1
        MLS      R6,R6,R1,R0
        ADDS     R6,R6,#+48
        STRB     R6,[R7, #+1]
//  778 	}
//  779 	for(i=0;i<4;i++)
??LCD_PrintFloat_1:
        MOVS     R0,#+0
??LCD_PrintFloat_2:
        CMP      R0,#+4
        BGE.N    ??LCD_PrintFloat_3
//  780 	{
//  781 		if(tmp[i]=='0')
        LDRB     R1,[R7, R0]
        CMP      R1,#+48
        BNE.N    ??LCD_PrintFloat_3
//  782 			tmp[i]=' ';
        MOVS     R1,#+32
        STRB     R1,[R7, R0]
//  783 		else
//  784 			break;
//  785 	}
        ADDS     R0,R0,#+1
        UXTB     R0,R0
        B.N      ??LCD_PrintFloat_2
//  786 	LCD_P6x8Str(x,y,tmp);
??LCD_PrintFloat_3:
        MOV      R2,SP
        MOV      R1,R5
        MOV      R0,R4
        BL       LCD_P6x8Str
//  787 }
        POP      {R0-R2,R4-R7,PC}  ;; return
//  788 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  789 void LCD_ClrDot(unsigned char x)
//  790 {
LCD_ClrDot:
        PUSH     {R4-R6,LR}
        MOV      R4,R0
//  791 	LCD_Set_Pos(x,6);
        MOVS     R1,#+6
        BL       LCD_Set_Pos
//  792 	LCD_WrCmd((unsigned char)(0xb0+6));
        MOVS     R0,#+182
        BL       LCD_WrCmd
//  793 	LCD_WrCmd((unsigned char)(((x&0xf0)>>4)|0x10));
        MOV      R5,R4
        LSRS     R5,R5,#+4
        ORR      R5,R5,#0x10
        MOV      R0,R5
        BL       LCD_WrCmd
//  794 	LCD_WrCmd((unsigned char)((x&0x0f)|0x00));
        AND      R6,R4,#0xF
        MOV      R0,R6
        BL       LCD_WrCmd
//  795 	LCD_WrDat(0x00);
        MOVS     R0,#+0
        BL       LCD_WrDat
//  796 	
//  797 	LCD_Set_Pos(x,7);
        MOVS     R1,#+7
        MOV      R0,R4
        BL       LCD_Set_Pos
//  798 	LCD_WrCmd((unsigned char)(0xb0+7));
        MOVS     R0,#+183
        BL       LCD_WrCmd
//  799 	LCD_WrCmd((unsigned char)(((x&0xf0)>>4)|0x10));
        MOV      R0,R5
        BL       LCD_WrCmd
//  800 	LCD_WrCmd((unsigned char)((x&0x0f)|0x00));
        MOV      R0,R6
        BL       LCD_WrCmd
//  801 	LCD_WrDat(0x00);
        MOVS     R0,#+0
        POP      {R4-R6,LR}
        B.N      LCD_WrDat
//  802 } 
//  803 
//  804 
//  805 //-----------------------------------------*
//  806 //@@@Show_Img                           *
//  807 //@@@@@@@                           *
//  808 //-----------------------------------------*

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  809 void Show_Img(void)
//  810 {
Show_Img:
        PUSH     {R3-R5,LR}
//  811   int i = 0, j = 0,temp=0;
//  812   for(i=10;i<74;i+=8)//6*8=48@  i@@
        MOVS     R4,#+10
        B.N      ??Show_Img_0
//  813   {
//  814     LCD_Set_Pos(0,(i-10)/8);
//  815     for(j=0;j<316;j+=3) 
//  816     { 
//  817       temp=0;
??Show_Img_1:
        MOVS     R0,#+0
//  818       if(Img_Data[0+i][j]< YUZHI? 1:0 ) temp|=0x01;
        LDR.N    R1,??DataTable10_4
        MOV      R2,#+316
        MULS     R2,R2,R4
        ADD      R1,R1,R2
        LDR.N    R2,??DataTable10_5
        LDR      R2,[R2, #+0]
        LDRB     R3,[R1, R5]
        CMP      R3,R2
        BGE.N    ??Show_Img_2
        MOVS     R0,#+1
//  819       if(Img_Data[1+i][j]< YUZHI? 1:0) temp|=0x02;
??Show_Img_2:
        ADDS     R3,R1,R5
        LDRB     R3,[R3, #+316]
        CMP      R3,R2
        BGE.N    ??Show_Img_3
        ORR      R0,R0,#0x2
//  820       if(Img_Data[2+i][j]< YUZHI? 1:0) temp|=0x04;
??Show_Img_3:
        ADDS     R3,R1,R5
        LDRB     R3,[R3, #+632]
        CMP      R3,R2
        BGE.N    ??Show_Img_4
        ORR      R0,R0,#0x4
//  821       if(Img_Data[3+i][j]< YUZHI? 1:0) temp|=0x08;
??Show_Img_4:
        ADDS     R3,R1,R5
        LDRB     R3,[R3, #+948]
        CMP      R3,R2
        BGE.N    ??Show_Img_5
        ORR      R0,R0,#0x8
//  822       if(Img_Data[4+i][j]< YUZHI? 1:0) temp|=0x10;
??Show_Img_5:
        ADDS     R3,R1,R5
        LDRB     R3,[R3, #+1264]
        CMP      R3,R2
        BGE.N    ??Show_Img_6
        ORR      R0,R0,#0x10
//  823       if(Img_Data[5+i][j]< YUZHI? 1:0) temp|=0x20;
??Show_Img_6:
        ADDS     R3,R1,R5
        LDRB     R3,[R3, #+1580]
        CMP      R3,R2
        BGE.N    ??Show_Img_7
        ORR      R0,R0,#0x20
//  824       if(Img_Data[6+i][j]< YUZHI? 1:0) temp|=0x40;
??Show_Img_7:
        ADDS     R3,R1,R5
        LDRB     R3,[R3, #+1896]
        CMP      R3,R2
        BGE.N    ??Show_Img_8
        ORR      R0,R0,#0x40
//  825       if(Img_Data[7+i][j]< YUZHI? 1:0) temp|=0x80;
??Show_Img_8:
        ADD      R1,R1,R5
        LDRB     R1,[R1, #+2212]
        CMP      R1,R2
        BGE.N    ??Show_Img_9
        ORR      R0,R0,#0x80
//  826       LCD_WrDat(temp); 	  	  	  	  
??Show_Img_9:
        BL       LCD_WrDat
//  827     }
        ADDS     R5,R5,#+3
??Show_Img_10:
        CMP      R5,#+316
        BLT.N    ??Show_Img_1
        ADDS     R4,R4,#+8
??Show_Img_0:
        CMP      R4,#+74
        BGE.N    ??Show_Img_11
        SUB      R0,R4,#+10
        MOV      R1,R0
        ASRS     R1,R1,#+2
        ADD      R0,R0,R1, LSR #+29
        ASRS     R0,R0,#+3
        MOV      R1,R0
        UXTB     R1,R1
        MOVS     R0,#+0
        BL       LCD_Set_Pos
        MOVS     R5,#+0
        B.N      ??Show_Img_10
//  828   }   
//  829 }
??Show_Img_11:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x43fe1034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0x43fe1038

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     Img_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     YUZHI

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
F6x8:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 7, 0, 7, 0, 0, 20, 127
        DC8 20, 127, 20, 0, 36, 42, 127, 42, 18, 0, 98, 100, 8, 19, 35, 0, 54
        DC8 73, 85, 34, 80, 0, 0, 5, 3, 0, 0, 0, 0, 28, 34, 65, 0, 0, 0, 65, 34
        DC8 28, 0, 0, 20, 8, 62, 8, 20, 0, 8, 8, 62, 8, 8, 0, 0, 0, 160, 96, 0
        DC8 0, 8, 8, 8, 8, 8, 0, 0, 96, 96, 0, 0, 0, 32, 16, 8, 4, 2, 0, 62, 81
        DC8 73, 69, 62, 0, 0, 66, 127, 64, 0, 0, 66, 97, 81, 73, 70, 0, 33, 65
        DC8 69, 75, 49, 0, 24, 20, 18, 127, 16, 0, 39, 69, 69, 69, 57, 0, 60
        DC8 74, 73, 73, 48, 0, 1, 113, 9, 5, 3, 0, 54, 73, 73, 73, 54, 0, 6, 73
        DC8 73, 41, 30, 0, 0, 54, 54, 0, 0, 0, 0, 86, 54, 0, 0, 0, 8, 20, 34
        DC8 65, 0, 0, 20, 20, 20, 20, 20, 0, 0, 65, 34, 20, 8, 0, 2, 1, 81, 9
        DC8 6, 0, 50, 73, 89, 81, 62, 0, 124, 18, 17, 18, 124, 0, 127, 73, 73
        DC8 73, 54, 0, 62, 65, 65, 65, 34, 0, 127, 65, 65, 34, 28, 0, 127, 73
        DC8 73, 73, 65, 0, 127, 9, 9, 9, 1, 0, 62, 65, 73, 73, 122, 0, 127, 8
        DC8 8, 8, 127, 0, 0, 65, 127, 65, 0, 0, 32, 64, 65, 63, 1, 0, 127, 8
        DC8 20, 34, 65, 0, 127, 64, 64, 64, 64, 0, 127, 2, 12, 2, 127, 0, 127
        DC8 4, 8, 16, 127, 0, 62, 65, 65, 65, 62, 0, 127, 9, 9, 9, 6, 0, 62, 65
        DC8 81, 33, 94, 0, 127, 9, 25, 41, 70, 0, 70, 73, 73, 73, 49, 0, 1, 1
        DC8 127, 1, 1, 0, 63, 64, 64, 64, 63, 0, 31, 32, 64, 32, 31, 0, 63, 64
        DC8 56, 64, 63, 0, 99, 20, 8, 20, 99, 0, 7, 8, 112, 8, 7, 0, 97, 81, 73
        DC8 69, 67, 0, 0, 127, 65, 65, 0, 0, 85, 42, 85, 42, 85, 0, 0, 65, 65
        DC8 127, 0, 0, 4, 2, 1, 2, 4, 0, 64, 64, 64, 64, 64, 0, 0, 1, 2, 4, 0
        DC8 0, 32, 84, 84, 84, 120, 0, 127, 72, 68, 68, 56, 0, 56, 68, 68, 68
        DC8 32, 0, 56, 68, 68, 72, 127, 0, 56, 84, 84, 84, 24, 0, 8, 126, 9, 1
        DC8 2, 0, 24, 164, 164, 164, 124, 0, 127, 8, 4, 4, 120, 0, 0, 68, 125
        DC8 64, 0, 0, 64, 128, 132, 125, 0, 0, 127, 16, 40, 68, 0, 0, 0, 65
        DC8 127, 64, 0, 0, 124, 4, 24, 4, 120, 0, 124, 8, 4, 4, 120, 0, 56, 68
        DC8 68, 68, 56, 0, 252, 36, 36, 36, 24, 0, 24, 36, 36, 24, 252, 0, 124
        DC8 8, 4, 4, 8, 0, 72, 84, 84, 84, 32, 0, 4, 63, 68, 64, 32, 0, 60, 64
        DC8 64, 32, 124, 0, 28, 32, 64, 32, 28, 0, 60, 64, 48, 64, 60, 0, 68
        DC8 40, 16, 40, 68, 0, 28, 160, 160, 160, 124, 0, 68, 100, 84, 76, 68
        DC8 20, 20, 20, 20, 20, 20

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
F14x16_Idx:
        DC8 0B1H, 0B1H, 0BEH, 0A9H, 0C1H, 0FAH, 0C7H, 0F0H
        DC8 0C7H, 0F1H, 0BFH, 0C6H, 0BCH, 0BCH, 0BFH, 0AAH
        DC8 0B7H, 0A2H, 0B0H, 0E5H, 0D6H, 0C7H, 0C4H, 0DCH
        DC8 0B3H, 0B5H, 0CAH, 0D7H, 0D1H, 0A1H, 0D2H, 0BAH
        DC8 0BEH, 0A7H, 0CAH, 0D2H, 0CEH, 0C2H, 0B6H, 0C8H
        DC8 0B0H, 0B4H, 0BCH, 0FCH, 0B4H, 0CEH, 0B5H, 0E7H
        DC8 0D1H, 0B9H, 0
        DC8 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
F14x16:
        DC8 32, 32, 32, 32, 255, 0, 0, 0, 255, 64, 32, 48, 24, 16, 48, 24, 8, 4
        DC8 127, 0, 0, 0, 63, 64, 64, 64, 64, 120, 4, 4, 228, 36, 36, 37, 38
        DC8 36, 36, 36, 228, 6, 4, 0, 32, 16, 25, 13, 65, 129, 127, 1, 1, 5, 13
        DC8 56, 16, 0, 16, 16, 16, 16, 16, 255, 16, 240, 18, 28, 208, 16, 16
        DC8 16, 64, 32, 16, 12, 3, 16, 8, 63, 66, 65, 64, 64, 64, 112, 0, 0
        DC8 254, 132, 132, 132, 132, 130, 130, 130, 130, 192, 128, 0, 32, 32
        DC8 63, 32, 32, 32, 32, 32, 63, 32, 32, 32, 48, 32, 0, 252, 36, 36, 226
        DC8 34, 34, 0, 254, 2, 34, 82, 142, 2, 16, 31, 16, 8, 15, 8, 8, 0, 255
        DC8 0, 8, 8, 16, 15, 18, 146, 114, 254, 81, 145, 0, 34, 204, 0, 0, 255
        DC8 0, 0, 2, 1, 0, 255, 0, 4, 4, 4, 2, 2, 2, 255, 1, 1, 8, 136, 255, 72
        DC8 40, 0, 200, 72, 72, 127, 72, 200, 72, 8, 65, 128, 127, 0, 64, 64
        DC8 32, 19, 12, 12, 18, 33, 96, 32, 66, 66, 66, 66, 254, 66, 66, 66, 66
        DC8 254, 66, 66, 66, 66, 64, 32, 16, 12, 3, 0, 0, 0, 0, 127, 0, 0, 0, 0
        DC8 16, 62, 16, 16, 240, 159, 144, 144, 146, 148, 28, 16, 16, 16, 32
        DC8 16, 136, 135, 65, 70, 40, 16, 40, 39, 64, 192, 64, 0, 16, 208, 255
        DC8 80, 144, 0, 254, 98, 162, 34, 33, 161, 97, 0, 3, 0, 127, 0, 17, 14
        DC8 65, 32, 17, 10, 14, 49, 96, 32, 20, 19, 146, 126, 50, 82, 146, 0
        DC8 124, 68, 68, 68, 124, 0, 1, 1, 0, 255, 73, 73, 73, 73, 73, 73, 255
        DC8 0, 0, 0, 184, 151, 146, 144, 148, 184, 16, 0, 127, 72, 72, 68, 116
        DC8 32, 255, 10, 10, 74, 138, 127, 0, 0, 63, 68, 68, 66, 114, 32, 4
        DC8 132, 196, 164, 156, 135, 132, 244, 132, 132, 132, 132, 132, 0, 4, 4
        DC8 4, 4, 4, 4, 4, 255, 4, 4, 4, 4, 4, 4, 4, 4, 228, 37, 38, 52, 44, 36
        DC8 36, 38, 229, 4, 4, 4, 0, 0, 127, 37, 37, 37, 37, 37, 37, 37, 127, 0
        DC8 0, 0, 64, 66, 204, 0, 80, 78, 200, 72, 127, 200, 72, 72, 64, 0, 64
        DC8 32, 31, 32, 72, 70, 65, 64, 64, 71, 72, 72, 78, 64, 97, 6, 224, 24
        DC8 132, 228, 28, 132, 101, 190, 36, 164, 100, 4, 4, 255, 0, 1, 0, 255
        DC8 65, 33, 18, 12, 27, 97, 192, 64, 0, 0, 0, 126, 42, 42, 42, 42, 42
        DC8 42, 126, 0, 0, 0, 127, 37, 37, 37, 37, 127, 0, 0, 127, 37, 37, 37
        DC8 37, 127, 16, 44, 36, 164, 100, 37, 38, 36, 36, 164, 36, 52, 44, 4
        DC8 64, 72, 73, 73, 73, 73, 127, 73, 73, 73, 75, 72, 64, 64, 33, 134
        DC8 112, 0, 126, 74, 74, 74, 74, 74, 126, 0, 0, 0, 254, 1, 64, 127, 65
        DC8 65, 127, 65, 65, 127, 65, 65, 127, 64, 0, 252, 4, 36, 36, 252, 165
        DC8 166, 164, 252, 36, 36, 36, 4, 96, 31, 128, 128, 66, 70, 42, 18, 18
        DC8 42, 38, 66, 192, 64, 16, 16, 255, 144, 80, 152, 136, 136, 233, 142
        DC8 136, 136, 152, 136, 66, 129, 127, 0, 64, 64, 38, 37, 24, 8, 22, 49
        DC8 96, 32, 48, 239, 40, 40, 68, 100, 220, 16, 84, 255, 84, 84, 124, 16
        DC8 1, 127, 33, 81, 34, 20, 15, 20, 37, 63, 69, 69, 69, 68, 2, 28, 192
        DC8 48, 76, 48, 15, 8, 248, 8, 8, 40, 24, 8, 94, 67, 32, 32, 16, 8, 4
        DC8 3, 1, 6, 8, 48, 96, 32, 0, 248, 72, 72, 72, 72, 255, 72, 72, 72, 72
        DC8 248, 0, 0, 0, 15, 4, 4, 4, 4, 63, 68, 68, 68, 68, 79, 64, 112, 0
        DC8 254, 2, 66, 66, 66, 66, 250, 66, 66, 66, 98, 66, 2, 24, 39, 32, 32
        DC8 32, 32, 32, 63, 32, 33, 46, 36, 32, 32

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
F8X16:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 0, 0
        DC8 0, 0, 0, 0, 0, 51, 48, 0, 0, 0, 0, 16, 12, 6, 16, 12, 6, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 64, 192, 120, 64, 192, 120, 64, 0, 4, 63, 4, 4, 63
        DC8 4, 4, 0, 0, 112, 136, 252, 8, 48, 0, 0, 0, 24, 32, 255, 33, 30, 0
        DC8 0, 240, 8, 240, 0, 224, 24, 0, 0, 0, 33, 28, 3, 30, 33, 30, 0, 0
        DC8 240, 8, 136, 112, 0, 0, 0, 30, 33, 35, 36, 25, 39, 33, 16, 16, 22
        DC8 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 24, 4, 2
        DC8 0, 0, 0, 0, 7, 24, 32, 64, 0, 0, 2, 4, 24, 224, 0, 0, 0, 0, 64, 32
        DC8 24, 7, 0, 0, 0, 64, 64, 128, 240, 128, 64, 64, 0, 2, 2, 1, 15, 1, 2
        DC8 2, 0, 0, 0, 0, 240, 0, 0, 0, 0, 1, 1, 1, 31, 1, 1, 1, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 128, 176, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 128, 96, 24, 4, 0, 96, 24, 6, 1, 0, 0, 0, 0, 224, 16
        DC8 8, 8, 16, 224, 0, 0, 15, 16, 32, 32, 16, 15, 0, 0, 16, 16, 248, 0
        DC8 0, 0, 0, 0, 32, 32, 63, 32, 32, 0, 0, 0, 112, 8, 8, 8, 136, 112, 0
        DC8 0, 48, 40, 36, 34, 33, 48, 0, 0, 48, 8, 136, 136, 72, 48, 0, 0, 24
        DC8 32, 32, 32, 17, 14, 0, 0, 0, 192, 32, 16, 248, 0, 0, 0, 7, 4, 36
        DC8 36, 63, 36, 0, 0, 248, 8, 136, 136, 8, 8, 0, 0, 25, 33, 32, 32, 17
        DC8 14, 0, 0, 224, 16, 136, 136, 24, 0, 0, 0, 15, 17, 32, 32, 17, 14, 0
        DC8 0, 56, 8, 8, 200, 56, 8, 0, 0, 0, 0, 63, 0, 0, 0, 0, 0, 112, 136, 8
        DC8 8, 136, 112, 0, 0, 28, 34, 33, 33, 34, 28, 0, 0, 224, 16, 8, 8, 16
        DC8 224, 0, 0, 0, 49, 34, 34, 17, 15, 0, 0, 0, 0, 192, 192, 0, 0, 0, 0
        DC8 0, 0, 48, 48, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 128, 96, 0
        DC8 0, 0, 0, 0, 0, 128, 64, 32, 16, 8, 0, 0, 1, 2, 4, 8, 16, 32, 0, 64
        DC8 64, 64, 64, 64, 64, 64, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 8, 16, 32, 64
        DC8 128, 0, 0, 0, 32, 16, 8, 4, 2, 1, 0, 0, 112, 72, 8, 8, 8, 240, 0, 0
        DC8 0, 0, 48, 54, 1, 0, 0, 192, 48, 200, 40, 232, 16, 224, 0, 7, 24, 39
        DC8 36, 35, 20, 11, 0, 0, 0, 192, 56, 224, 0, 0, 0, 32, 60, 35, 2, 2
        DC8 39, 56, 32, 8, 248, 136, 136, 136, 112, 0, 0, 32, 63, 32, 32, 32
        DC8 17, 14, 0, 192, 48, 8, 8, 8, 8, 56, 0, 7, 24, 32, 32, 32, 16, 8, 0
        DC8 8, 248, 8, 8, 8, 16, 224, 0, 32, 63, 32, 32, 32, 16, 15, 0, 8, 248
        DC8 136, 136, 232, 8, 16, 0, 32, 63, 32, 32, 35, 32, 24, 0, 8, 248, 136
        DC8 136, 232, 8, 16, 0, 32, 63, 32, 0, 3, 0, 0, 0, 192, 48, 8, 8, 8, 56
        DC8 0, 0, 7, 24, 32, 32, 34, 30, 2, 0, 8, 248, 8, 0, 0, 8, 248, 8, 32
        DC8 63, 33, 1, 1, 33, 63, 32, 0, 8, 8, 248, 8, 8, 0, 0, 0, 32, 32, 63
        DC8 32, 32, 0, 0, 0, 0, 8, 8, 248, 8, 8, 0, 192, 128, 128, 128, 127, 0
        DC8 0, 0, 8, 248, 136, 192, 40, 24, 8, 0, 32, 63, 32, 1, 38, 56, 32, 0
        DC8 8, 248, 8, 0, 0, 0, 0, 0, 32, 63, 32, 32, 32, 32, 48, 0, 8, 248
        DC8 248, 0, 248, 248, 8, 0, 32, 63, 0, 63, 0, 63, 32, 0, 8, 248, 48
        DC8 192, 0, 8, 248, 8, 32, 63, 32, 0, 7, 24, 63, 0, 224, 16, 8, 8, 8
        DC8 16, 224, 0, 15, 16, 32, 32, 32, 16, 15, 0, 8, 248, 8, 8, 8, 8, 240
        DC8 0, 32, 63, 33, 1, 1, 1, 0, 0, 224, 16, 8, 8, 8, 16, 224, 0, 15, 24
        DC8 36, 36, 56, 80, 79, 0, 8, 248, 136, 136, 136, 136, 112, 0, 32, 63
        DC8 32, 0, 3, 12, 48, 32, 0, 112, 136, 8, 8, 8, 56, 0, 0, 56, 32, 33
        DC8 33, 34, 28, 0, 24, 8, 8, 248, 8, 8, 24, 0, 0, 0, 32, 63, 32, 0, 0
        DC8 0, 8, 248, 8, 0, 0, 8, 248, 8, 0, 31, 32, 32, 32, 32, 31, 0, 8, 120
        DC8 136, 0, 0, 200, 56, 8, 0, 0, 7, 56, 14, 1, 0, 0, 248, 8, 0, 248, 0
        DC8 8, 248, 0, 3, 60, 7, 0, 7, 60, 3, 0, 8, 24, 104, 128, 128, 104, 24
        DC8 8, 32, 48, 44, 3, 3, 44, 48, 32, 8, 56, 200, 0, 200, 56, 8, 0, 0, 0
        DC8 32, 63, 32, 0, 0, 0, 16, 8, 8, 8, 200, 56, 8, 0, 32, 56, 38, 33, 32
        DC8 32, 24, 0, 0, 0, 0, 254, 2, 2, 2, 0, 0, 0, 0, 127, 64, 64, 64, 0, 0
        DC8 12, 48, 192, 0, 0, 0, 0, 0, 0, 0, 1, 6, 56, 192, 0, 0, 2, 2, 2, 254
        DC8 0, 0, 0, 0, 64, 64, 64, 127, 0, 0, 0, 0, 0, 4, 2, 2, 2, 4, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 128, 128, 0, 2, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 128, 128, 128, 128, 0, 0, 0, 25, 36, 34, 34, 34, 63, 32, 8, 248, 0
        DC8 128, 128, 0, 0, 0, 0, 63, 17, 32, 32, 17, 14, 0, 0, 0, 0, 128, 128
        DC8 128, 0, 0, 0, 14, 17, 32, 32, 32, 17, 0, 0, 0, 0, 128, 128, 136
        DC8 248, 0, 0, 14, 17, 32, 32, 16, 63, 32, 0, 0, 128, 128, 128, 128, 0
        DC8 0, 0, 31, 34, 34, 34, 34, 19, 0, 0, 128, 128, 240, 136, 136, 136
        DC8 24, 0, 32, 32, 63, 32, 32, 0, 0, 0, 0, 128, 128, 128, 128, 128, 0
        DC8 0, 107, 148, 148, 148, 147, 96, 0, 8, 248, 0, 128, 128, 128, 0, 0
        DC8 32, 63, 33, 0, 0, 32, 63, 32, 0, 128, 152, 152, 0, 0, 0, 0, 0, 32
        DC8 32, 63, 32, 32, 0, 0, 0, 0, 0, 128, 152, 152, 0, 0, 0, 192, 128
        DC8 128, 128, 127, 0, 0, 8, 248, 0, 0, 128, 128, 128, 0, 32, 63, 36, 2
        DC8 45, 48, 32, 0, 0, 8, 8, 248, 0, 0, 0, 0, 0, 32, 32, 63, 32, 32, 0
        DC8 0, 128, 128, 128, 128, 128, 128, 128, 0, 32, 63, 32, 0, 63, 32, 0
        DC8 63, 128, 128, 0, 128, 128, 128, 0, 0, 32, 63, 33, 0, 0, 32, 63, 32
        DC8 0, 0, 128, 128, 128, 128, 0, 0, 0, 31, 32, 32, 32, 32, 31, 0, 128
        DC8 128, 0, 128, 128, 0, 0, 0, 128, 255, 161, 32, 32, 17, 14, 0, 0, 0
        DC8 0, 128, 128, 128, 128, 0, 0, 14, 17, 32, 32, 160, 255, 128, 128
        DC8 128, 128, 0, 128, 128, 128, 0, 32, 32, 63, 33, 32, 0, 1, 0, 0, 0
        DC8 128, 128, 128, 128, 128, 0, 0, 51, 36, 36, 36, 36, 25, 0, 0, 128
        DC8 128, 224, 128, 128, 0, 0, 0, 0, 0, 31, 32, 32, 0, 0, 128, 128, 0, 0
        DC8 0, 128, 128, 0, 0, 31, 32, 32, 32, 16, 63, 32, 128, 128, 128, 0, 0
        DC8 128, 128, 128, 0, 1, 14, 48, 8, 6, 1, 0, 128, 128, 0, 128, 0, 128
        DC8 128, 128, 15, 48, 12, 3, 12, 48, 15, 0, 0, 128, 128, 0, 128, 128
        DC8 128, 0, 0, 32, 49, 46, 14, 49, 32, 0, 128, 128, 128, 0, 0, 128, 128
        DC8 128, 128, 129, 142, 112, 24, 6, 1, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 0, 0, 33, 48, 44, 34, 33, 48, 0, 0, 0, 0, 0, 128, 124, 2, 2, 0
        DC8 0, 0, 0, 0, 63, 64, 64, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 255
        DC8 0, 0, 0, 0, 2, 2, 124, 128, 0, 0, 0, 0, 64, 64, 63, 0, 0, 0, 0, 0
        DC8 6, 1, 1, 2, 2, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
OverLoad:
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128
        DC8 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 0, 0, 0
        DC8 128, 192, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128
        DC8 192, 192, 192, 192, 192, 192, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 96, 96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 24, 28, 12, 14, 6, 6, 6, 6, 6, 7, 2, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 128, 128, 0, 0, 0, 2, 3, 3, 1, 1, 1, 1, 1, 1
        DC8 1, 1, 1, 1, 1, 3, 7, 14, 15, 7, 1, 0, 0, 0, 0, 0, 0, 0, 0, 96, 96
        DC8 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 3, 7, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 14, 6, 7, 3, 3, 3, 102, 110, 28
        DC8 24, 24, 24, 24, 30, 15, 3, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 32, 48, 56, 24, 28, 12, 28, 120, 240, 192, 224, 120, 62, 15, 2, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8, 12, 12, 14, 6, 6, 6, 6, 6, 7
        DC8 3, 3, 7, 62, 252, 224, 192, 192, 240, 126, 30, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 192, 240, 248, 252, 60, 30, 14, 14, 14, 30, 30, 124, 248
        DC8 248, 224, 0, 0, 0, 128, 128, 128, 0, 0, 0, 0, 0, 0, 0, 128, 128
        DC8 128, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128, 0, 0, 0, 0, 0, 0
        DC8 0, 128, 128, 128, 128, 0, 0, 128, 128, 128, 128, 0, 0, 0, 254, 254
        DC8 254, 254, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128, 128, 0
        DC8 0, 0, 0, 0, 0, 0, 1, 1, 1, 128, 128, 128, 128, 128, 128, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 0, 0, 254, 254, 254, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 255, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 255, 255, 255, 0, 0, 0, 1, 15, 63, 255, 248, 192, 0, 128, 240
        DC8 254, 127, 15, 3, 0, 0, 0, 248, 254, 255, 239, 231, 227, 227, 227
        DC8 231, 255, 254, 252, 192, 0, 0, 0, 255, 255, 255, 255, 6, 7, 3, 3, 7
        DC8 3, 1, 0, 0, 255, 255, 255, 255, 0, 0, 0, 0, 0, 252, 254, 255, 15, 7
        DC8 3, 3, 7, 7, 255, 255, 254, 224, 0, 0, 0, 128, 195, 199, 231, 227
        DC8 227, 227, 231, 239, 255, 254, 252, 0, 0, 0, 0, 252, 255, 255, 15, 7
        DC8 3, 3, 7, 14, 255, 255, 255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
        DC8 7, 15, 31, 30, 60, 56, 56, 56, 60, 60, 31, 15, 15, 3, 0, 0, 192
        DC8 192, 0, 0, 1, 15, 63, 63, 63, 15, 1, 0, 0, 0, 0, 0, 0, 3, 15, 31
        DC8 30, 60, 56, 56, 56, 60, 28, 28, 8, 0, 0, 0, 0, 63, 63, 63, 63, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 15, 31, 63, 63, 56, 56, 0, 0, 0, 7, 15, 31, 62
        DC8 60, 56, 56, 60, 60, 31, 31, 15, 0, 0, 0, 0, 31, 31, 63, 56, 56, 56
        DC8 56, 24, 28, 63, 63, 63, 0, 0, 0, 0, 7, 31, 31, 62, 60, 56, 56, 28
        DC8 14, 63, 63, 63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 24, 24, 0, 0, 0, 0, 0, 128
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 192, 128, 0, 0, 0, 0
        DC8 0, 0, 0, 24, 24, 0, 0, 0, 0, 0, 12, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 48, 48, 0, 0, 0, 0, 0, 0, 96, 96, 0, 0, 0, 0, 0, 0, 0, 48, 48, 0
        DC8 0, 24, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
// 
// 6 002 bytes in section .text
// 
// 6 002 bytes of CODE memory
//
//Errors: none
//Warnings: none