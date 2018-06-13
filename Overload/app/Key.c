#include "include.h"

GPIO_InitTypeDef key_init_struct;
uint32 duty=1000;
void Key_Handler(void)
{
  DisableInterrupts;
  if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin20))
  {
    if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin20))
    {
      //×ó
      duty-=100;
    }

  }
  if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin21))
  {
    if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin21))
    {
      //ÓÒ
      duty+=100;
    }

  }
  if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin22))
  {
    if(LPLD_GPIO_IsPinxExt(PORTB,GPIO_Pin22))
    {
      //ÖÐ
      if(should_send==0)
      {
        should_send=1;
      }
      else should_send=0;
    }
  }
 // Morter_Drive(duty);
  LCD_Flush();
  EnableInterrupts;
}


void LCD_Flush(void)
{
  LCD_CLS();
  char str[100];
  sprintf(str, "duty:\t%d", duty);
  LCD_P6x8Str(0, 0, str);
}


void Key_Init(void)
{
  key_init_struct.GPIO_PTx=PTB;
  key_init_struct.GPIO_Pins=GPIO_Pin20|GPIO_Pin21|GPIO_Pin22;
  key_init_struct.GPIO_Dir=DIR_INPUT;
  key_init_struct.GPIO_PinControl=IRQC_FA;
  key_init_struct.GPIO_Isr=Key_Handler;
  LPLD_GPIO_Init(key_init_struct);
  LPLD_GPIO_EnableIrq(key_init_struct);
}