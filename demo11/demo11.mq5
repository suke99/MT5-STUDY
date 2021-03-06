//+------------------------------------------------------------------+
//|                                                       demo11.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
// #property indicator_separate_window  // 画在辅图上面
 #property indicator_chart_window       // 画在主图上
#property indicator_minimum -2       // min
#property indicator_maximum 2        // max
#property indicator_buffers 3        // 数据缓冲区
#property indicator_plots   3        // 画 plot 的数量
//--- plot line1
#property indicator_label1  "line1"     // 名称
#property indicator_type1   DRAW_LINE   // 类型
#property indicator_color1  clrRed      // color
#property indicator_style1  STYLE_SOLID // 实线还是虚线
#property indicator_width1  1           // 线宽度
//--- plot arrow1
#property indicator_label2  "arrow1"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrYellow
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1
//--- plot his1
#property indicator_label3  "his1"
#property indicator_type3   DRAW_HISTOGRAM
#property indicator_color3  clrWhite
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1
//--- indicator buffers
double         line1Buffer[];   // 数据缓冲区定义
double         arrow1Buffer[];
double         his1Buffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   IndicatorSetString(INDICATOR_SHORTNAME,"设置指标名称");
   IndicatorSetInteger(INDICATOR_DIGITS,Digits()); // 设置精度
//--- indicator buffers mapping
   SetIndexBuffer(0,line1Buffer,INDICATOR_DATA);// 缓冲区绑定
   SetIndexBuffer(1,arrow1Buffer,INDICATOR_DATA);
   SetIndexBuffer(2,his1Buffer,INDICATOR_DATA);
//--- setting a code from the Wingdings charset as the property of PLOT_ARROW
   PlotIndexSetInteger(1,PLOT_ARROW,204); // 设置箭头样式 Wingdings
   //ArraySetAsSeries(line1Buffer,true);
   //ArraySetAsSeries(his1Buffer,true); 
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,        // 目前图标k线数量
                const int prev_calculated,    // 指标已经计算了多少根k线
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
   //ArraySetAsSeries(open,true);
//   int total = 0;
//   if (prev_calculated == 0) {
//      total = rates_total;
//   }else {
//      total = rates_total - prev_calculated + 1;
//   }
//   for (int i=0;i<(total);i++) {
//      line1Buffer[i] = open[i];
//   }
//   
//   for (int i = rates_total - 1;i>=prev_calculated;i--) {
//      arrow1Buffer[i] = close[i];
//   }

   // 调用系统自带的
   int ma_point = iMA(Symbol(),0,12,0,MODE_SMA,PRICE_CLOSE);
   CopyBuffer(ma_point,0,0,rates_total,arrow1Buffer);
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
