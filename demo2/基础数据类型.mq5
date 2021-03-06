//+------------------------------------------------------------------+
//|                                                       基础数据类型.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

#property script_show_inputs;

input double lots=0.1;// this is test

//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+

// 定义常量  #define 名称  数据; 不用指定类型
#define CHANLIANG 67;
// 这是一个脚本
void OnStart()
  {
  printf("Init");
   // 变量
   int a=1234;
   double b=1.23;
   string c = "张三";
   color d=clrBlue;
   datetime e = D'2020.02.19';
   a = add(12,23);
   printf("data %d",a);
   
   string timeString = "2020.12.01";
   datetime time = StringToTime(timeString);
   printf(time);
   printf(TimeToString(time));
   
   string as = StringFormat("%s hello","world");
   int als = StringFind(as,"hello",0); // 目标  需要查询的内容  起始位置
   printf(als);
   
   string as1 = StringSubstr(as,1,2); // 目标 起始位置 结束位置
   printf(as1);
   
   string test1 = "1,2,3,4,5,6,7,8,9";
   
   string c2[]; // 定义一个数组 c2
   a = StringSplit(test1,",",c2); // 目标 特征符 目的地
   printf(a);
   int x = 200;
   testInt(x);
   printf(x);
  }
//+------------------------------------------------------------------+
int add(int x,int y) {
   return x + y;
}

void testInt(int &x) {
   x += x;
}