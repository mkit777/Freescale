///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      17/May/2018  19:45:48
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\workspace\LPLD_OSKinetis_V3\lib\common\stdlib.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EW758B.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\lib\common\stdlib.c -D LPLD_K60 -D
//        USE_K60DZ10 -lCN
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\stdlib.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC isalnum
        PUBLIC isdigit
        PUBLIC isspace
        PUBLIC isupper
        PUBLIC memcpy
        PUBLIC memset
        PUBLIC strcasecmp
        PUBLIC strcat
        PUBLIC strcmp
        PUBLIC strcpy
        PUBLIC strlen
        PUBLIC strncasecmp
        PUBLIC strncat
        PUBLIC strncmp
        PUBLIC strncpy
        PUBLIC strtoul

// D:\workspace\LPLD_OSKinetis_V3\lib\common\stdlib.c
//    1 /**
//    2  * @file stdlib.c
//    3  * @version 3.01[By LPLD]
//    4  * @date 2013-11-4
//    5  * @brief C标准代码库
//    6  *
//    7  * 更改建议:不建议修改
//    8  *
//    9  * 由标准C代码库移植，仅支持ASCII
//   10  *
//   11  * 版权所有:北京拉普兰德电子技术有限公司
//   12  * http://www.lpld.cn
//   13  * mail:support@lpld.cn
//   14  *
//   15  * @par
//   16  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   17  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   18  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   19  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   20  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   21  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   22  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   23  */
//   24 #include "stdlib.h"
//   25 
//   26 
//   27 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   28 int isspace (int ch)
//   29 {
//   30     if ((ch == ' ') || (ch == '\t'))    /* \n ??? */
isspace:
        CMP      R0,#+32
        BEQ.N    ??isspace_0
        CMP      R0,#+9
        BNE.N    ??isspace_1
//   31         return TRUE;
??isspace_0:
        MOVS     R0,#+1
        BX       LR
//   32     else
//   33         return FALSE;
??isspace_1:
        MOVS     R0,#+0
        BX       LR               ;; return
//   34 }
//   35 
//   36 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   37 int isalnum (int ch)
//   38 {
//   39     /* ASCII only */
//   40     if (((ch >= '0') && (ch <= '9')) ||
//   41         ((ch >= 'A') && (ch <= 'Z')) ||
//   42         ((ch >= 'a') && (ch <= 'z')))
isalnum:
        SUB      R1,R0,#+48
        CMP      R1,#+10
        BCC.N    ??isalnum_0
        SUB      R1,R0,#+65
        CMP      R1,#+26
        BCC.N    ??isalnum_0
        SUBS     R0,R0,#+97
        CMP      R0,#+26
        BCS.N    ??isalnum_1
//   43         return TRUE;
??isalnum_0:
        MOVS     R0,#+1
        BX       LR
//   44     else
//   45         return FALSE;
??isalnum_1:
        MOVS     R0,#+0
        BX       LR               ;; return
//   46 }
//   47 
//   48 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   49 int isdigit (int ch)
//   50 {
//   51     /* ASCII only */
//   52     if ((ch >= '0') && (ch <= '9'))
isdigit:
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        SBCS     R0,R0,R0
        LSRS     R0,R0,#+31
//   53         return TRUE;
//   54     else
//   55         return FALSE;
        BX       LR               ;; return
//   56 }
//   57 
//   58 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   59 int isupper (int ch)
//   60 {
//   61     /* ASCII only */
//   62     if ((ch >= 'A') && (ch <= 'Z'))
isupper:
        SUBS     R0,R0,#+65
        CMP      R0,#+26
        SBCS     R0,R0,R0
        LSRS     R0,R0,#+31
//   63         return TRUE;
//   64     else
//   65         return FALSE;
        BX       LR               ;; return
//   66 }
//   67 
//   68 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   69 int strcasecmp (const int8 *s1, const int8 *s2)
//   70 {
strcasecmp:
        PUSH     {R4}
        MOV      R4,R0
//   71     int8    c1, c2;
//   72     int     result = 0;
        MOVS     R0,#+0
//   73 
//   74     while (result == 0)
??strcasecmp_0:
        CMP      R0,#+0
        BNE.N    ??strcasecmp_1
//   75     {
//   76         c1 = *s1++;
        LDRSB    R3,[R4], #+1
//   77         c2 = *s2++;
        LDRSB    R2,[R1], #+1
//   78         if ((c1 >= 'a') && (c1 <= 'z'))
        SUB      R0,R3,#+97
        CMP      R0,#+26
        BCS.N    ??strcasecmp_2
//   79             c1 = (int8)(c1 - ' ');
        SUBS     R3,R3,#+32
        SXTB     R3,R3
//   80         if ((c2 >= 'a') && (c2 <= 'z'))
??strcasecmp_2:
        SUB      R0,R2,#+97
        CMP      R0,#+26
        BCS.N    ??strcasecmp_3
//   81             c2 = (int8)(c2 - ' ');
        SUBS     R2,R2,#+32
        SXTB     R2,R2
//   82         if ((result = (c1 - c2)) != 0)
??strcasecmp_3:
        SUBS     R0,R3,R2
        BNE.N    ??strcasecmp_1
//   83             break;
//   84         if ((c1 == 0) || (c2 == 0))
        CMP      R3,#+0
        BEQ.N    ??strcasecmp_1
        CMP      R2,#+0
        BNE.N    ??strcasecmp_0
//   85             break;
//   86     }
//   87     return result;
??strcasecmp_1:
        POP      {R4}
        BX       LR               ;; return
//   88 }
//   89 
//   90 
//   91 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   92 int strncasecmp (const int8 *s1, const int8 *s2, int n)
//   93 {
strncasecmp:
        PUSH     {R4-R6}
        MOV      R5,R0
//   94     int8    c1, c2;
//   95     int     k = 0;
        MOVS     R6,#+0
//   96     int     result = 0;
        MOV      R0,R6
//   97 
//   98     while ( k++ < n )
??strncasecmp_0:
        MOV      R3,R6
        ADDS     R6,R3,#+1
        CMP      R3,R2
        BGE.N    ??strncasecmp_1
//   99     {
//  100         c1 = *s1++;
        LDRSB    R4,[R5], #+1
//  101         c2 = *s2++;
        LDRSB    R3,[R1], #+1
//  102         if ((c1 >= 'a') && (c1 <= 'z'))
        SUB      R0,R4,#+97
        CMP      R0,#+26
        BCS.N    ??strncasecmp_2
//  103             c1 = (int8)(c1 - ' ');
        SUBS     R4,R4,#+32
        SXTB     R4,R4
//  104         if ((c2 >= 'a') && (c2 <= 'z'))
??strncasecmp_2:
        SUB      R0,R3,#+97
        CMP      R0,#+26
        BCS.N    ??strncasecmp_3
//  105             c2 = (int8)(c2 - ' ');
        SUBS     R3,R3,#+32
        SXTB     R3,R3
//  106         if ((result = (c1 - c2)) != 0)
??strncasecmp_3:
        SUBS     R0,R4,R3
        BNE.N    ??strncasecmp_1
//  107             break;
//  108         if ((c1 == 0) || (c2 == 0))
        CMP      R4,#+0
        BEQ.N    ??strncasecmp_1
        CMP      R3,#+0
        BNE.N    ??strncasecmp_0
//  109             break;
//  110     }
//  111     return result;
??strncasecmp_1:
        POP      {R4-R6}
        BX       LR               ;; return
//  112 }
//  113 
//  114 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  115 unsigned long strtoul (int8 *str, int8 **ptr, int base)
//  116 {
strtoul:
        PUSH     {R3-R11,LR}
        MOV      R7,R0
        MOV      R4,R1
        MOV      R5,R2
//  117     unsigned long rvalue;
//  118     int c, err, neg;
//  119     int8 *endp;
//  120     int8 *startp;
//  121 
//  122     rvalue = 0;  err = 0;  neg = 0;
        MOV      R11,#+0
        MOV      R8,R11
        MOV      R6,R8
//  123 
//  124     /* Check for invalid arguments */
//  125     if ((str == NULL) || (base < 0) || (base == 1) || (base > 36))
        CMP      R7,#+0
        BEQ.N    ??strtoul_0
        CMP      R5,#+0
        BMI.N    ??strtoul_0
        CMP      R5,#+1
        BEQ.N    ??strtoul_0
        CMP      R5,#+37
        BLT.N    ??strtoul_1
//  126     {
//  127         if (ptr != NULL)
??strtoul_0:
        CMP      R4,#+0
        BEQ.N    ??strtoul_2
//  128         {
//  129             *ptr = str;
        STR      R7,[R4, #+0]
        B.N      ??strtoul_2
//  130         }
//  131         return 0;
//  132     }
//  133 
//  134     /* Skip leading white spaces */
//  135     for (startp = str; isspace(*startp); ++startp)
??strtoul_1:
        MOV      R10,R7
        B.N      ??strtoul_3
??strtoul_4:
        ADD      R10,R10,#+1
??strtoul_3:
        LDRSB    R0,[R10, #+0]
        BL       isspace
        CMP      R0,#+0
        BNE.N    ??strtoul_4
//  136         ;
//  137 
//  138     /* Check for notations */
//  139     switch (startp[0])
        LDRSB    R0,[R10, #+0]
        CMP      R0,#+45
        BEQ.N    ??strtoul_5
        CMP      R0,#+48
        BNE.N    ??strtoul_6
//  140     {
//  141         case '0':
//  142             if ((startp[1] == 'x') || (startp[1] == 'X'))
        LDRSB    R0,[R10, #+1]
        CMP      R0,#+120
        BEQ.N    ??strtoul_7
        CMP      R0,#+88
        BNE.N    ??strtoul_6
//  143             {
//  144                 if ((base == 0) || (base == 16))
??strtoul_7:
        CMP      R5,#+0
        BEQ.N    ??strtoul_8
        CMP      R5,#+16
        BNE.N    ??strtoul_6
//  145                 {
//  146                     base = 16;
??strtoul_8:
        MOVS     R5,#+16
//  147                     startp = &startp[2];
        ADD      R10,R10,#+2
        B.N      ??strtoul_6
//  148                 }
//  149             }
//  150             break;
//  151         case '-':
//  152             neg = 1;
??strtoul_5:
        MOVS     R6,#+1
//  153             startp = &startp[1];
        ADD      R10,R10,#+1
//  154             break;
//  155         default:
//  156             break;
//  157     }
//  158 
//  159     if (base == 0)
??strtoul_6:
        CMP      R5,#+0
        BNE.N    ??strtoul_9
//  160         base = 10;
        MOVS     R5,#+10
//  161 
//  162     /* Check for invalid chars in str */
//  163     for ( endp = startp; (c = *endp) != '\0'; ++endp)
??strtoul_9:
        MOV      R9,R5
        MOV      R5,R6
        B.N      ??strtoul_10
//  164     {
//  165         /* Check for 0..9,Aa-Zz */
//  166         if (!isalnum(c))
//  167         {
//  168             err = 1;
//  169             break;
//  170         }
//  171 
//  172         /* Convert int8 to num in 0..36 */
//  173         if (isdigit(c))
//  174         {
//  175             c = c - '0';
//  176         }
//  177         else
//  178         {
//  179             if (isupper(c))
//  180             {
//  181                 c = c - 'A' + 10;
//  182             }
//  183             else
//  184             {
//  185                 c = c - 'a' + 10;
//  186             }
//  187         }
//  188 
//  189         /* check c against base */
//  190         if (c >= base)
//  191         {
//  192             err = 1;
//  193             break;
//  194         }
//  195 
//  196         if (neg)
//  197         {
//  198             rvalue = (rvalue * base) - c;
//  199         }
//  200         else
//  201         {
//  202             rvalue = (rvalue * base) + c;
??strtoul_11:
        ADD      R11,R6,R11
        B.N      ??strtoul_12
//  203         }
??strtoul_13:
        SUBS     R6,R6,#+87
??strtoul_14:
        CMP      R6,R9
        BGE.N    ??strtoul_15
        MUL      R11,R9,R11
        MOV      R0,R11
        CMP      R5,#+0
        BEQ.N    ??strtoul_11
        MOV      R11,R6
        SUB      R11,R0,R11
??strtoul_12:
        ADD      R10,R10,#+1
??strtoul_10:
        LDRSB    R6,[R10, #+0]
        CMP      R6,#+0
        BEQ.N    ??strtoul_16
        MOV      R0,R6
        BL       isalnum
        CMP      R0,#+0
        BEQ.N    ??strtoul_15
        MOV      R0,R6
        BL       isdigit
        CMP      R0,#+0
        BEQ.N    ??strtoul_17
        SUBS     R6,R6,#+48
        B.N      ??strtoul_14
??strtoul_17:
        MOV      R0,R6
        BL       isupper
        CMP      R0,#+0
        BEQ.N    ??strtoul_13
        SUBS     R6,R6,#+55
        B.N      ??strtoul_14
//  204     }
//  205 
//  206     /* Upon exit, endp points to the character at which valid info */
//  207     /* STOPS.  No chars including and beyond endp are used.        */
//  208 
//  209     if (ptr != NULL)
//  210         *ptr = endp;
//  211 
//  212     if (err)
//  213     {
//  214         if (ptr != NULL)
//  215             *ptr = str;
//  216         
//  217         return 0;
//  218     }
//  219     else
//  220     {
//  221         return rvalue;
??strtoul_18:
        POP      {R1,R4-R11,PC}   ;; return
//  222     }
??strtoul_16:
        MOV      R0,R11
        B.N      ??strtoul_19
??strtoul_15:
        MOV      R0,R11
        MOVS     R1,#+1
        MOV      R8,R1
??strtoul_19:
        CMP      R4,#+0
        BEQ.N    ??strtoul_20
        STR      R10,[R4, #+0]
??strtoul_20:
        CMP      R8,#+0
        BEQ.N    ??strtoul_18
        CMP      R4,#+0
        BEQ.N    ??strtoul_2
        STR      R7,[R4, #+0]
??strtoul_2:
        MOVS     R0,#+0
        B.N      ??strtoul_18
//  223 }
//  224 
//  225 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  226 int strlen (const int8 *str)
//  227 {
strlen:
        MOV      R1,R0
//  228     int8 *s = (int8 *)str;
//  229     int len = 0;
        MOVS     R0,#+0
//  230 
//  231     if (s == NULL)
        CMP      R1,#+0
        BNE.N    ??strlen_0
//  232         return 0;
        BX       LR
//  233 
//  234     while (*s++ != '\0')
//  235         ++len;
??strlen_1:
        ADDS     R0,R0,#+1
??strlen_0:
        LDRSB    R2,[R1], #+1
        CMP      R2,#+0
        BNE.N    ??strlen_1
//  236 
//  237     return len;
        BX       LR               ;; return
//  238 }
//  239 
//  240 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  241 int8 * strcat (int8 *dest, const int8 *src)
//  242 {
strcat:
        PUSH     {R3-R5,LR}
        MOV      R4,R0
//  243     int8 *dp;
//  244     int8 *sp = (int8 *)src;
        MOV      R5,R1
//  245 
//  246     if ((dest != NULL) && (src != NULL))
        CMP      R4,#+0
        BEQ.N    ??strcat_0
        CMP      R1,#+0
        BEQ.N    ??strcat_0
//  247     {
//  248         dp = &dest[strlen(dest)];
        BL       strlen
        ADDS     R1,R4,R0
        B.N      ??strcat_1
//  249 
//  250         while (*sp != '\0')
//  251         {
//  252             *dp++ = *sp++;
??strcat_2:
        LDRB     R0,[R5], #+1
        STRB     R0,[R1], #+1
//  253         }
??strcat_1:
        LDRSB    R0,[R5, #+0]
        CMP      R0,#+0
        BNE.N    ??strcat_2
//  254         *dp = '\0';
        MOVS     R0,#+0
        STRB     R0,[R1, #+0]
//  255     }
//  256     return dest;
??strcat_0:
        MOV      R0,R4
        POP      {R1,R4,R5,PC}    ;; return
//  257 }
//  258 
//  259 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  260 int8 * strncat (int8 *dest, const int8 *src, int n)
//  261 {
strncat:
        PUSH     {R4-R6,LR}
        MOV      R4,R0
        MOV      R5,R2
//  262     int8 *dp;
//  263     int8 *sp = (int8 *)src;
        MOV      R6,R1
//  264 
//  265     if ((dest != NULL) && (src != NULL) && (n > 0))
        CMP      R4,#+0
        BEQ.N    ??strncat_0
        CMP      R1,#+0
        BEQ.N    ??strncat_0
        CMP      R5,#+1
        BLT.N    ??strncat_0
//  266     {
//  267         dp = &dest[strlen(dest)];
        BL       strlen
        ADDS     R1,R4,R0
//  268 
//  269         while ((*sp != '\0') && (n-- > 0))
??strncat_1:
        LDRSB    R0,[R6, #+0]
        CMP      R0,#+0
        BEQ.N    ??strncat_2
        MOV      R0,R5
        SUBS     R5,R0,#+1
        BLT.N    ??strncat_2
//  270         {
//  271             *dp++ = *sp++;
        LDRB     R0,[R6], #+1
        STRB     R0,[R1], #+1
        B.N      ??strncat_1
//  272         }
//  273         *dp = '\0';
??strncat_2:
        MOVS     R0,#+0
        STRB     R0,[R1, #+0]
//  274     }
//  275     return dest;
??strncat_0:
        MOV      R0,R4
        POP      {R4-R6,PC}       ;; return
//  276 }
//  277 
//  278 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  279 int8 * strcpy (int8 *dest, const int8 *src)
//  280 {
//  281     int8 *dp = (int8 *)dest;
strcpy:
        MOV      R2,R0
//  282     int8 *sp = (int8 *)src;
        MOV      R3,R1
//  283 
//  284     if ((dest != NULL) && (src != NULL))
        CMP      R0,#+0
        BEQ.N    ??strcpy_0
        CMP      R1,#+0
        BEQ.N    ??strcpy_0
        B.N      ??strcpy_1
//  285     {
//  286         while (*sp != '\0')
//  287         {
//  288             *dp++ = *sp++;
??strcpy_2:
        LDRB     R1,[R3], #+1
        STRB     R1,[R2], #+1
//  289         }
??strcpy_1:
        LDRSB    R1,[R3, #+0]
        CMP      R1,#+0
        BNE.N    ??strcpy_2
//  290         *dp = '\0';
        MOVS     R1,#+0
        STRB     R1,[R2, #+0]
//  291     }
//  292     return dest;
??strcpy_0:
        BX       LR               ;; return
//  293 }
//  294 
//  295 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  296 int8 * strncpy (int8 *dest, const int8 *src, int n)
//  297 {
strncpy:
        PUSH     {R4}
//  298     int8 *dp = (int8 *)dest;
        MOV      R3,R0
//  299     int8 *sp = (int8 *)src;
        MOV      R4,R1
//  300 
//  301     if ((dest != NULL) && (src != NULL) && (n > 0))
        CMP      R0,#+0
        BEQ.N    ??strncpy_0
        CMP      R1,#+0
        BEQ.N    ??strncpy_0
        CMP      R2,#+1
        BLT.N    ??strncpy_0
//  302     {
//  303         while ((*sp != '\0') && (n-- > 0))
??strncpy_1:
        LDRSB    R1,[R4, #+0]
        CMP      R1,#+0
        BEQ.N    ??strncpy_2
        MOV      R1,R2
        SUBS     R2,R1,#+1
        BLT.N    ??strncpy_2
//  304         {
//  305             *dp++ = *sp++;
        LDRB     R1,[R4], #+1
        STRB     R1,[R3], #+1
        B.N      ??strncpy_1
//  306         }
//  307         *dp = '\0';
??strncpy_2:
        MOVS     R1,#+0
        STRB     R1,[R3, #+0]
//  308     }
//  309     return dest;
??strncpy_0:
        POP      {R4}
        BX       LR               ;; return
//  310 }
//  311 
//  312 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  313 int strcmp (const int8 *s1, const int8 *s2)
//  314 {
strcmp:
        MOV      R3,R0
//  315     /* No checks for NULL */
//  316     int8 *s1p = (int8 *)s1;
//  317     int8 *s2p = (int8 *)s2;
//  318 
//  319     while (*s2p != '\0')
??strcmp_0:
        LDRSB    R0,[R3, #+0]
        LDRSB    R2,[R1, #+0]
        CMP      R2,#+0
        BEQ.N    ??strcmp_1
//  320     {
//  321         if (*s1p != *s2p)
        CMP      R0,R2
        BNE.N    ??strcmp_1
//  322             break;
//  323 
//  324         ++s1p;
        ADDS     R3,R3,#+1
//  325         ++s2p;
        ADDS     R1,R1,#+1
        B.N      ??strcmp_0
//  326     }
//  327     return (*s1p - *s2p);
??strcmp_1:
        SUBS     R0,R0,R2
        BX       LR               ;; return
//  328 }
//  329 
//  330 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  331 int strncmp (const int8 *s1, const int8 *s2, int n)
//  332 {
strncmp:
        PUSH     {R4}
        MOV      R4,R0
//  333     /* No checks for NULL */
//  334     int8 *s1p = (int8 *)s1;
//  335     int8 *s2p = (int8 *)s2;
//  336 
//  337     if (n <= 0)
        CMP      R2,#+0
        BGT.N    ??strncmp_0
//  338         return 0;
        MOVS     R0,#+0
        B.N      ??strncmp_1
//  339 
//  340     while (*s2p != '\0')
//  341     {
//  342         if (*s1p != *s2p)
??strncmp_2:
        CMP      R0,R3
        BNE.N    ??strncmp_3
//  343             break;
//  344 
//  345         if (--n == 0)
        SUBS     R2,R2,#+1
        BEQ.N    ??strncmp_3
//  346             break;
//  347 
//  348         ++s1p;
        ADDS     R4,R4,#+1
//  349         ++s2p;
        ADDS     R1,R1,#+1
//  350     }
??strncmp_0:
        LDRSB    R0,[R4, #+0]
        LDRSB    R3,[R1, #+0]
        CMP      R3,#+0
        BNE.N    ??strncmp_2
//  351     return (*s1p - *s2p);
??strncmp_3:
        SUBS     R0,R0,R3
??strncmp_1:
        POP      {R4}
        BX       LR               ;; return
//  352 }
//  353 
//  354 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  355 void * memcpy (void *dest, const void *src, unsigned n)
//  356 {
memcpy:
        PUSH     {R4,R5}
//  357     int longs, bytes;
//  358     uint32 *dpl = (uint32 *)dest;
        MOV      R3,R0
//  359     uint32 *spl = (uint32 *)src;
        MOV      R4,R1
//  360     uint8  *dpb, *spb;
//  361 
//  362     if ((dest != NULL) && (src != NULL) && (n > 0))
        CMP      R0,#+0
        BEQ.N    ??memcpy_0
        CMP      R1,#+0
        BEQ.N    ??memcpy_0
        CMP      R2,#+0
        BEQ.N    ??memcpy_0
//  363     {
//  364         bytes = (n & 0x3);
        AND      R5,R2,#0x3
//  365         longs = (n - bytes) >> 2;
        SUBS     R2,R2,R5
        LSRS     R2,R2,#+2
        B.N      ??memcpy_1
//  366     
//  367         while (longs--)
//  368             *dpl++ = *spl++;
??memcpy_2:
        LDR      R1,[R4], #+4
        STR      R1,[R3], #+4
??memcpy_1:
        MOV      R1,R2
        SUBS     R2,R1,#+1
        CMP      R1,#+0
        BNE.N    ??memcpy_2
//  369         
//  370         dpb = (uint8 *)dpl;
//  371         spb = (uint8 *)spl;
        B.N      ??memcpy_3
//  372         
//  373         while (bytes--)
//  374             *dpb++ = *spb++;
??memcpy_4:
        LDRB     R1,[R4], #+1
        STRB     R1,[R3], #+1
??memcpy_3:
        MOV      R1,R5
        SUBS     R5,R1,#+1
        CMP      R1,#+0
        BNE.N    ??memcpy_4
//  375     }
//  376     return dest;
??memcpy_0:
        POP      {R4,R5}
        BX       LR               ;; return
//  377 }
//  378 
//  379 /****************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  380 void * memset (void *s, int c, unsigned n)
//  381 {
memset:
        PUSH     {R4}
//  382     /* Not optimized, but very portable */
//  383     uint8 *sp = (uint8 *)s;
        MOVS     R4,R0
//  384 
//  385     if ((s != NULL) && (n > 0))
        BEQ.N    ??memset_0
        CMP      R2,#+0
        BNE.N    ??memset_1
        B.N      ??memset_0
//  386     {
//  387         while (n--)
//  388         {
//  389             *sp++ = (uint8)c;
??memset_2:
        STRB     R1,[R4], #+1
//  390         }
??memset_1:
        MOV      R3,R2
        SUBS     R2,R3,#+1
        CMP      R3,#+0
        BNE.N    ??memset_2
//  391     }
//  392     return s;
??memset_0:
        POP      {R4}
        BX       LR               ;; return
//  393 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  394 
//  395 /****************************************************************/
// 
// 798 bytes in section .text
// 
// 798 bytes of CODE memory
//
//Errors: none
//Warnings: none
