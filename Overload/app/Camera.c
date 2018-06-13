#include "include.h"
GPIO_InitTypeDef Data_init_struct; // 数据接口初始化结构体
GPIO_InitTypeDef PCLK_init_struct; // PCLK接口初始化结构体
GPIO_InitTypeDef HRF_init_struct;  // HRF结构初始化结构体
GPIO_InitTypeDef VSY_init_struct;  // VSY接口初始化结构体

UART_InitTypeDef  uart_init_struct;

uint8 Img_Data[V][H]={0};  // 原图像存储数组
uint32 Row_Count=0;
uint32 Field_Count=0;
uint32 Has_Img=0;
// 摄像头中断处理函数
void Camera_Handler(void)
{
  //DisableInterrupts;
  
  // 行中断
  if(LPLD_GPIO_IsPinxExt(PORTC,GPIO_Pin6))
  {
    LPLD_GPIO_ClearIntFlag(PORTC);
    Row_Count++;
    if(Row_Count%3==0 && Row_Count/3<V && Field_Count==1)
    {
      LPLD_DMA_EnableReq(DMA_CH0);
    }
    
  }
  
  
  // 场中断
  if(LPLD_GPIO_IsPinxExt(PORTC,GPIO_Pin7))
  {
    LPLD_GPIO_ClearIntFlag(PORTC);
    
    if(Field_Count==0)
    {
      Row_Count=0;
      Field_Count=1;
      Has_Img=0;
      LPLD_DMA_LoadDstAddr(DMA_CH0,Img_Data);
    }else{
      Field_Count=0;
      Has_Img=1;
      Img_Handler();
    }

  }
  //EnableInterrupts; 
}


void Camera_GPIO_Init(void)
{
  //数据接口初始化(PTD0~PTD7)
  Data_init_struct.GPIO_PTx=PTD;
  Data_init_struct.GPIO_Pins=GPIO_Pin0_7;
  Data_init_struct.GPIO_Dir=DIR_INPUT;
  Data_init_struct.GPIO_PinControl=INPUT_PULL_UP;
  LPLD_GPIO_Init(Data_init_struct);
  
  //PCLK初始化(PTA19)
  PCLK_init_struct.GPIO_PTx=PTA;
  PCLK_init_struct.GPIO_Pins=GPIO_Pin19;
  PCLK_init_struct.GPIO_Dir=DIR_INPUT;
  PCLK_init_struct.GPIO_PinControl=IRQC_DMARI;
  LPLD_GPIO_Init(PCLK_init_struct);
  
  //行中断初始化(PTC6)
  HRF_init_struct.GPIO_PTx = PTC;
  HRF_init_struct.GPIO_Pins = GPIO_Pin6;
  HRF_init_struct.GPIO_PinControl = IRQC_RI;
  HRF_init_struct.GPIO_Dir = DIR_INPUT;
  HRF_init_struct.GPIO_Isr=Camera_Handler;
  LPLD_GPIO_Init(HRF_init_struct);
  
  //场中断初始化(PTC7)
  VSY_init_struct.GPIO_PTx = PTC;
  VSY_init_struct.GPIO_Pins = GPIO_Pin7;
  VSY_init_struct.GPIO_PinControl = IRQC_RI;
  VSY_init_struct.GPIO_Dir= DIR_INPUT;
  VSY_init_struct.GPIO_Isr=Camera_Handler;
  LPLD_GPIO_Init(VSY_init_struct);
}




DMA_InitTypeDef  DMA_init_struct;  // DMA初始化结构体
void Camera_DMA_Init(void)
{
  DMA_init_struct.DMA_CHx=DMA_CH0;
  DMA_init_struct.DMA_Req=PORTA_DMAREQ;
  DMA_init_struct.DMA_MajorLoopCnt=H;
  DMA_init_struct.DMA_MinorByteCnt=1;
  
  DMA_init_struct.DMA_SourceAddr=(uint32)&PTD->PDIR;
  DMA_init_struct.DMA_DestAddr=(uint32)Img_Data;
  
  DMA_init_struct.DMA_DestDataSize=DMA_DST_8BIT;
  DMA_init_struct.DMA_SourceDataSize=DMA_SRC_8BIT;
  
  DMA_init_struct.DMA_DestAddrOffset=1;
  DMA_init_struct.DMA_AutoDisableReq=TRUE;
  LPLD_DMA_Init(DMA_init_struct);
}

void Camera_Init(void)
{
  Camera_GPIO_Init();
  Camera_DMA_Init();
  enable_irq(PORTC_IRQn);
}


void Blue_Init(void)
{
  uart_init_struct.UART_Uartx=UART4;
  uart_init_struct.UART_BaudRate=115200;
  uart_init_struct.UART_TxPin=PTE24;
  uart_init_struct.UART_RxPin=PTE25;
  LPLD_UART_Init(uart_init_struct);
}


void Send_Img(void)
{
  uint16 i,j;
  LPLD_UART_PutChar(UART4,0x01);
  LPLD_UART_PutChar(UART4,0xFE);//发送帧头标志
  for(i=0;i<V;i++) 
  {
    for(j=0;j<H;j++)
    {
      LPLD_UART_PutChar(UART4,Img_Data[i][j]);
    }
  }
  LPLD_UART_PutChar(UART4,0xFE);
  LPLD_UART_PutChar(UART4,0x01);
  
}