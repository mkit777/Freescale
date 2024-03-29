#ifndef GPIO_ICF_H_
#define GPIO_ICF_H_

#include "SKEAZ1284.h"

#define PTA     GPIOA
#define PTB     GPIOA
#define PTC     GPIOA
#define PTD     GPIOA

#define PTE     GPIOB
#define PTF		GPIOB
#define PTG		GPIOB
#define PTH		GPIOB

#define PTI		GPIOC


//定义PTA输出端口 
#define PTA0_OUT     GPIOA->PDORs.PDOR0
#define PTA1_OUT     GPIOA->PDORs.PDOR1
#define PTA2_OUT     GPIOA->PDORs.PDOR2
#define PTA3_OUT     GPIOA->PDORs.PDOR3
#define PTA4_OUT     GPIOA->PDORs.PDOR4
#define PTA5_OUT     GPIOA->PDORs.PDOR5
#define PTA6_OUT     GPIOA->PDORs.PDOR6
#define PTA7_OUT     GPIOA->PDORs.PDOR7
#define PTB0_OUT     GPIOA->PDORs.PDOR8
#define PTB1_OUT     GPIOA->PDORs.PDOR9
#define PTB2_OUT     GPIOA->PDORs.PDOR10
#define PTB3_OUT     GPIOA->PDORs.PDOR11
#define PTB4_OUT     GPIOA->PDORs.PDOR12
#define PTB5_OUT     GPIOA->PDORs.PDOR13
#define PTB6_OUT     GPIOA->PDORs.PDOR14
#define PTB7_OUT     GPIOA->PDORs.PDOR15
#define PTC0_OUT     GPIOA->PDORs.PDOR16
#define PTC1_OUT     GPIOA->PDORs.PDOR17
#define PTC2_OUT     GPIOA->PDORs.PDOR18
#define PTC3_OUT     GPIOA->PDORs.PDOR19
#define PTC4_OUT     GPIOA->PDORs.PDOR20
#define PTC5_OUT     GPIOA->PDORs.PDOR21
#define PTC6_OUT     GPIOA->PDORs.PDOR22
#define PTC7_OUT     GPIOA->PDORs.PDOR23
#define PTD0_OUT     GPIOA->PDORs.PDOR24
#define PTD1_OUT     GPIOA->PDORs.PDOR25
#define PTD2_OUT     GPIOA->PDORs.PDOR26
#define PTD3_OUT     GPIOA->PDORs.PDOR27
#define PTD4_OUT     GPIOA->PDORs.PDOR28
#define PTD5_OUT     GPIOA->PDORs.PDOR29
#define PTD6_OUT     GPIOA->PDORs.PDOR30
#define PTD7_OUT     GPIOA->PDORs.PDOR31

//定义PTB输出端口 
#define PTE0_OUT     GPIOB->PDORs.PDOR0
#define PTE1_OUT     GPIOB->PDORs.PDOR1
#define PTE2_OUT     GPIOB->PDORs.PDOR2
#define PTE3_OUT     GPIOB->PDORs.PDOR3
#define PTE4_OUT     GPIOB->PDORs.PDOR4
#define PTE5_OUT     GPIOB->PDORs.PDOR5
#define PTE6_OUT     GPIOB->PDORs.PDOR6
#define PTE7_OUT     GPIOB->PDORs.PDOR7
#define PTF0_OUT     GPIOB->PDORs.PDOR8
#define PTF1_OUT     GPIOB->PDORs.PDOR9
#define PTF2_OUT    GPIOB->PDORs.PDOR10
#define PTF3_OUT    GPIOB->PDORs.PDOR11
#define PTF4_OUT    GPIOB->PDORs.PDOR12
#define PTF5_OUT    GPIOB->PDORs.PDOR13
#define PTF6_OUT    GPIOB->PDORs.PDOR14
#define PTF7_OUT    GPIOB->PDORs.PDOR15
#define PTG0_OUT    GPIOB->PDORs.PDOR16
#define PTG1_OUT    GPIOB->PDORs.PDOR17
#define PTG2_OUT    GPIOB->PDORs.PDOR18
#define PTG3_OUT    GPIOB->PDORs.PDOR19
#define PTG4_OUT    GPIOB->PDORs.PDOR20
#define PTG5_OUT    GPIOB->PDORs.PDOR21
#define PTG6_OUT    GPIOB->PDORs.PDOR22
#define PTG7_OUT    GPIOB->PDORs.PDOR23
#define PTH0_OUT    GPIOB->PDORs.PDOR24
#define PTH1_OUT    GPIOB->PDORs.PDOR25
#define PTH2_OUT    GPIOB->PDORs.PDOR26
#define PTH3_OUT    GPIOB->PDORs.PDOR27
#define PTH4_OUT    GPIOB->PDORs.PDOR28
#define PTH5_OUT    GPIOB->PDORs.PDOR29
#define PTH6_OUT    GPIOB->PDORs.PDOR30
#define PTH7_OUT    GPIOB->PDORs.PDOR31

//定义PTC输出端口 
#define PTI0_OUT     GPIOC->PDORs.PDOR0
#define PTI1_OUT     GPIOC->PDORs.PDOR1
#define PTI2_OUT     GPIOC->PDORs.PDOR2
#define PTI3_OUT     GPIOC->PDORs.PDOR3
#define PTI4_OUT     GPIOC->PDORs.PDOR4
#define PTI5_OUT     GPIOC->PDORs.PDOR5
#define PTI6_OUT     GPIOC->PDORs.PDOR6
#define PTI7_OUT     GPIOC->PDORs.PDOR7

//定义PTA方向寄存器 
#define DDRA0       GPIOA->DDRs.DDR0
#define DDRA1       GPIOA->DDRs.DDR1
#define DDRA2       GPIOA->DDRs.DDR2
#define DDRA3       GPIOA->DDRs.DDR3
#define DDRA4       GPIOA->DDRs.DDR4
#define DDRA5       GPIOA->DDRs.DDR5
#define DDRA6       GPIOA->DDRs.DDR6
#define DDRA7       GPIOA->DDRs.DDR7
#define DDRB0       GPIOA->DDRs.DDR8
#define DDRB1       GPIOA->DDRs.DDR9
#define DDRB2      GPIOA->DDRs.DDR10
#define DDRB3      GPIOA->DDRs.DDR11
#define DDRB4      GPIOA->DDRs.DDR12
#define DDRB5      GPIOA->DDRs.DDR13
#define DDRB6      GPIOA->DDRs.DDR14
#define DDRB7      GPIOA->DDRs.DDR15
#define DDRC0      GPIOA->DDRs.DDR16
#define DDRC1      GPIOA->DDRs.DDR17
#define DDRC2      GPIOA->DDRs.DDR18
#define DDRC3      GPIOA->DDRs.DDR19
#define DDRC4      GPIOA->DDRs.DDR20
#define DDRC5      GPIOA->DDRs.DDR21
#define DDRC6      GPIOA->DDRs.DDR22
#define DDRC7      GPIOA->DDRs.DDR23
#define DDRD0      GPIOA->DDRs.DDR24
#define DDRD1      GPIOA->DDRs.DDR25
#define DDRD2      GPIOA->DDRs.DDR26
#define DDRD3      GPIOA->DDRs.DDR27
#define DDRD4      GPIOA->DDRs.DDR28
#define DDRD5      GPIOA->DDRs.DDR29
#define DDRD6      GPIOA->DDRs.DDR30
#define DDRD7      GPIOA->DDRs.DDR31

//定义PTB的方向寄存器  
#define DDRE0       GPIOB->DDRs.DDR0
#define DDRE1       GPIOB->DDRs.DDR1
#define DDRE2       GPIOB->DDRs.DDR2
#define DDRE3       GPIOB->DDRs.DDR3
#define DDRE4       GPIOB->DDRs.DDR4
#define DDRE5       GPIOB->DDRs.DDR5
#define DDRE6       GPIOB->DDRs.DDR6
#define DDRE7       GPIOB->DDRs.DDR7
#define DDRF0       GPIOB->DDRs.DDR8
#define DDRF1       GPIOB->DDRs.DDR9
#define DDRF2      GPIOB->DDRs.DDR10
#define DDRF3      GPIOB->DDRs.DDR11
#define DDRF4      GPIOB->DDRs.DDR12
#define DDRF5      GPIOB->DDRs.DDR13
#define DDRF6      GPIOB->DDRs.DDR14
#define DDRF7      GPIOB->DDRs.DDR15
#define DDRG0      GPIOB->DDRs.DDR16
#define DDRG1      GPIOB->DDRs.DDR17
#define DDRG2      GPIOB->DDRs.DDR18
#define DDRG3      GPIOB->DDRs.DDR19
#define DDRG4      GPIOB->DDRs.DDR20
#define DDRG5      GPIOB->DDRs.DDR21
#define DDRG6      GPIOB->DDRs.DDR22
#define DDRG7      GPIOB->DDRs.DDR23
#define DDRH0      GPIOB->DDRs.DDR24
#define DDRH1      GPIOB->DDRs.DDR25
#define DDRH2      GPIOB->DDRs.DDR26
#define DDRH3      GPIOB->DDRs.DDR27
#define DDRH4      GPIOB->DDRs.DDR28
#define DDRH5      GPIOB->DDRs.DDR29
#define DDRH6      GPIOB->DDRs.DDR30
#define DDRH7      GPIOB->DDRs.DDR31

//定义PTC的方向寄存器 
#define DDRI0       GPIOC->DDRs.DDR0
#define DDRI1       GPIOC->DDRs.DDR1
#define DDRI2       GPIOC->DDRs.DDR2
#define DDRI3       GPIOC->DDRs.DDR3
#define DDRI4       GPIOC->DDRs.DDR4
#define DDRI5       GPIOC->DDRs.DDR5
#define DDRI6       GPIOC->DDRs.DDR6
#define DDRI7       GPIOC->DDRs.DDR7

//定义PTA的输入端口 
#define PTA0_IN     GPIOA->PDIRs.PDIR0
#define PTA1_IN     GPIOA->PDIRs.PDIR1
#define PTA2_IN     GPIOA->PDIRs.PDIR2
#define PTA3_IN     GPIOA->PDIRs.PDIR3
#define PTA4_IN     GPIOA->PDIRs.PDIR4
#define PTA5_IN     GPIOA->PDIRs.PDIR5
#define PTA6_IN     GPIOA->PDIRs.PDIR6
#define PTA7_IN     GPIOA->PDIRs.PDIR7
#define PTB0_IN     GPIOA->PDIRs.PDIR8
#define PTB1_IN     GPIOA->PDIRs.PDIR9
#define PTB2_IN    GPIOA->PDIRs.PDIR10
#define PTB3_IN    GPIOA->PDIRs.PDIR11
#define PTB4_IN    GPIOA->PDIRs.PDIR12
#define PTB5_IN    GPIOA->PDIRs.PDIR13
#define PTB6_IN    GPIOA->PDIRs.PDIR14
#define PTB7_IN    GPIOA->PDIRs.PDIR15
#define PTC0_IN    GPIOA->PDIRs.PDIR16
#define PTC1_IN    GPIOA->PDIRs.PDIR17
#define PTC2_IN    GPIOA->PDIRs.PDIR18
#define PTC3_IN    GPIOA->PDIRs.PDIR19
#define PTC4_IN    GPIOA->PDIRs.PDIR20
#define PTC5_IN    GPIOA->PDIRs.PDIR21
#define PTC6_IN    GPIOA->PDIRs.PDIR22
#define PTC7_IN    GPIOA->PDIRs.PDIR23
#define PTD0_IN    GPIOA->PDIRs.PDIR24
#define PTD1_IN    GPIOA->PDIRs.PDIR25
#define PTD2_IN    GPIOA->PDIRs.PDIR26
#define PTD3_IN    GPIOA->PDIRs.PDIR27
#define PTD4_IN    GPIOA->PDIRs.PDIR28
#define PTD5_IN    GPIOA->PDIRs.PDIR29
#define PTD6_IN    GPIOA->PDIRs.PDIR30
#define PTD7_IN    GPIOA->PDIRs.PDIR31

//定义PTB的输入端口
#define PTE0_IN     GPIOB->PDIRs.PDIR0
#define PTE1_IN     GPIOB->PDIRs.PDIR1
#define PTE2_IN     GPIOB->PDIRs.PDIR2
#define PTE3_IN     GPIOB->PDIRs.PDIR3
#define PTE4_IN     GPIOB->PDIRs.PDIR4
#define PTE5_IN     GPIOB->PDIRs.PDIR5
#define PTE6_IN     GPIOB->PDIRs.PDIR6
#define PTE7_IN     GPIOB->PDIRs.PDIR7
#define PTF0_IN     GPIOB->PDIRs.PDIR8
#define PTF1_IN     GPIOB->PDIRs.PDIR9
#define PTF2_IN    GPIOB->PDIRs.PDIR10
#define PTF3_IN    GPIOB->PDIRs.PDIR11
#define PTF4_IN    GPIOB->PDIRs.PDIR12
#define PTF5_IN    GPIOB->PDIRs.PDIR13
#define PTF6_IN    GPIOB->PDIRs.PDIR14
#define PTF7_IN    GPIOB->PDIRs.PDIR15
#define PTG0_IN    GPIOB->PDIRs.PDIR16
#define PTG1_IN    GPIOB->PDIRs.PDIR17
#define PTG2_IN    GPIOB->PDIRs.PDIR18
#define PTG3_IN    GPIOB->PDIRs.PDIR19
#define PTG4_IN    GPIOB->PDIRs.PDIR20
#define PTG5_IN    GPIOB->PDIRs.PDIR21
#define PTG6_IN    GPIOB->PDIRs.PDIR22
#define PTG7_IN    GPIOB->PDIRs.PDIR23
#define PTH0_IN    GPIOB->PDIRs.PDIR24
#define PTH1_IN    GPIOB->PDIRs.PDIR25
#define PTH2_IN    GPIOB->PDIRs.PDIR26
#define PTH3_IN    GPIOB->PDIRs.PDIR27
#define PTH4_IN    GPIOB->PDIRs.PDIR28
#define PTH5_IN    GPIOB->PDIRs.PDIR29
#define PTH6_IN    GPIOB->PDIRs.PDIR30
#define PTH7_IN    GPIOB->PDIRs.PDIR31

//定义PTC的输入端口
#define PTI0_IN     GPIOC->PDIRs.PDIR0
#define PTI1_IN     GPIOC->PDIRs.PDIR1
#define PTI2_IN     GPIOC->PDIRs.PDIR2
#define PTI3_IN     GPIOC->PDIRs.PDIR3
#define PTI4_IN     GPIOC->PDIRs.PDIR4
#define PTI5_IN     GPIOC->PDIRs.PDIR5
#define PTI6_IN     GPIOC->PDIRs.PDIR6
#define PTI7_IN     GPIOC->PDIRs.PDIR7



#endif 
