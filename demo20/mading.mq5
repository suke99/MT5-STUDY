//+------------------------------------------------------------------+
//|                                                       mading.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| 亏损加仓马丁ea                                 |
//+------------------------------------------------------------------+
#include <transaction.mqh>
#include <kdata.mqh>
#include <img.mqh>
Kdata kdata;
Transction ts;
int OnInit()
  {
//--- create timer
   EventSetTimer(60);
   writeInit();
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Trade function                                                   |
//+------------------------------------------------------------------+
void OnTrade()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| TradeTransaction function                                        |
//+------------------------------------------------------------------+
void OnTradeTransaction(const MqlTradeTransaction& trans,
                        const MqlTradeRequest& request,
                        const MqlTradeResult& result)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   // 当发生点击事件
   if(id==CHARTEVENT_OBJECT_CLICK) {
      if (sparam == "duo") {
         Alert("Duo");
         // 按钮弹起
         ObjectSetInteger(0,"duo",OBJPROP_STATE,false);
         double lots = StringToDouble(ObjectGetString(0,"editlots",OBJPROP_TEXT));
         ts.buy(Symbol(),lots,0,0,"cc",999,200);
      }
   }
  }
//+------------------------------------------------------------------+
//| BookEvent function                                               |
//+------------------------------------------------------------------+
void OnBookEvent(const string &symbol)
  {
//---
   
  }
//+------------------------------------------------------------------+

void writeInit() {
   Img img;
   
   // Lable (画布坐标)
   img.lable("lable","this is lable",20,20);  // 一个标签
   
   string titles[] = {"this is lable","dollarkiller","fuck you"};
   img.lableduo("lables",titles,20,20,20,1); // 复数
   
   // Text (跟随k线)
   MqlRates rate[];
   kdata.getRates(50,rate);
   img.text("text跟随K线","跟随K线",rate[10].time,rate[10].low);
   
   // button (画布坐标)
   img.button("button","this is button",150,20,100,100);
   img.edit("edit","this is edit",30,30,200,30);
   
   // 面板编写测试
   img.lable("labellot","请输入下单量: ",300,20,3);
   img.edit("editlots","0.1",120,20,100,20,3);
   img.button("duo","开多单",120,100,80,20,3);
   img.button("kong","开空单",120,60,80,20,3);
}