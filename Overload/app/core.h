extern void Img_Handler(void);
extern void Get_Bound_Qian(void);
extern void Direction_Control(void);
extern void scan_row(void);
extern void Show_Num(void);
extern void Speed_Control(void);
extern uint8 should_send;
extern int YUZHI;
extern int MID_LIN;
extern uint8 should_stop;
extern int right_index;
extern int left_index;
void judge_road_type();
#define Spe_nI_MAX 2000
#define Spe_nI_MIN -1800

#define Spe_nI_Last_MAX 1800
#define Spe_nI_Last_MIN -1600


#define Speed_Control_Out_MAX 2200
#define Speed_Control_Out_MIN -2000
