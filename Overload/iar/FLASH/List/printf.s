///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V8.20.2.14835/W32 for ARM      17/May/2018  19:45:47
// Copyright 1999-2017 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\workspace\LPLD_OSKinetis_V3\lib\common\printf.c
//    Command line =  
//        -f C:\Users\JoyC\AppData\Local\Temp\EW7355.tmp
//        (D:\workspace\LPLD_OSKinetis_V3\lib\common\printf.c -D LPLD_K60 -D
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
//        D:\workspace\LPLD_OSKinetis_V3\project\Overload3\iar\FLASH\List\printf.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN out_char
        EXTERN strlen

        PUBLIC printf
        PUBLIC printk
        PUBLIC sprintf

// D:\workspace\LPLD_OSKinetis_V3\lib\common\printf.c
//    1 /**
//    2  * @file printf.c
//    3  * @version 3.0[By LPLD]
//    4  * @date 2013-06-18
//    5  * @brief C库标准printf()函数
//    6  *
//    7  * 更改建议:不建议修改
//    8  *
//    9  * 版权所有:北京拉普兰德电子技术有限公司
//   10  * http://www.lpld.cn
//   11  * mail:support@lpld.cn
//   12  *
//   13  * @par
//   14  * 本代码由拉普兰德[LPLD]开发并维护，并向所有使用者开放源代码。
//   15  * 开发者可以随意修使用或改源代码。但本段及以上注释应予以保留。
//   16  * 不得更改或删除原版权所有者姓名，二次开发者可以加注二次版权所有者。
//   17  * 但应在遵守此协议的基础上，开放源代码、不得出售代码本身。
//   18  * 拉普兰德不负责由于使用本代码所带来的任何事故、法律责任或相关不良影响。
//   19  * 拉普兰德无义务解释、说明本代码的具体原理、功能、实现方法。
//   20  * 除非拉普兰德[LPLD]授权，开发者不得将本代码用于商业产品。
//   21  */
//   22 
//   23 #include "common.h"
//   24 #include <stdarg.h>
//   25 
//   26 /********************************************************************/
//   27 
//   28 typedef struct
//   29 {
//   30     int32 dest;
//   31     void (*func)(int8);
//   32     int8 *loc;
//   33 } PRINTK_INFO;
//   34 
//   35 int32 
//   36 printk (PRINTK_INFO *, const int8 *, va_list);
//   37 
//   38 /********************************************************************/
//   39 
//   40 #define DEST_CONSOLE    (1)
//   41 #define DEST_STRING     (2)
//   42 
//   43 #define FLAGS_MINUS     (0x01)
//   44 #define FLAGS_PLUS      (0x02)
//   45 #define FLAGS_SPACE     (0x04)
//   46 #define FLAGS_ZERO      (0x08)
//   47 #define FLAGS_POUND     (0x10)
//   48 
//   49 #define IS_FLAG_MINUS(a)    (a & FLAGS_MINUS)
//   50 #define IS_FLAG_PLUS(a)     (a & FLAGS_PLUS)
//   51 #define IS_FLAG_SPACE(a)    (a & FLAGS_SPACE)
//   52 #define IS_FLAG_ZERO(a)     (a & FLAGS_ZERO)
//   53 #define IS_FLAG_POUND(a)    (a & FLAGS_POUND)
//   54 
//   55 #define LENMOD_h        (0x01)
//   56 #define LENMOD_l        (0x02)
//   57 #define LENMOD_L        (0x04)
//   58 
//   59 #define IS_LENMOD_h(a)  (a & LENMOD_h)
//   60 #define IS_LENMOD_l(a)  (a & LENMOD_l)
//   61 #define IS_LENMOD_L(a)  (a & LENMOD_L)
//   62 
//   63 #define FMT_d   (0x0001)
//   64 #define FMT_o   (0x0002)
//   65 #define FMT_x   (0x0004)
//   66 #define FMT_X   (0x0008)
//   67 #define FMT_u   (0x0010)
//   68 #define FMT_c   (0x0020)
//   69 #define FMT_s   (0x0040)
//   70 #define FMT_p   (0x0080)
//   71 #define FMT_n   (0x0100)
//   72 
//   73 #define IS_FMT_d(a)     (a & FMT_d)
//   74 #define IS_FMT_o(a)     (a & FMT_o)
//   75 #define IS_FMT_x(a)     (a & FMT_x)
//   76 #define IS_FMT_X(a)     (a & FMT_X)
//   77 #define IS_FMT_u(a)     (a & FMT_u)
//   78 #define IS_FMT_c(a)     (a & FMT_c)
//   79 #define IS_FMT_s(a)     (a & FMT_s)
//   80 #define IS_FMT_p(a)     (a & FMT_p)
//   81 #define IS_FMT_n(a)     (a & FMT_n)
//   82 
//   83 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   84 static void printk_putc (int32 c, int32 *count, PRINTK_INFO *info)
//   85 {
printk_putc:
        PUSH     {R4,LR}
        MOV      R4,R1
//   86     switch (info->dest)
        LDR      R1,[R2, #+0]
        CMP      R1,#+1
        BEQ.N    ??printk_putc_0
        CMP      R1,#+2
        BEQ.N    ??printk_putc_1
        B.N      ??printk_putc_2
//   87     {
//   88         case DEST_CONSOLE:
//   89             info->func((int8)c);
??printk_putc_0:
        SXTB     R0,R0
        LDR      R1,[R2, #+4]
        BLX      R1
//   90             break;
        B.N      ??printk_putc_2
//   91         case DEST_STRING:
//   92             *(info->loc) = (uint8)c;
??printk_putc_1:
        LDR      R1,[R2, #+8]
        STRB     R0,[R1, #+0]
//   93             ++(info->loc);
        LDR      R0,[R2, #+8]
        ADDS     R0,R0,#+1
        STR      R0,[R2, #+8]
//   94             break;
//   95         default:
//   96             break;
//   97     }
//   98     *count += 1;
??printk_putc_2:
        LDR      R0,[R4, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+0]
//   99 }
        POP      {R4,PC}          ;; return
//  100 
//  101 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  102 static int32 printk_mknumstr (int8 *numstr, void *nump, int32 neg, int32 radix)
//  103 {
printk_mknumstr:
        PUSH     {R4,R5}
//  104     int32 a,b,c;
//  105     uint32 ua,ub,uc;
//  106 
//  107     int32 nlen;
//  108     int8 *nstrp;
//  109 
//  110     nlen = 0;
        MOVS     R4,#+0
//  111     nstrp = numstr;
//  112     *nstrp++ = '\0';
        MOV      R5,R4
        STRB     R5,[R0], #+1
//  113 
//  114     if (neg)
        CMP      R2,#+0
        LDR      R1,[R1, #+0]
        BEQ.N    ??printk_mknumstr_0
//  115     {
//  116         a = *(int32 *)nump;
//  117         if (a == 0)
        CMP      R1,#+0
        BEQ.N    ??printk_mknumstr_1
//  118         {
//  119             *nstrp = '0';
//  120             ++nlen;
//  121             goto done;
//  122         }
//  123         while (a != 0)
??printk_mknumstr_2:
        CMP      R1,#+0
        BEQ.N    ??printk_mknumstr_3
//  124         {
//  125             b = (int32)a / (int32)radix;
        SDIV     R5,R1,R3
//  126             c = (int32)a - ((int32)b * (int32)radix);
        MLS      R1,R3,R5,R1
//  127             if (c < 0)
        CMP      R1,#+0
        BMI.N    ??printk_mknumstr_4
//  128             {
//  129                 c = ~c + 1 + '0';
//  130             }
//  131             else
//  132             {
//  133                 c = c + '0';
        ADDS     R1,R1,#+48
        MOV      R2,R1
        B.N      ??printk_mknumstr_5
//  134             }
??printk_mknumstr_4:
        MVNS     R1,R1
        ADDS     R1,R1,#+49
        MOV      R2,R1
//  135             a = b;
??printk_mknumstr_5:
        MOV      R1,R5
//  136             *nstrp++ = (int8)c;
        STRB     R2,[R0], #+1
//  137             ++nlen;
        ADDS     R4,R4,#+1
        B.N      ??printk_mknumstr_2
//  138         }
//  139     }
//  140     else
//  141     {
//  142         ua = *(uint32 *)nump;
//  143         if (ua == 0)
??printk_mknumstr_0:
        CMP      R1,#+0
        BNE.N    ??printk_mknumstr_6
//  144         {
//  145             *nstrp = '0';
??printk_mknumstr_1:
        MOVS     R1,#+48
        STRB     R1,[R0, #+0]
//  146             ++nlen;
        MOVS     R4,#+1
//  147             goto done;
//  148         }
//  149         while (ua != 0)
//  150         {
//  151             ub = (uint32)ua / (uint32)radix;
//  152             uc = (uint32)ua - ((uint32)ub * (uint32)radix);
//  153             if (uc < 10)
//  154             {
//  155                 uc = uc + '0';
//  156             }
//  157             else
//  158             {
//  159                 uc = uc - 10 + 'A';
//  160             }
//  161             ua = ub;
//  162             *nstrp++ = (int8)uc;
//  163             ++nlen;
//  164         }
//  165     }
//  166     done:
//  167     return nlen;
??printk_mknumstr_3:
        MOV      R0,R4
        POP      {R4,R5}
        BX       LR               ;; return
??printk_mknumstr_7:
        ADDS     R1,R1,#+55
        MOV      R2,R1
        B.N      ??printk_mknumstr_8
??printk_mknumstr_9:
        UDIV     R5,R1,R3
        MLS      R1,R3,R5,R1
        CMP      R1,#+10
        BCS.N    ??printk_mknumstr_7
        ADDS     R1,R1,#+48
        MOV      R2,R1
??printk_mknumstr_8:
        MOV      R1,R5
        STRB     R2,[R0], #+1
        ADDS     R4,R4,#+1
??printk_mknumstr_6:
        CMP      R1,#+0
        BEQ.N    ??printk_mknumstr_3
        B.N      ??printk_mknumstr_9
//  168 }
//  169 
//  170 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  171 static void printk_pad_zero (int32 curlen, int32 field_width, int32 *count, PRINTK_INFO *info)
//  172 {
printk_pad_zero:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOV      R6,R2
        MOV      R7,R3
//  173     int32 i;
//  174 
//  175     for (i = curlen; i < field_width; i++)
        B.N      ??printk_pad_zero_0
//  176     {
//  177         printk_putc('0',count, info);
??printk_pad_zero_1:
        MOV      R2,R7
        MOV      R1,R6
        MOVS     R0,#+48
        BL       printk_putc
//  178     }
        ADDS     R4,R4,#+1
??printk_pad_zero_0:
        CMP      R4,R5
        BLT.N    ??printk_pad_zero_1
//  179 }
        POP      {R0,R4-R7,PC}    ;; return
//  180 
//  181 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  182 static void
//  183 printk_pad_space (int32 curlen, int32 field_width, int32 *count, PRINTK_INFO *info)
//  184 {
printk_pad_space:
        PUSH     {R3-R7,LR}
        MOV      R4,R0
        MOV      R5,R1
        MOV      R6,R2
        MOV      R7,R3
//  185     int32 i;
//  186 
//  187     for (i = curlen; i < field_width; i++)
        B.N      ??printk_pad_space_0
//  188     {
//  189         printk_putc(' ',count, info);
??printk_pad_space_1:
        MOV      R2,R7
        MOV      R1,R6
        MOVS     R0,#+32
        BL       printk_putc
//  190     }
        ADDS     R4,R4,#+1
??printk_pad_space_0:
        CMP      R4,R5
        BLT.N    ??printk_pad_space_1
//  191 }
        POP      {R0,R4-R7,PC}    ;; return
//  192 
//  193 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  194 int32 printk (PRINTK_INFO *info, const int8 *fmt, va_list ap)
//  195 {
printk:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+52
        MOV      R9,R0
        MOV      R7,R2
//  196     /* va_list ap; */
//  197     int8 *p;
//  198     int32 c;
//  199 
//  200     int8 vstr[33];
//  201     int8 *vstrp;
//  202     int32 vlen;
//  203 
//  204     int32 done;
//  205     int32 count = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  206 
//  207     int32 flags_used;
//  208     int32 field_width;
//  209 #if 0
//  210     int32 precision_used;
//  211     int32 precision_width;
//  212     int32 length_modifier;
//  213 #endif
//  214 
//  215     int32 ival;
//  216     int32 schar, dschar;
//  217     int32 *ivalp;
//  218     int8 *sval;
//  219     int32 cval;
//  220     uint32 uval;
//  221 
//  222     /*
//  223      * Start parsing apart the format string and display appropriate
//  224      * formats and data.
//  225      */
//  226     for (p = (int8 *)fmt; (c = *p) != 0; p++)
        MOV      R8,R1
        B.N      ??printk_0
//  227     {
//  228         /*
//  229          * All formats begin with a '%' marker.  Special chars like
//  230          * '\n' or '\t' are normally converted to the appropriate
//  231          * character by the __compiler__.  Thus, no need for this
//  232          * routine to account for the '\' character.
//  233          */
//  234         if (c != '%')
//  235         {
//  236             /*
//  237              * This needs to be replaced with something like
//  238              * 'out_char()' or call an OS routine.
//  239              */
//  240 #ifndef UNIX_DEBUG
//  241             if (c != '\n')
//  242             {
//  243                 printk_putc(c, &count, info);
//  244             }
//  245             else
//  246             {
//  247                 printk_putc(0x0D /* CR */, &count, info);
//  248                 printk_putc(0x0A /* LF */, &count, info);
//  249             }
//  250 #else
//  251             printk_putc(c, &count, info);
//  252 #endif
//  253 
//  254             /*
//  255              * By using 'continue', the next iteration of the loop
//  256              * is used, skipping the code that follows.
//  257              */
//  258             continue;
//  259         }
//  260 
//  261         /*
//  262          * First check for specification modifier flags.
//  263          */
//  264         flags_used = 0;
//  265         done = FALSE;
//  266         while (!done)
//  267         {
//  268             switch (/* c = */ *++p)
//  269             {
//  270                 case '-':
//  271                     flags_used |= FLAGS_MINUS;
//  272                     break;
//  273                 case '+':
//  274                     flags_used |= FLAGS_PLUS;
//  275                     break;
//  276                 case ' ':
//  277                     flags_used |= FLAGS_SPACE;
//  278                     break;
//  279                 case '0':
//  280                     flags_used |= FLAGS_ZERO;
//  281                     break;
//  282                 case '#':
//  283                     flags_used |= FLAGS_POUND;
//  284                     break;
//  285                 default:
//  286                     /* we've gone one int8 too far */
//  287                     --p;
//  288                     done = TRUE;
//  289                     break;
//  290             }
//  291         }
//  292 
//  293         /*
//  294          * Next check for minimum field width.
//  295          */
//  296         field_width = 0;
//  297         done = FALSE;
//  298         while (!done)
//  299         {
//  300             switch (c = *++p)
//  301             {
//  302                 case '0':
//  303                 case '1':
//  304                 case '2':
//  305                 case '3':
//  306                 case '4':
//  307                 case '5':
//  308                 case '6':
//  309                 case '7':
//  310                 case '8':
//  311                 case '9':
//  312                     field_width = (field_width * 10) + (c - '0');
//  313                     break;
//  314                 default:
//  315                     /* we've gone one int8 too far */
//  316                     --p;
//  317                     done = TRUE;
//  318                     break;
//  319             }
//  320         }
//  321 
//  322         /*
//  323          * Next check for the width and precision field separator.
//  324          */
//  325         if (/* (c = *++p) */ *++p == '.')
//  326         {
//  327             /* precision_used = TRUE; */
//  328 
//  329             /*
//  330              * Must get precision field width, if present.
//  331              */
//  332             /* precision_width = 0; */
//  333             done = FALSE;
//  334             while (!done)
//  335             {
//  336                 switch (/* c = uncomment if used below */ *++p)
//  337                 {
//  338                     case '0':
//  339                     case '1':
//  340                     case '2':
//  341                     case '3':
//  342                     case '4':
//  343                     case '5':
//  344                     case '6':
//  345                     case '7':
//  346                     case '8':
//  347                     case '9':
//  348 #if 0
//  349                         precision_width = (precision_width * 10) +
//  350                             (c - '0');
//  351 #endif
//  352                         break;
//  353                     default:
//  354                         /* we've gone one int8 too far */
//  355                         --p;
//  356                         done = TRUE;
//  357                         break;
//  358                 }
//  359             }
//  360         }
//  361         else
//  362         {
//  363             /* we've gone one int8 too far */
//  364             --p;
//  365 #if 0
//  366             precision_used = FALSE;
//  367             precision_width = 0;
//  368 #endif
//  369         }
//  370 
//  371         /*
//  372          * Check for the length modifier.
//  373          */
//  374         /* length_modifier = 0; */
//  375         switch (/* c = */ *++p)
//  376         {
//  377             case 'h':
//  378                 /* length_modifier |= LENMOD_h; */
//  379                 break;
//  380             case 'l':
//  381                 /* length_modifier |= LENMOD_l; */
//  382                 break;
//  383             case 'L':
//  384                 /* length_modifier |= LENMOD_L; */
//  385                 break;
//  386             default:
//  387                 /* we've gone one int8 too far */
//  388                 --p;
//  389                 break;
//  390         }
//  391 
//  392         /*
//  393          * Now we're ready to examine the format.
//  394          */
//  395         switch (c = *++p)
//  396         {
//  397             case 'd':
//  398             case 'i':
//  399                 ival = (int32)va_arg(ap, int32);
//  400                 vlen = printk_mknumstr(vstr,&ival,TRUE,10);
//  401                 vstrp = &vstr[vlen];
//  402 
//  403                 if (ival < 0)
//  404                 {
//  405                     schar = '-';
//  406                     ++vlen;
//  407                 }
//  408                 else
//  409                 {
//  410                     if (IS_FLAG_PLUS(flags_used))
//  411                     {
//  412                         schar = '+';
//  413                         ++vlen;
//  414                     }
//  415                     else
//  416                     {
//  417                         if (IS_FLAG_SPACE(flags_used))
//  418                         {
//  419                             schar = ' ';
//  420                             ++vlen;
//  421                         }
//  422                         else
//  423                         {
//  424                             schar = 0;
//  425                         }
//  426                     }
//  427                 }
//  428                 dschar = FALSE;
//  429             
//  430                 /*
//  431                  * do the ZERO pad.
//  432                  */
//  433                 if (IS_FLAG_ZERO(flags_used))
//  434                 {
//  435                     if (schar)
//  436                         printk_putc(schar, &count, info);
//  437                     dschar = TRUE;
//  438             
//  439                     printk_pad_zero (vlen, field_width, &count, info);
//  440                     vlen = field_width;
//  441                 }
//  442                 else
//  443                 {
//  444                     if (!IS_FLAG_MINUS(flags_used))
//  445                     {
//  446                         printk_pad_space (vlen, field_width, &count, info);
//  447             
//  448                         if (schar)
//  449                             printk_putc(schar, &count, info);
//  450                         dschar = TRUE;
//  451                     }
//  452                 }
//  453             
//  454                 /* the string was built in reverse order, now display in */
//  455                 /* correct order */
//  456                 if (!dschar && schar)
//  457                 {
//  458                     printk_putc(schar, &count, info);
//  459                 }
//  460                 goto cont_xd;
//  461 
//  462             case 'x':
//  463             case 'X':
//  464                 uval = (uint32)va_arg(ap, uint32);
//  465                 vlen = printk_mknumstr(vstr,&uval,FALSE,16);
//  466                 vstrp = &vstr[vlen];
//  467 
//  468                 dschar = FALSE;
//  469                 if (IS_FLAG_ZERO(flags_used))
//  470                 {
//  471                     if (IS_FLAG_POUND(flags_used))
//  472                     {
//  473                         printk_putc('0', &count, info);
//  474                         printk_putc('x', &count, info);
//  475                         /*vlen += 2;*/
//  476                         dschar = TRUE;
//  477                     }
//  478                     printk_pad_zero (vlen, field_width, &count, info);
//  479                     vlen = field_width;
//  480                 }
//  481                 else
//  482                 {
//  483                     if (!IS_FLAG_MINUS(flags_used))
//  484                     {
//  485                         if (IS_FLAG_POUND(flags_used))
//  486                         {
//  487                             vlen += 2;
//  488                         }
//  489                         printk_pad_space (vlen, field_width, &count, info);
//  490                         if (IS_FLAG_POUND(flags_used))
//  491                         {
//  492                             printk_putc('0', &count, info);
//  493                             printk_putc('x', &count, info);
//  494                             dschar = TRUE;
//  495                         }
//  496                     }
//  497                 }
//  498 
//  499                 if ((IS_FLAG_POUND(flags_used)) && !dschar)
//  500                 {
//  501                     printk_putc('0', &count, info);
//  502                     printk_putc('x', &count, info);
//  503                     vlen += 2;
//  504                 }
//  505                 goto cont_xd;
//  506 
//  507             case 'o':
//  508                 uval = (uint32)va_arg(ap, uint32);
//  509                 vlen = printk_mknumstr(vstr,&uval,FALSE,8);
//  510                 goto cont_u;
//  511             case 'b':
//  512                 uval = (uint32)va_arg(ap, uint32);
//  513                 vlen = printk_mknumstr(vstr,&uval,FALSE,2);
//  514                 goto cont_u;
//  515             case 'p':
//  516                 uval = (uint32)va_arg(ap, void *);
//  517                 vlen = printk_mknumstr(vstr,&uval,FALSE,16);
//  518                 goto cont_u;
//  519             case 'u':
//  520                 uval = (uint32)va_arg(ap, uint32);
//  521                 vlen = printk_mknumstr(vstr,&uval,FALSE,10);
//  522 
//  523                 cont_u:
//  524                     vstrp = &vstr[vlen];
//  525 
//  526                     if (IS_FLAG_ZERO(flags_used))
//  527                     {
//  528                         printk_pad_zero (vlen, field_width, &count, info);
//  529                         vlen = field_width;
//  530                     }
//  531                     else
//  532                     {
//  533                         if (!IS_FLAG_MINUS(flags_used))
//  534                         {
//  535                             printk_pad_space (vlen, field_width, &count, info);
//  536                         }
//  537                     }
//  538 
//  539                 cont_xd:
//  540                     while (*vstrp)
//  541                         printk_putc(*vstrp--, &count, info);
//  542 
//  543                     if (IS_FLAG_MINUS(flags_used))
//  544                     {
//  545                         printk_pad_space (vlen, field_width, &count, info);
//  546                     }
//  547                 break;
//  548 
//  549             case 'c':
//  550                 cval = (int8)va_arg(ap, uint32);
//  551                 printk_putc(cval,&count, info);
//  552                 break;
//  553             case 's':
//  554                 sval = (int8 *)va_arg(ap, int8 *);
//  555                 if (sval)
//  556                 {
//  557                     vlen = strlen(sval);
//  558                     if (!IS_FLAG_MINUS(flags_used))
//  559                     {
//  560                         printk_pad_space (vlen, field_width, &count, info);
//  561                     }
//  562                     while (*sval)
//  563                         printk_putc(*sval++,&count, info);
//  564                     if (IS_FLAG_MINUS(flags_used))
//  565                     {
//  566                         printk_pad_space (vlen, field_width, &count, info);
//  567                     }
//  568                 }
//  569                 break;
//  570             case 'n':
//  571                 ivalp = (int32 *)va_arg(ap, int32 *);
//  572                 *ivalp = count;
//  573                 break;
//  574             default:
//  575                 printk_putc(c,&count, info);
??printk_1:
        MOV      R2,R9
        MOV      R1,SP
        BL       printk_putc
//  576                 break;
        B.N      ??printk_2
??printk_3:
        LDR      R0,[R7], #+4
        LDR      R1,[SP, #+0]
        STR      R1,[R0, #+0]
??printk_2:
        ADD      R8,R8,#+1
??printk_0:
        LDRSB    R0,[R8, #+0]
        CMP      R0,#+0
        BEQ.W    ??printk_4
        CMP      R0,#+37
        BEQ.N    ??printk_5
        CMP      R0,#+10
        BNE.N    ??printk_1
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+13
        BL       printk_putc
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+10
        BL       printk_putc
        B.N      ??printk_2
??printk_5:
        MOVS     R1,#+0
        MOV      R0,R1
        B.N      ??printk_6
??printk_7:
        ORR      R1,R1,#0x1
??printk_6:
        CMP      R0,#+0
        BNE.W    ??printk_8
        LDRSB    R2,[R8, #+1]!
        CMP      R2,#+32
        BEQ.N    ??printk_9
        CMP      R2,#+35
        BEQ.N    ??printk_10
        CMP      R2,#+43
        BEQ.N    ??printk_11
        CMP      R2,#+45
        BEQ.N    ??printk_7
        CMP      R2,#+48
        BEQ.N    ??printk_12
        B.N      ??printk_13
??printk_11:
        ORR      R1,R1,#0x2
        B.N      ??printk_6
??printk_9:
        ORR      R1,R1,#0x4
        B.N      ??printk_6
??printk_12:
        ORR      R1,R1,#0x8
        B.N      ??printk_6
??printk_10:
        ORR      R1,R1,#0x10
        B.N      ??printk_6
??printk_13:
        SUB      R8,R8,#+1
        MOVS     R0,#+1
        B.N      ??printk_6
??printk_14:
        ADD      R3,R2,R2, LSL #+2
        ADD      R1,R1,R3, LSL #+1
        SUBS     R1,R1,#+48
        MOV      R2,R1
??printk_15:
        CMP      R0,#+0
        BNE.W    ??printk_16
        LDRSB    R1,[R8, #+1]!
        MOV      R3,R1
        SUBS     R3,R3,#+48
        CMP      R3,#+9
        BLS.N    ??printk_14
        SUB      R8,R8,#+1
        MOVS     R0,#+1
        B.N      ??printk_15
??printk_17:
        LDRSB    R1,[R8, #+1]!
        SUBS     R1,R1,#+48
        CMP      R1,#+9
        BLS.W    ??printk_18
        SUB      R8,R8,#+1
        MOVS     R0,#+1
        B.N      ??printk_18
??printk_19:
        SUB      R8,R8,#+1
??printk_20:
        LDRSB    R0,[R8, #+1]!
        CMP      R0,#+76
        BEQ.N    ??printk_21
        CMP      R0,#+104
        BEQ.N    ??printk_21
        CMP      R0,#+108
        BEQ.N    ??printk_21
        SUB      R8,R8,#+1
??printk_21:
        LDRSB    R0,[R8, #+1]!
        MOV      R1,R0
        CMP      R1,#+88
        BEQ.N    ??printk_22
        CMP      R1,#+98
        BEQ.W    ??printk_23
        CMP      R1,#+99
        BEQ.W    ??printk_24
        CMP      R1,#+100
        BEQ.N    ??printk_25
        CMP      R1,#+105
        BEQ.N    ??printk_25
        CMP      R1,#+110
        BEQ.N    ??printk_3
        CMP      R1,#+111
        BEQ.W    ??printk_26
        CMP      R1,#+112
        BEQ.W    ??printk_27
        CMP      R1,#+115
        BEQ.W    ??printk_28
        CMP      R1,#+117
        BEQ.W    ??printk_29
        CMP      R1,#+120
        BEQ.N    ??printk_22
        B.N      ??printk_1
??printk_25:
        LDR      R0,[R7], #+4
        STR      R0,[SP, #+8]
        MOVS     R3,#+10
        MOVS     R2,#+1
        ADD      R1,SP,#+8
        ADD      R0,SP,#+16
        BL       printk_mknumstr
        MOV      R10,R0
        ADD      R0,SP,#+16
        ADD      R0,R0,R10
        STR      R0,[SP, #+12]
        LDR      R0,[SP, #+8]
        CMP      R0,#+0
        BPL.N    ??printk_30
        MOVS     R4,#+45
        ADD      R10,R10,#+1
        B.N      ??printk_31
??printk_30:
        LSLS     R0,R5,#+30
        BPL.N    ??printk_32
        MOVS     R4,#+43
        ADD      R10,R10,#+1
        B.N      ??printk_31
??printk_32:
        LSLS     R0,R5,#+29
        BPL.N    ??printk_33
        MOVS     R4,#+32
        ADD      R10,R10,#+1
        B.N      ??printk_31
??printk_33:
        MOVS     R4,#+0
??printk_31:
        MOV      R11,#+0
        LSLS     R0,R5,#+28
        BPL.N    ??printk_34
        CMP      R4,#+0
        BEQ.N    ??printk_35
        MOV      R2,R9
        MOV      R1,SP
        MOV      R0,R4
        BL       printk_putc
??printk_35:
        MOV      R11,#+1
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_zero
        MOV      R10,R6
        B.N      ??printk_36
??printk_34:
        LSLS     R0,R5,#+31
        BMI.N    ??printk_36
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_space
        CMP      R4,#+0
        BEQ.N    ??printk_37
        MOV      R2,R9
        MOV      R1,SP
        MOV      R0,R4
        BL       printk_putc
??printk_37:
        MOV      R11,#+1
??printk_36:
        CMP      R11,#+0
        BNE.N    ??printk_38
        CMP      R4,#+0
        BEQ.N    ??printk_38
        MOV      R2,R9
        MOV      R1,SP
        MOV      R0,R4
        BL       printk_putc
??printk_38:
        MOV      R4,R9
        LDR      R9,[SP, #+12]
??printk_39:
        LDRSB    R0,[R9, #+0]
        CMP      R0,#+0
        BEQ.W    ??printk_40
        MOV      R2,R4
        MOV      R1,SP
        LDRSB    R0,[R9], #-1
        BL       printk_putc
        B.N      ??printk_39
??printk_22:
        LDR      R0,[R7], #+4
        STR      R0,[SP, #+4]
        MOVS     R3,#+16
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+16
        BL       printk_mknumstr
        MOV      R10,R0
        ADD      R0,SP,#+16
        ADD      R0,R0,R10
        STR      R0,[SP, #+12]
        MOVS     R4,#+0
        LSLS     R0,R5,#+28
        BPL.N    ??printk_41
        LSLS     R0,R5,#+27
        BPL.N    ??printk_42
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+48
        BL       printk_putc
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+120
        BL       printk_putc
        MOVS     R4,#+1
??printk_42:
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_zero
        MOV      R10,R6
        B.N      ??printk_43
??printk_41:
        LSLS     R0,R5,#+31
        BMI.N    ??printk_43
        LSLS     R0,R5,#+27
        BPL.N    ??printk_44
        ADD      R10,R10,#+2
??printk_44:
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_space
        LSLS     R0,R5,#+27
        BPL.N    ??printk_43
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+48
        BL       printk_putc
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+120
        BL       printk_putc
        MOVS     R4,#+1
??printk_43:
        LSLS     R0,R5,#+27
        BPL.N    ??printk_38
        CMP      R4,#+0
        BNE.N    ??printk_38
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+48
        BL       printk_putc
        MOV      R2,R9
        MOV      R1,SP
        MOVS     R0,#+120
        BL       printk_putc
        ADD      R10,R10,#+2
        B.N      ??printk_38
??printk_26:
        LDR      R0,[R7], #+4
        STR      R0,[SP, #+4]
        MOVS     R3,#+8
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+16
        BL       printk_mknumstr
        MOV      R10,R0
        B.N      ??printk_45
??printk_23:
        LDR      R0,[R7], #+4
        STR      R0,[SP, #+4]
        MOVS     R3,#+2
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+16
        BL       printk_mknumstr
        MOV      R10,R0
        B.N      ??printk_45
??printk_27:
        LDR      R0,[R7], #+4
        STR      R0,[SP, #+4]
        MOVS     R3,#+16
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+16
        BL       printk_mknumstr
        MOV      R10,R0
        B.N      ??printk_45
??printk_29:
        LDR      R0,[R7], #+4
        STR      R0,[SP, #+4]
        MOVS     R3,#+10
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        ADD      R0,SP,#+16
        BL       printk_mknumstr
        MOV      R10,R0
??printk_45:
        ADD      R0,SP,#+16
        ADD      R0,R0,R10
        STR      R0,[SP, #+12]
        LSLS     R0,R5,#+28
        BPL.N    ??printk_46
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_zero
        MOV      R10,R6
        B.N      ??printk_38
??printk_46:
        LSLS     R0,R5,#+31
        BMI.W    ??printk_38
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_space
        B.N      ??printk_38
??printk_24:
        LDR      R0,[R7], #+4
        SXTB     R0,R0
        MOV      R2,R9
        MOV      R1,SP
        BL       printk_putc
        B.N      ??printk_2
??printk_28:
        LDR      R11,[R7], #+4
        CMP      R11,#+0
        BEQ.W    ??printk_2
        MOV      R0,R11
        BL       strlen
        MOV      R10,R0
        LSLS     R0,R5,#+31
        BMI.N    ??printk_47
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_space
??printk_47:
        MOV      R4,R9
??printk_48:
        LDRSB    R0,[R11, #+0]
        CMP      R0,#+0
        BEQ.N    ??printk_40
        MOV      R2,R4
        MOV      R1,SP
        LDRSB    R0,[R11], #+1
        BL       printk_putc
        B.N      ??printk_48
//  577         }
//  578     }
//  579     return count;
??printk_4:
        LDR      R0,[SP, #+0]
        ADD      SP,SP,#+52
        POP      {R4-R11,PC}      ;; return
??printk_8:
        MOV      R5,R1
        MOVS     R2,#+0
        MOV      R0,R2
        B.N      ??printk_15
??printk_16:
        MOV      R6,R2
        LDRSB    R0,[R8, #+1]!
        CMP      R0,#+46
        BNE.W    ??printk_19
        MOVS     R0,#+0
??printk_18:
        CMP      R0,#+0
        BNE.W    ??printk_20
        B.N      ??printk_17
??printk_40:
        MOV      R9,R4
        LSLS     R0,R5,#+31
        BPL.W    ??printk_2
        MOV      R3,R9
        MOV      R2,SP
        MOV      R1,R6
        MOV      R0,R10
        BL       printk_pad_space
        B.N      ??printk_2
//  580 }
//  581 
//  582 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  583 int32 printf (const int8 *fmt, ...)
//  584 {
printf:
        PUSH     {R1-R3}
        PUSH     {R4-R7,LR}
        MOV      R1,R0
//  585     va_list ap;
//  586     int32 rvalue;
//  587     PRINTK_INFO info;
//  588 
//  589 
//  590     info.dest = DEST_CONSOLE;
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
//  591     info.func = &out_char;
        LDR.N    R0,??DataTable1
        STR      R0,[SP, #+4]
//  592     /*
//  593      * Initialize the pointer to the variable length argument list.
//  594      */
//  595     va_start(ap, fmt);
        ADD      R2,SP,#+20
//  596     rvalue = printk(&info, fmt, ap);
//  597     /*
//  598      * Cleanup the variable length argument list.
//  599      */
//  600     va_end(ap);
//  601     return rvalue;
        MOV      R0,SP
        BL       printk
        ADD      SP,SP,#+16
        LDR      PC,[SP], #+16    ;; return
//  602 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     out_char
//  603 
//  604 /********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  605 int32 sprintf (int8 *s, const int8 *fmt, ...)
//  606 {
sprintf:
        PUSH     {R2,R3}
        PUSH     {R5-R7,LR}
//  607     va_list ap;
//  608     int32 rvalue = 0;
        MOVS     R2,#+0
//  609     PRINTK_INFO info;
//  610 
//  611     /*
//  612      * Initialize the pointer to the variable length argument list.
//  613      */
//  614     if (s != 0)
        CMP      R0,#+0
        BEQ.N    ??sprintf_0
//  615     {
//  616         info.dest = DEST_STRING;
        MOVS     R2,#+2
        STR      R2,[SP, #+0]
//  617         info.loc = s;
        STR      R0,[SP, #+8]
//  618         va_start(ap, fmt);
        ADD      R2,SP,#+16
//  619         rvalue = printk(&info, fmt, ap);
        MOV      R0,SP
        BL       printk
        MOV      R2,R0
//  620         *info.loc = '\0';
        MOVS     R0,#+0
        LDR      R1,[SP, #+8]
        STRB     R0,[R1, #+0]
//  621         va_end(ap);
//  622     }
//  623     return rvalue;
??sprintf_0:
        MOV      R0,R2
        POP      {R1-R3}
        LDR      PC,[SP], #+12    ;; return
//  624 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        END
//  625 
//  626 /********************************************************************/
// 
// 1 202 bytes in section .text
// 
// 1 202 bytes of CODE memory
//
//Errors: none
//Warnings: none
