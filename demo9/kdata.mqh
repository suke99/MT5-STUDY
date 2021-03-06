//+------------------------------------------------------------------+
//|                                                        demo9.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, DollarkIller ."
#property link      "https://github.com/dollarkillerx"
class Kdata 
{
public:

   // 基础定义
   string symbol;
   double open[];     // k线开盘价
   double close[];    // k线截止价
   double high[];     // k线最高价
   double low[];      // k线最低价
   datetime time[];   // 开盘时间
   int spread[];      // 点差
   long readVolume[]; // 特定成交量
   long tickVolume[]; // 点击成交量 
   double ma[];       // ma
   double adx0[];     // adx0
   double adx1[];     // adx1
   double adx2[];     // adx2
   
   // 构造函数
   Kdata() {}
   Kdata(string name) {
      this.symbol = name;
   }
   
   // 获取买价格
   double getAsk() {
      return SymbolInfoDouble(this.symbol,SYMBOL_ASK);
   }
   
   // 获取卖价格
   double getBid() {
      return SymbolInfoDouble(this.symbol,SYMBOL_BID);
   }
   
   // 获取open[] 货币,周期,数量
   bool getOpen(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.open,true)) {
         if (CopyOpen(symbol,ft,0,count,this.open) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getOpen(int count) {
      return this.getOpen(Symbol(),0,count);
   }
   
   // 获取close[] 货币,周期,数量
   bool getClose(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.close,true)) {
         if (CopyClose(symbol,ft,0,count,this.close) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getClose(int count) {
      return this.getClose(Symbol(),0,count);
   }
   
   // 获取high[] 货币,周期,数量
   bool getHigh(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.high,true)) {
         if (CopyHigh(symbol,ft,0,count,this.high) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getHigh(int count) {
      return this.getHigh(Symbol(),0,count);
   }
   
    // 获取low[] 货币,周期,数量
   bool getLow(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.low,true)) {
         if (CopyLow(symbol,ft,0,count,this.low) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getLow(int count) {
      return this.getLow(Symbol(),0,count);
   }
   
   
    // 获取time[] 货币,周期,数量
   bool getTime(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.time,true)) {
         if (CopyTime(symbol,ft,0,count,this.time) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getTime(int count) {
      return this.getTime(Symbol(),0,count);
   }
   
       // 获取spread[] 货币,周期,数量
   bool getSpread(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.spread,true)) {
         if (CopySpread(symbol,ft,0,count,this.spread) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getSpread(int count) {
      return this.getSpread(Symbol(),0,count);
   }
   
          // 获取readVolume[] 货币,周期,数量
   bool getReadVolume(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.readVolume,true)) {
         if (CopyRealVolume(symbol,ft,0,count,this.readVolume) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getReadVolume(int count) {
      return this.getReadVolume(Symbol(),0,count);
   }


         // 获取tickVolume[] 货币,周期,数量
   bool getTickVolume(string symbol,ENUM_TIMEFRAMES ft,int count) {
      if (ArraySetAsSeries(this.tickVolume,true)) {
         if (CopyTickVolume(symbol,ft,0,count,this.tickVolume) != -1) {
            return true;
         }
      }
      return false;
   }
   
   bool getTickVolume(int count) {
      return this.getTickVolume(Symbol(),0,count);
   }   
   
   // iMA  交易品种,数量,周期,平均周期,平移,平滑类型,价格或者处理程序类型
   bool getMA(string symbol,int count,ENUM_TIMEFRAMES tf,int ma_tf,int ma_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price) { // 示例: (Symbol(),10,0,12,0,MODE_SMA,PRICE_CLOSE);// 12日均线 SMA  以收盘价计算
      int port;
      if (ArraySetAsSeries(this.ma,true)) {
         port = iMA(symbol,tf,ma_tf,ma_shift,ma_method,applied_price);
         if (CopyBuffer(port,0,0,count,this.ma) != -1) {
               // 拷贝完成后释放句柄
               IndicatorRelease(port);
               return true;
         }
      }
      return false;
   }
   
   // iADX
   void getADX(string symbol,int count,ENUM_TIMEFRAMES tf,int adx_tf) {
      ArraySetAsSeries(this.adx0,true);
      ArraySetAsSeries(this.adx1,true);
      ArraySetAsSeries(this.adx2,true);
  
      int id = iADX(symbol,tf,adx_tf);
      CopyBuffer(id,0,0,count,this.adx0);   
      CopyBuffer(id,1,0,count,this.adx1); 
      CopyBuffer(id,2,0,count,this.adx2);
      IndicatorRelease(id); 
   }   
};