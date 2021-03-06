//+------------------------------------------------------------------+
//|                                                         中极语法.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
string name;
int majic=1234;


// 枚举类型
enum duokong
  {
   duo,
   kong,
   duokong,
  };
input duokong duokongName=duo;// 多空

// 结构体
struct kbar
  {
   double            open;
   double            close;
   double            hight;
   datetime          time;
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(60);

// 结构体声明与赋值
   kbar kb;
   kb.open=1.1;
   kb.time = D'2020.01.01';
   kb.close = 1.2;



// 获取Mql程序的信息 (info id)
   name = MQLInfoString(MQL_PROGRAM_NAME) + Symbol() + IntegerToString(majic);

   if(GlobalVariableCheck(name) != true)
     {
      GlobalVariableSet(name,0); // 持久化  里面应该是应该HASHMAP
     }


   printf(duo);
   printf(kong);


   double a[]; // 空的 可变数组
   double a1[10]; // 不可变数组

   double c = a1[0];
   printf("a1 0 : %f",c);

   ArrayResize(a,2); // 调整动态数组大小 1.数组2.new数组大小
   a[0] = 1.1;


   MqlRates rates[];
   ArraySetAsSeries(rates,true); //序列化 索引
   CopyRates(NULL,0,0,100,rates); // 分配数据
   double op = rates[0].open;

   int acs = 0;
   while(acs < 10)
     {
      acs++;
      printf(acs);
     }

   for(int i =0; i<100; i++)
     {
      printf(i);
     }
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

// 获取symbol 的信息  (货币id,info类型)
   double s1 = SymbolInfoDouble(Symbol(),SYMBOL_BID);
   if(GlobalVariableGet("duook")==0)
     {
      printf("开单了   开单价格: " + DoubleToString(s1));
      GlobalVariableSet("duook",1);
     }
   else
     {
      printf("已经开单了");
     }
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

  }
//+------------------------------------------------------------------+
//| BookEvent function                                               |
//+------------------------------------------------------------------+
void OnBookEvent(const string &symbol)
  {
//---

  }
//+------------------------------------------------------------------+
