//+------------------------------------------------------------------+
//|                                                demo17_script.mq5 |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#include <transaction.mqh>
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
   Transction tc;
//   tc.buy(Symbol(),0.01,3000,30000,"this is test",888,100);
//   tc.buy(Symbol(),0.01,3000,30000,"this is test",666,100);
//   //printf(Symbol());
//   //// printf(SymbolName(Symbol(),true));
//   tc.sell(Symbol(),0.01,0,0,"tc",666,100);
//   tc.sell(Symbol(),0.01,0,0,"tc",888,100);
//   
//   //tc.closeAllBySymbol(Symbol(),10,888);
//   //tc.closeAllBuyBySymbol(Symbol(),100,888);
//   //tc.closeAllSellBySymbol(Symbol(),100,666);
//   
//   tc.closeAllBuyBySymbol(Symbol(),100,0);
//   tc.closeAllSellBySymbol(Symbol(),100,0);

   // 挂单测试
//   tc.buyPending(10000,Symbol(),0.01,0,0,"this is buy pending test",888,100);
//   tc.buyPending(10000,Symbol(),0.01,3000,3000,"this is buy pending test",888,100);
//   
//   tc.buyPending(1000,Symbol(),0.01,0,0,"this is buy pending test",888,100);
//   tc.buyPending(1000,Symbol(),0.01,3000,3000,"this is buy pending test",888,100);

   tc.sellPending(10000,Symbol(),0.01,0,0,"this is sell pending test",888,100);
   tc.sellPending(10000,Symbol(),0.01,30000,30000,"this is sell pending test",888,100);
   
   tc.sellPending(1000,Symbol(),0.01,0,0,"this is sell pending test",888,100);
   tc.sellPending(1000,Symbol(),0.01,6000,6000,"this is sell pending test",888,100);
  }
//+------------------------------------------------------------------+
