//+------------------------------------------------------------------+
//|                                      NewworkVerificationTest.mq5 |
//|                                                     DollarKiller |
//|                                 https://github.com/dollarkillerx |
//+------------------------------------------------------------------+
#property copyright "DollarKiller"
#property link      "https://github.com/dollarkillerx"
#property version   "1.00"
#include <NetworkVerification.mqh>
#include <user.mqh>
NetworkVerification nv("http://127.0.0.1:8080/auth",500);
User user;
Lib lib;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
    for (int i = 0;i<5;i++) {
       bool ok = login();
       if (ok) {
         printf("[网络验证] 登录成功");
       }else {
         printf("[网络验证] 登录失败");
       }
    }
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+

// 服务器验证测试
bool login() {
   datetime outtime;
   bool ok = nv.loginServer("dollarkiller","dollarkillr",string(user.id()),outtime);
   if (ok) {
      printf("OutTime %s",TimeToString(outtime));
      printf("lib server time: %s",lib.getServerTimeString());
      if (outtime > lib.getServerTime() == false) {
         return false;
      }else {
         return true;
      }
   }
   return false;
}