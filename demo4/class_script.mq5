//+------------------------------------------------------------------+
//|                                                 class_script.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
#include <class.mqh>
void OnStart()
  {
//---
   // People wang;  // 声明  (会自动释放内存)
   People wang("wangye",20);
   People *wang2 = new People("wangye",20); // 声明并实例化
  
   
   string name = wang.getName();
   printf(name);
   
   name = wang2.getName();
   printf(name);
   
   delete wang2;  // 释放内存
   
   wang.age = 22;
   printf(wang.age);
   
   printf(wang.getName("Hello"));
   
   printf(People::Chen(12,20)); // 静态函数调用
  }
//+------------------------------------------------------------------+
