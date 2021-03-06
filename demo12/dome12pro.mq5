//+------------------------------------------------------------------+
//|                                                    dome12pro.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property indicator_chart_window
#property indicator_buffers 8
#property indicator_plots   4
//--- plot line1
#property indicator_label1  "line1"
#property indicator_type1   DRAW_COLOR_LINE
#property indicator_color1  clrRed,clrLime
#property indicator_style1  STYLE_SOLID
#property indicator_width1  2
//--- plot line2
#property indicator_label2  "line2"
#property indicator_type2   DRAW_COLOR_LINE
#property indicator_color2  clrAqua,clrBlue
#property indicator_style2  STYLE_SOLID
#property indicator_width2  2
//--- plot up
#property indicator_label3  "up"
#property indicator_type3   DRAW_COLOR_ARROW
#property indicator_color3  clrOrangeRed,clrRed
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1
//--- plot down
#property indicator_label4  "down"
#property indicator_type4   DRAW_COLOR_ARROW
#property indicator_color4  clrMediumSeaGreen,clrDarkGreen
#property indicator_style4  STYLE_SOLID
#property indicator_width4  1
//--- indicator buffers
double         line1Buffer[];
double         line1Colors[];
double         line2Buffer[];
double         line2Colors[];
double         upBuffer[];
double         upColors[];
double         downBuffer[];
double         downColors[];

// 调用系统自带指数
int ma5_proint;
int ma10_proint;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,line1Buffer,INDICATOR_DATA);
   SetIndexBuffer(1,line1Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(2,line2Buffer,INDICATOR_DATA);
   SetIndexBuffer(3,line2Colors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(4,upBuffer,INDICATOR_DATA);
   SetIndexBuffer(5,upColors,INDICATOR_COLOR_INDEX);
   SetIndexBuffer(6,downBuffer,INDICATOR_DATA);
   SetIndexBuffer(7,downColors,INDICATOR_COLOR_INDEX);
   
   PlotIndexSetInteger(2,PLOT_ARROW,225);
   PlotIndexSetInteger(3,PLOT_ARROW,226);
   
// 调用系统自带
   ma5_proint = iMA(NULL,0,5,0,MODE_SMA,PRICE_CLOSE);
   ma10_proint = iMA(NULL,0,10,0,MODE_SMA,PRICE_CLOSE);
//---
   printf("Demo12 初始化完毕");
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   double ma5[];
   double ma10[];
   CopyBuffer(ma5_proint,0,0,rates_total,ma5);
   CopyBuffer(ma10_proint,0,0,rates_total,ma10);
   int start = 0;
   if(prev_calculated > 0)
     {
      start = prev_calculated - 1;
     }
   for(int i = start; i<rates_total; i++)
     {
      line1Buffer[i] = ma5[i];
      line2Buffer[i] = ma10[i];
      if(open[i] > ma5[i])
        {
         line1Colors[i] = 1; // 转换颜色
         line2Colors[i] = 1;
        }
        
        if (i != 0) {
         if (line1Buffer[i-1] < line2Buffer[i-1] && line1Buffer[i] >= line2Buffer[i]) {
            upBuffer[i] = line1Buffer[i] - 100 *Point();
         }
         if (line1Buffer[i-1] > line2Buffer[i-1] && line1Buffer[i] <= line2Buffer[i]) {
            downBuffer[i] = line1Buffer[i] + 100 *Point();
         }
        }
     }
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
