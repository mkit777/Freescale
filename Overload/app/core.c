#include "include.h"

uint8 should_send=0;

void Img_Handler(void)
{
  Show_Img();
  if(should_send==1)Show_Num();
}

int YUZHI=120;
void Error_count0();
void Error_count1();
void Error_count2();
void Error_count3();
void check_right_bound();
void check_left_bound();
int Left_Bound[51] = {0};
int Right_Bound[51] = {0};
int Error = 0;
int Error_Last = 0;
int MID_LINE=H/2;
int right_index=0;
int left_index=0;
int right_bottom_index=0;
int left_bottom_index=0;
int lft01_index=0;
uint8 count=0;
uint8 LEFT_Flag = 1;
uint8 RIGHT_Flag = 1;
int Error_Hang[51]={0}; //每行的偏差
int16 Mid_Bound[51]={0}; //每行的中间
uint8 No_Bound=0;
uint8 road_type=0;
int has_right_bound=0;
int i,j;
int point,point_max;
/*************************************************************************
* 函数名称：Get_Bound_Qian
* 功能说明：图像处理程序
* 参数说明：value_hang  有效行
* 函数返回：Error       偏差
*************************************************************************/
uint8 scan_hang=50;
uint8 value_hang=70; 
uint8 should_stop=0;
uint8 stop_line_count=0;
#define stop_row 70
void Check_Stop_Line(void)
{
  //停车线检测
  int up_dpwn_count=0;
  for(i=H/2;i>10;i--)
  {
    //白黑突变
    if(Img_Data[stop_row][i+1]>YUZHI&&Img_Data[stop_row][i]>YUZHI && Img_Data[stop_row][i-1]<YUZHI && Img_Data[stop_row][i-2]<YUZHI)
    {
      up_dpwn_count++; 
      if(up_dpwn_count>8)
      {
        stop_line_count++;
        return;
      }
    }
  }  
  for(i=H/2;i<H-10;i++)
  {
    //白黑突变
    if(Img_Data[stop_row][i-1]<YUZHI && Img_Data[stop_row][i]<YUZHI && Img_Data[stop_row][i+1]>YUZHI && Img_Data[stop_row][i+2]>YUZHI)
    {
      up_dpwn_count++; 
      if(up_dpwn_count>8)
      {
        stop_line_count++;
        return;
      }
    }
  }
}


void Get_Bound_Qian(void)      
{
  Led_On();
  count=0;
  No_Bound=0;  
  Check_Stop_Line();
  if(stop_line_count>2) should_stop=1;
  if(Img_Data[value_hang][H/2] > YUZHI)
  {	
    for(i=value_hang; i>=value_hang-scan_hang; i--)
    {	
      /****左边界搜索****/
      for(j=H/2; j>1; j--)
      {
        if((Img_Data[i][j+1] > YUZHI) && (Img_Data[i][j] < YUZHI)&& (Img_Data[i][j-1] < YUZHI))
        {
          Left_Bound[count] = j+1;
          LEFT_Flag = 1;
          break;
        }
      }
      /****没有找到左边界****/
      if(j <= 1) 
      {
        Left_Bound[count] = 1;
        LEFT_Flag = 0;
      }
      
      /****右边界搜索****/
      for(j=H/2;j<H-2;j++)
      {
        if((Img_Data[i][j-1] > YUZHI)  && (Img_Data[i][j] <YUZHI)&& (Img_Data[i][j+1] < YUZHI))
        {
          Right_Bound[count] = j-1;
          RIGHT_Flag = 1;
          break;
        }
      }
      /****没有找到右边界****/
      if(j >= H-2) 
      {
        Right_Bound[count] = H-2;
        RIGHT_Flag = 0;
      }
      
      
      
      /****只有左边界或右边界****/
      if(((LEFT_Flag == 1) && (RIGHT_Flag == 0)))
      {
        Right_Bound[count] = H+Left_Bound[count];
      }
      if(((LEFT_Flag == 0) && (RIGHT_Flag == 1)))
      {
        Left_Bound[count] = -H+Right_Bound[count]; 
      }
      
      /*******左右边界都没有****/
      else if((LEFT_Flag == 0) && (RIGHT_Flag == 0)) 
      {
        Left_Bound[count]=1;
        Right_Bound[count]=H-1;
        No_Bound++;
      } 
      
      Mid_Bound[count]=(Right_Bound[count] + Left_Bound[count])/2;
      
      count++;             //执行完一行后count+1
      
      if(Img_Data[i][H/2] <YUZHI)
      {
        break;
      }
    }
    
    /*****************检测圆环*************************/
    check_right_bound();
    check_left_bound() ;
    judge_road_type();
    
    /****************计算偏差平均值*************************/
    if(count>6)  
    {
      switch(road_type)
      {
        case 0: Error_count0();break;
        case 1: Error_count1();break;
        case 2: Error_count2();break;
        case 3: Error_count3();break;
      }
      Error_Last = Error;
    }
    else
    {
      Error = Error_Last;
    }
  }
  else
  {
    Error = Error_Last;
  }
  
  //Speed_Control();
  Direction_Control();     //方向控制 
  Led_Off();
}




/****************************************/
/*检测右侧边界，有边界返回1，否则为0  
/**************************************/

void check_right_bound()
{
  right_index=0;
  for(i=0;i<count-3;i++)
  {
    if(Right_Bound[i+1] - Right_Bound[i] < -10)
    {
      right_index = i;
      break;
    }
  }
}


/****************************************/
/*检测左侧边界，找到有无切换点
/**************************************/
void check_left_bound() 
{
  left_index=0;
  for(i=0;i<count-3;i++)
  {
    if(Left_Bound[i+1] - Left_Bound[i] > 10)
    {
      left_index = i;
      break;
    }
  }
}


/****************************************/
/*检测左侧边界，找到有无切换点
/**************************************/
void judge_road_type()
{
  if(right_index==0 && left_index==0) road_type = 0;
  else if (right_index=0 && left_index!=0) road_type=1;
  else if (right_index!=0 && left_index==0) road_type=2;
  else road_type=0;
  //road_type=3; 
}

// 误差正常计算函数，取30行
void Error_count0(void)
{
  int cc=0;
  float sum=0;
  for(i=0;i<count;i++)
  {
    cc++;
    sum+=(Mid_Bound[i]-MID_LINE);
    if(i>30) break;
  }
  Error=(int)sum/cc*2;
}

// 出弯口误差计算
void Error_count1() // 左侧有边界，右侧有突变
{
  Error=(int) Mid_Bound[right_index+1]-MID_LINE;
  Error=0;
}

void Error_count2()
{
  Error=(int) Mid_Bound[left_index+1]-MID_LINE;
  Error=0;
}

void Error_count3()
{
  float sum=0;
  for(i=0;i<left_index-1&&i<count;i++)
  {
    sum += Left_Bound[i] - MID_LINE + i;
  }
  Error = (int)sum/count;

}

/*************************************************************************
* 函数名称：Direction_Control
* 功能说明：方向控制
* 参数说明：Dir_Kp     方向环比例项
Dir_Kd     方向环微分项
* 函数返回：无
*************************************************************************/
uint8 Dir_Kp=1;
uint8 Dir_Ki=1;
uint8 Dir_Kd=0;
int16 Direction_Error;
int16 Direction_Error_Last;
int16 Direction_Error_Last2 ;
int Direction_Control_Out = 0;
int ret;
void Direction_Control(void)
{
  
  int16 Dir_nP = 0;
  int16 Dir_nI = 0;
  int16 Dir_nD = 0;
  
  Direction_Error_Last2 =Direction_Error_Last;
  Direction_Error_Last = Direction_Error;
  Direction_Error =Error; 
  
  
  //增量式
  Dir_nP = Dir_Kp*(Direction_Error-Direction_Error_Last);    //方向环比例控制
  Dir_nI = Dir_Ki*Direction_Error;                         //方向环积分控制
  Dir_nD = Dir_Kd*(Direction_Error-2*Direction_Error_Last+Direction_Error_Last2);  //方向环微分控制
  
  
  /****方向环输出限幅****/
  ret = (Dir_nP+Dir_nD+Dir_nI);
  Direction_Control_Out =  730+ret; 
  Server_Drive(Direction_Control_Out);
  
}

/*************************************************************************
* 函数名称：Speed_Control
* 功能说明：速度控制，采用位置式PID控制
* 参数说明：Speed_Set  设定速度
            Spe_Kp     速度环比例项
            Spe_Ki     速度环积分项
            Spe_Kd     速度环微分项
* 函数返回：无
*************************************************************************/
uint8 Spe_Kp = 4;
uint8 Spe_Ki = 1;
uint8 Spe_Kd = 0;

int16 Speed_Control_Out=0;
int16 Speed_Set=100;
int16 Speed_Error = 0;

int16 Spe_nP = 0;
int16 Spe_nI = 0;
int16 Spe_nD= 0;
int16 Spe_nI_Last=0;
int16 Speed_Error_Last = 0;  
int8 Speed_Flag = 0;

void Speed_Control()
{ 
  int8 delt_error= abs(Error-Error_Last);
  if(should_stop==1)Speed_Set=0;
  /*else if(abs(Error)<10 && delt_error<5 && QD_Interval>150)
  {
    Speed_Set=175;
  }
  else if(abs(Error)<20 && delt_error<10 && QD_Interval>130)
  {
    Speed_Set=155;
  }*/
  else if(abs(Error)<40 && delt_error<10)
  {
    Speed_Set=190;
  }
  else{
    Speed_Set=100;
  }
   
  /****设定值-返回值****/
   Speed_Error = Speed_Set-QD_Interval;

  
  /****速度环比例控制****/
   Spe_nP = Spe_Kp*Speed_Error;
  
  /****速度环积分控制****/
    Spe_nI = Spe_Ki*Speed_Error;
    Spe_nI= Spe_nI_Last+Spe_nI;
    Spe_nI_Last = Spe_nI;
  
  /****速度环微分控制****/
    Spe_nD = Spe_Kd*(Speed_Error-Speed_Error_Last);
    Speed_Error_Last = Speed_Error;
  
  
  
  /****速度环积分限幅****/
  if(Spe_nI > Spe_nI_MAX)
    Spe_nI = Spe_nI_MAX;
  if(Spe_nI < Spe_nI_MIN)
    Spe_nI= Spe_nI_MIN;  
  if(Spe_nI_Last > Spe_nI_Last_MAX)
    Spe_nI_Last = Spe_nI_Last_MAX;
  if(Spe_nI_Last< Spe_nI_Last_MIN)
    Spe_nI_Last = Spe_nI_Last_MIN;
 
  /****速度环输出限幅****/  
  Speed_Control_Out = (Spe_nP+Spe_nI+Spe_nD);
  
  if(Speed_Control_Out > Speed_Control_Out_MAX)
    Speed_Control_Out = Speed_Control_Out_MAX;
  else if(Speed_Control_Out < Speed_Control_Out_MIN)
    Speed_Control_Out = Speed_Control_Out_MIN;
  //Speed_Control_Out*=8;
  Motor_Drive((int16)(Speed_Control_Out));
  
}



void Show_Num(void)
{
  LCD_CLS();
  char error[15];
  char set[15];
  char speed[15];
  char out[15];
  char stop[15];
  sprintf(error, "Error:%d", Error);
  sprintf(set, "SpeedSet:%d", Speed_Set);
  sprintf(speed, "Speed:%d", QD_Interval);
  sprintf(out, "Out:%d", Speed_Control_Out); 
  sprintf(stop, "Stop:%d", should_stop); 
  LCD_P6x8Str(0, 0, error);
  LCD_P6x8Str(0, 1, set);
  LCD_P6x8Str(0, 2, speed);
  LCD_P6x8Str(0, 3, out);
  LCD_P6x8Str(0, 4, stop);
}

