#include "include.h"
GPIO_InitTypeDef led_init_struct_a17;
GPIO_InitTypeDef led_init_struct_c0;
GPIO_InitTypeDef led_init_struct_d15;
GPIO_InitTypeDef led_init_struct_e26;
void Led_Init()
{
  led_init_struct_a17.GPIO_PTx = PTA;
  led_init_struct_a17.GPIO_Pins=GPIO_Pin17;
  led_init_struct_a17.GPIO_Dir=DIR_OUTPUT;
  led_init_struct_a17.GPIO_Output=OUTPUT_L;
  LPLD_GPIO_Init(led_init_struct_a17);
  
  led_init_struct_c0.GPIO_PTx = PTC;
  led_init_struct_c0.GPIO_Pins=GPIO_Pin0;
  led_init_struct_c0.GPIO_Dir=DIR_OUTPUT;
  led_init_struct_c0.GPIO_Output=OUTPUT_L;
  LPLD_GPIO_Init(led_init_struct_c0);
  
  led_init_struct_d15.GPIO_PTx = PTD;
  led_init_struct_d15.GPIO_Pins=GPIO_Pin15;
  led_init_struct_d15.GPIO_Dir=DIR_OUTPUT;
  led_init_struct_d15.GPIO_Output=OUTPUT_L;
  LPLD_GPIO_Init(led_init_struct_d15); 
  
  led_init_struct_e26.GPIO_PTx = PTE;
  led_init_struct_e26.GPIO_Pins=GPIO_Pin26;
  led_init_struct_e26.GPIO_Dir=DIR_OUTPUT;
  led_init_struct_e26.GPIO_Output=OUTPUT_L;
  LPLD_GPIO_Init(led_init_struct_e26);
}

void Led_On()
{
  PTA17_O = 0;
  PTC0_O = 0;
  PTD15_O = 0;
  PTE26_O = 0;
}
void Led_Off()
{
  PTA17_O = 1;
  PTC0_O = 1;
  PTD15_O = 1;
  PTE26_O = 1;
}