#define H 316
#define V 80
extern GPIO_InitTypeDef HRF_init_struct;
extern GPIO_InitTypeDef VSY_init_struct;
extern DMA_InitTypeDef  DMA_init_struct;



extern uint8 Img_Data[V][H];
extern void Camera_Init(void);
extern void Blue_Init(void);
extern void Send_Img(void);
extern uint32 Has_Img;