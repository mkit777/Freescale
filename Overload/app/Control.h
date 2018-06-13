extern void Motor_Init(void);
extern void Motor_Drive(int16 duty);
extern void Server_Init(void);
extern void Server_Drive(uint32 duty);
extern int QD_Interval;
extern void Encoder_Init(void);
extern void Speed_Control(void);
#define Server_PWM_FREQ 50  //PWMÊä³öÆµÂÊ

#define Server_PWM_MIDDLE 730
#define Server_PWM_LEFT_MAX 490
#define Server_PWM_RIGHT_MAX 970