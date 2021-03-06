//+------------------------------------------------------------------+
//|                                                        kdata.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, DollarKiller."
#property link      "https://github.com/dollarkillerx"

class Kdata 
{
public:
// 基本获取
   
   // 获得当前货币买价
   double getAsk();
   
   // 获得当前货币买价
   // params: 货币名称
   double getAsk(string symbol);
   
   // 获取卖价
   double getBid();
   
   // 获得卖价
   double getBid(string symbol);
   
   // 获得开盘价
   // params: 需要的数量,存储容器
   bool getOpen(int count,double &open[]);
   
   // 获得开盘价
   // params: 货币,周期,数量,容器
   bool getOpen(string symbol,ENUM_TIMEFRAMES tf,int count,double &open[]);
   
   // 获得收盘价
   // params: 需要的数量,存储容器
   bool getClose(int count,double &close[]);
   
   // 获得收盘价
   // params: 货币,周期,数量,容器
   bool getClose(string symbol,ENUM_TIMEFRAMES tf,int count,double &close[]);
   
   // 获取最高价
   // params: 需要的数量,存储容器   
   bool getHigh(int count,double &high[]);
   
   // 获取最高价
   // params: 货币,周期,数量,容器
   bool getHigh(string symbol,ENUM_TIMEFRAMES tf,int count,double &high[]);
   
   // 获取最低价
   // params: 需要的数量,存储容器   
   bool getLow(int count,double &low[]);
   
   // 获取最低价
   // params: 货币,周期,数量,容器
   bool getLow(string symbol,ENUM_TIMEFRAMES tf,int count,double &low[]);
   
   // 获取历史成交量
   // params: 需要的数量,存储容器 
   bool getRealVolumn(int count,ulong &tols[]);
   
   // 获取历史成交量
   // params: 货币,周期,数量,容器
   bool getRealVolumn(string symbol,ENUM_TIMEFRAMES tf,int count,ulong &low[]);
   
   // 返回市场深度
   // params: 容器
   bool getMarketBook(MqlBookInfo &book[]);
   
   // 返回市场深度
   // params: 货币,容器
   bool getMarketBook(string symbol,MqlBookInfo &book[]);
   
   // 获取MqlRates 历史数据
   // params: 数量,容器
   bool getRates(int count,MqlRates &rates[]);
   
   // 获取MqlRates 历史数据
   // params: 货币,周期,数量,容器
   bool getRates(string symbol,ENUM_TIMEFRAMES tf,int count,MqlRates &rates[]);
   
// 指标获取

   // MA
   bool MA(
      string               symbol,            // 交易品种名称 
      ENUM_TIMEFRAMES      period,            // 周期 
      int                  ma_period,         // 平均周期 
      int                  ma_shift,          // 平移 
      ENUM_MA_METHOD       ma_method,         // 平滑类型 
      ENUM_APPLIED_PRICE   applied_price,      // 价格或者处理程序类型 
      double &ma[], // 容器
      int count // 数量
   );
   
   // AC
   int  AC( 
    double &data0[],
    int count,
    string           symbol,     // 交易品种名称 
    ENUM_TIMEFRAMES  period      // 周期
   );
   
   // AD
   int  AD( 
    double &data0[],
    int count,
    string               symbol,             // 交易品种名称 
    ENUM_TIMEFRAMES      period,             // 周期 
    ENUM_APPLIED_VOLUME  applied_volume      // 用于计算的交易量类型 
   );
   
   // ADX
   int  ADX( 
    double &data0[],
    double &data1[],
    double &data2[],
    int count,
    string           symbol,         // 交易品种名称 
    ENUM_TIMEFRAMES  period,         // 周期 
    int              adx_period      // 平均周期 
   );
   
   // ADXWilder
   int  ADXWilder( 
    double &data0[],
    double &data1[],
    double &data2[],
    int count,
   string           symbol,         // 交易品种名称 
   ENUM_TIMEFRAMES  period,         // 周期 
   int              adx_period      // 平均周期 
   );
   
   // Alligator
   int  Alligator( 
    double &data0[],
    double &data1[],
    double &data2[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 jaw_period,        // 咽喉计算周期 
   int                 jaw_shift,         // 咽喉平移 
   int                 teeth_period,      // 牙齿计算周期 
   int                 teeth_shift,       // 牙齿平移 
   int                 lips_period,       // 唇部计算周期 
   int                 lips_shift,        // 唇部平移 
   ENUM_MA_METHOD      ma_method,         // 平滑类型 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  AMA( 
    double &data0[],
    int count,
   string              symbol,             // 交易品种名称 
   ENUM_TIMEFRAMES     period,             // 周期 
   int                 ama_period,         //  AMA平均周期 
   int                 fast_ma_period,     // 快速 MA 周期 
   int                 slow_ma_period,     // 慢速 MA 周期 
   int                 ama_shift,          // 指标平移 
   ENUM_APPLIED_PRICE  applied_price       // 价格或者处理器类型 
   );
   
   int  AO( 
    double &data0[],
    int count,
   string           symbol,     // 交易品种名称 
   ENUM_TIMEFRAMES  period      // 周期 
   );
   
   int  ATR( 
    double &data0[],
    int count,
   string           symbol,        // 交易品种名称 
   ENUM_TIMEFRAMES  period,        // 周期 
   int              ma_period      // 平均周期  
   );
   
   int  BearsPower( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period         // 平均周期 
   );
   
   // 布林带
   int  Bands( 
    double &data0[], // 中轨
    double &data1[], // 上轨
    double &data2[], // 下轨
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 bands_period,      // 平均线计算周期 
   int                 bands_shift,       // 指标平移 
   double              deviation,         // 标准差数 
   ENUM_APPLIED_PRICE  applied_price      // 价格或处理器类型 
   );
   
   int  BullsPower( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period         // 平均周期 
   );
   
   int  CCI( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   ENUM_APPLIED_PRICE  applied_price      // 价格或处理器类型 
   );
   
   int  Chaikin( 
    double &data0[],
    int count,
   string               symbol,             // 交易品种名称 
   ENUM_TIMEFRAMES      period,             // 周期 
   int                  fast_ma_period,     // 快速周期 
   int                  slow_ma_period,     // 慢速周期 
   ENUM_MA_METHOD       ma_method,          // 平滑类型 
   ENUM_APPLIED_VOLUME  applied_volume      // 交易量类型 
   );
   
   int  DEMA( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   int                 ma_shift,          // 平移 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  DeMarker( 
    double &data0[],
    int count,
   string           symbol,        // 交易品种名称 
   ENUM_TIMEFRAMES  period,        // 周期 
   int              ma_period      // 平均周期 
   );
   
   int  Envelopes( 
    double &data0[],
    double &data1[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均线计算周期 
   int                 ma_shift,          // 指标平移 
   ENUM_MA_METHOD      ma_method,         // 平滑类型 
   ENUM_APPLIED_PRICE  applied_price,     // 价格或者处理器类型 
   double              deviation          // 中线边界差(百分率) 
   );
   
   int  Force( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   ENUM_MA_METHOD      ma_method,         // 平滑类型 
   ENUM_APPLIED_VOLUME applied_volume     // 计算的交易量类型 
   );
   
   int  Fractals( 
    double &data0[],
    double &data1[],
    int count,
   string           symbol,     // 交易品种名称 
   ENUM_TIMEFRAMES  period      // 周期 
   );
   
   int  FrAMA( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   int                 ma_shift,          // 图表平移 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  Gator( 
    double &data0[],
    double &data1[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 jaw_period,        // 咽喉计算周期 
   int                 jaw_shift,         // 咽喉平移 
   int                 teeth_period,      // 牙齿计算周期 
   int                 teeth_shift,       // 牙齿平移 
   int                 lips_period,       // 唇部计算周期 
   int                 lips_shift,        // 唇部平移 
   ENUM_MA_METHOD      ma_method,         // 平滑类型 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  Ichimoku( 
    double &data0[],
    double &data1[],
    double &data2[],
    double &data3[],
    double &data4[],
    int count,
   string           symbol,            // 交易品种类型 
   ENUM_TIMEFRAMES  period,            // 周期 
   int              tenkan_sen,        // Tenkan-sen转换线周期 
   int              kijun_sen,         // Kijun-sen基准线周期 
   int              senkou_span_b      // Senkou Span B周期 
   );
   
   int  BWMFI( 
    double &data0[],
    int count,
   string               symbol,             // 交易品种类型 
   ENUM_TIMEFRAMES      period,             // 周期 
   ENUM_APPLIED_VOLUME  applied_volume      // 计算的交易量类型 
   );
   
   int  Momentum( 
    double &data0[],
    int count,
   string               symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES      period,            // 周期 
   int                  mom_period,        // 平均周期 
   ENUM_APPLIED_PRICE   applied_price      // 价格或者处理器类型 
   );
   
   int  MFI( 
    double &data0[],
    int count,
   string               symbol,             // 交易品种名称 
   ENUM_TIMEFRAMES      period,             // 周期 
   int                  ma_period,          // 平均周期 
   ENUM_APPLIED_VOLUME  applied_volume      // 计算的交易量类型 
   );
   
   int  OsMA( 
    double &data0[],
    int count,
   string              symbol,              // 交易品种名称 
   ENUM_TIMEFRAMES     period,              // 周期 
   int                 fast_ema_period,     // 快速移动平均数周期 
   int                 slow_ema_period,     // 慢速移动平均数周期 
   int                 signal_period,       // 不同点的平均周期 
   ENUM_APPLIED_PRICE  applied_price        // 价格或者处理器的类型 
   );
   
   int  MACD( 
    double &data0[],
    double &data1[],
    int count,
   string              symbol,              // 交易品种名称 
   ENUM_TIMEFRAMES     period,              // 周期 
   int                 fast_ema_period,     // 快速移动平均数周期 
   int                 slow_ema_period,     // 慢速移动平均数周期 
   int                 signal_period,       // 不同点的平均周期 
   ENUM_APPLIED_PRICE  applied_price        // 价格或者处理器的类型 
   );
   
   int  OBV( 
    double &data0[],
    int count,
   string                symbol,             // 交易品种名称 
   ENUM_TIMEFRAMES       period,             // 周期 
   ENUM_APPLIED_VOLUME   applied_volume      // 计算的交易量类型 
   );
   
   int  SAR( 
    double &data0[],
    int count,
   string           symbol,      // 交易品种名称 
   ENUM_TIMEFRAMES  period,      // 周期 
   double           step,        // 逐步增加 
   double           maximum      // 最大止损水平 
   );
   
   int  RSI( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种类型 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  RVI( 
    double &data0[],
    double &data1[],
    int count,
   string           symbol,        // 交易品种名称 
   ENUM_TIMEFRAMES  period,        // 周期 
   int              ma_period      // 平均周期 
   );
   
   int  StdDev( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   int                 ma_shift,          // 平移 
   ENUM_MA_METHOD      ma_method,         // 平滑类型 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   // KDJ
   int  Stochastic( 
    double &data0[], // K
    double &data1[], // D
    int count,
   string           symbol,          // 交易品种名称 
   ENUM_TIMEFRAMES  period,          // 周期 
   int              Kperiod,         // K线周期 (用于计算的柱数) 
   int              Dperiod,         // D线周期 (开始平滑周期) 
   int              slowing,         // 最终平滑 
   ENUM_MA_METHOD   ma_method,       // 平滑类型 
   ENUM_STO_PRICE   price_field      // 随机计算法 
   );
   
   int  TEMA( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   int                 ma_shift,          // 指标平移 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  TriX( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 ma_period,         // 平均周期 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  WPR( 
    double &data0[],
    int count,
   string           symbol,          // 交易品种名称 
   ENUM_TIMEFRAMES  period,          // 周期 
   int              calc_period      // 平均周期 
   );
   
   int  VIDyA( 
    double &data0[],
    int count,
   string              symbol,            // 交易品种名称 
   ENUM_TIMEFRAMES     period,            // 周期 
   int                 cmo_period,        // Chande 动量指标周期 
   int                 ema_period,        // EMA 平滑周期 
   int                 ma_shift,          // 价格图表平移 
   ENUM_APPLIED_PRICE  applied_price      // 价格或者处理器类型 
   );
   
   int  Volumes( 
    double &data0[],
    int count,
   string               symbol,             // 交易品种名称 
   ENUM_TIMEFRAMES      period,             // 周期 
   ENUM_APPLIED_VOLUME  applied_volume      // 计算的交易量类型 
   );
   
   int  ZigZag(
    double &data0[],
    int count,
   string               symbol,             // 交易品种名称 
   ENUM_TIMEFRAMES      period,             // 周期 
   int   ExtDepth,
   int   ExtDeviation,
   int   ExtBackstep
   );
   
   void getzigzag(double &zigzag[][4],int geshu,int ExtDepth,int ExtDeviation,int ExtBackstep);
   
   int gettime(datetime &time[],int count,string symbol,ENUM_TIMEFRAMES tf);
   int gettime(datetime &time[],int count);
   int getlow(double &low[],int count,string symbol,ENUM_TIMEFRAMES tf);
   int getlow(double &low[],int count);
};

double Kdata::getAsk() {
   return this.getAsk(Symbol());
}

double Kdata::getAsk(string symbol) {
   return SymbolInfoDouble(symbol,SYMBOL_ASK);
}

double Kdata::getBid() {
   return this.getBid(Symbol());
}

double Kdata::getBid(string symbol) {
   return SymbolInfoDouble(symbol,SYMBOL_BID);
}

bool Kdata::getOpen(int count,double &open[]) {
   return this.getOpen(Symbol(),0,count,open);
}

bool Kdata::getOpen(string symbol,ENUM_TIMEFRAMES tf,int count,double &open[]) {
   if (ArraySetAsSeries(open,true)) {
      if (CopyOpen(symbol,tf,0,count,open) != -1) {
         return true;
      }
   }
   return false;
}

bool Kdata::getClose(int count,double &close[]) {
   return this.getClose(Symbol(),0,count,close);
}

bool Kdata::getClose(string symbol,ENUM_TIMEFRAMES tf,int count,double &close[]) {
   if (ArraySetAsSeries(close,true)) {
      if (CopyClose(symbol,tf,0,count,close) != -1) {
         return true;
      }
   }
   return false;
}

bool Kdata::getHigh(int count,double &high[]) {
   return this.getHigh(Symbol(),0,count,high);
}

bool Kdata::getHigh(string symbol,ENUM_TIMEFRAMES tf,int count,double &high[]) {
   if (ArraySetAsSeries(high,true)) {
      if (CopyHigh(symbol,tf,0,count,high) != -1) {
         return true;
      }
   }
   return false;
}

bool Kdata::getLow(int count,double &low[]) {
   return this.getLow(Symbol(),0,count,low);
}

bool Kdata::getLow(string symbol,ENUM_TIMEFRAMES tf,int count,double &low[]) {
   if (ArraySetAsSeries(low,true)) {
      if (CopyLow(symbol,tf,0,count,low) != -1) {
         return true;
      }
   }
   return false;   
}

bool Kdata::getRealVolumn(int count,ulong &tols[]) {
   return this.getRealVolumn(Symbol(),0,count,tols);
}

bool Kdata::getRealVolumn(string symbol,ENUM_TIMEFRAMES tf,int count,ulong &tols[]) {
   if (ArraySetAsSeries(tols,true)) {
      if (CopyRealVolume(symbol,tf,0,count,tols) != -1) {
         return true;
      }
   }
   return false;
}

bool Kdata::getMarketBook(MqlBookInfo &book[]) {
   return this.getMarketBook(Symbol(),book);
}

bool Kdata::getMarketBook(string symbol,MqlBookInfo &book[]) {
   if (ArraySetAsSeries(book,false)) {
      return MarketBookGet(symbol,book);
   }
   return false;
}

bool Kdata::getRates(int count,MqlRates &rates[]) {
   return this.getRates(Symbol(),0,count,rates);
}

bool Kdata::getRates(string symbol,ENUM_TIMEFRAMES tf,int count,MqlRates &rates[]) {
   if (ArraySetAsSeries(rates,true)) {
      if (CopyRates(symbol,tf,0,count,rates) != -1) {
         return true;
      }
   }
   return false;
}

//************************************************************************************ 指标分界线

bool Kdata::MA(
      string               symbol,            // 交易品种名称 
      ENUM_TIMEFRAMES      period,            // 周期 
      int                  ma_period,         // 平均周期 
      int                  ma_shift,          // 平移 
      ENUM_MA_METHOD       ma_method,         // 平滑类型 
      ENUM_APPLIED_PRICE   applied_price,     // 价格或者处理程序类型 
      double &ma[], // 容器
      int count  // 获取数量             
){
   if (ArraySetAsSeries(ma,true)) {
      int point = iMA(symbol,period,ma_period,ma_shift,ma_method,applied_price);
      if (point != -1) {
         if (CopyBuffer(point,0,0,count,ma) != -1) {
            return true;
         }
      }
   }
   return false;          
}

int Kdata::AC(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period)
{
   int h=iAC(symbol,period);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::AD(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,ENUM_APPLIED_VOLUME applied_volume)
{
   int h=iAD(symbol,period,applied_volume);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::ADXWilder(double &data0[],double &data1[],double &data2[],int count,string symbol,ENUM_TIMEFRAMES period,int adx_period)
{
   int h=iADXWilder(symbol,period,adx_period);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   ArraySetAsSeries(data2,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   a=CopyBuffer(h,2,0,count,data2);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::AMA(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ama_period,int fast_ma_period,int slow_ma_period,int ama_shift,ENUM_APPLIED_PRICE applied_price)
{
   int h=iAMA(symbol,period,ama_period,fast_ma_period,slow_ma_period,ama_shift,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::AO(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period)
{
   int h=iAO(symbol,period);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::ATR(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period)
{
   int h=iATR(symbol,period,ma_period);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Alligator(double &data0[],double &data1[],double &data2[],int count,string symbol,ENUM_TIMEFRAMES period,int jaw_period,int jaw_shift,int teeth_period,int teeth_shift,int lips_period,int lips_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price)
{
   int h=iAlligator(symbol,period,jaw_period,jaw_shift,teeth_period,teeth_shift,lips_period,lips_shift,ma_method,applied_price);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   ArraySetAsSeries(data2,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   a=CopyBuffer(h,2,0,count,data2);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::BWMFI(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,ENUM_APPLIED_VOLUME applied_volume)
{
   int h=iBWMFI(symbol,period,applied_volume);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Bands(double &data0[],double &data1[],double &data2[],int count,string symbol,ENUM_TIMEFRAMES period,int bands_period,int bands_shift,double deviation,ENUM_APPLIED_PRICE applied_price)
{
   //int h=iCustom(symbol,period,"Examples\\BB",bands_period,bands_shift,deviation);
   int h=iBands(symbol,period,bands_period,bands_shift,deviation,applied_price);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   ArraySetAsSeries(data2,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   a=CopyBuffer(h,2,0,count,data2);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::BearsPower(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period)
{
   int h=iBearsPower(symbol,period,ma_period);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::BullsPower(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period)
{
   int h=iBullsPower(symbol,period,ma_period);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::CCI(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_APPLIED_PRICE applied_price)
{
   int h=iCCI(symbol,period,ma_period,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Chaikin(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int fast_ma_period,int slow_ma_period,ENUM_MA_METHOD ma_method,ENUM_APPLIED_VOLUME applied_volume)
{
   int h=iChaikin(symbol,period,fast_ma_period,slow_ma_period,ma_method,applied_volume);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::DEMA(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_APPLIED_PRICE applied_price)
{
   int h=iDEMA(symbol,period,ma_period,ma_shift,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::DeMarker(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period)
{
   int h=iDeMarker(symbol,period,ma_period);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Envelopes(double &data0[],double &data1[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price,double deviation)
{
   int h=iEnvelopes(symbol,period,ma_period,ma_shift,ma_method,applied_price,deviation);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Force(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_MA_METHOD ma_method,ENUM_APPLIED_VOLUME applied_volume)
{
   int h=iForce(symbol,period,ma_period,ma_method,applied_volume);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::FrAMA(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_APPLIED_PRICE applied_price)
{
   int h=iFrAMA(symbol,period,ma_period,ma_shift,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Fractals(double &data0[],double &data1[],int count,string symbol,ENUM_TIMEFRAMES period)
{
   int h=iFractals(symbol,period);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Gator(double &data0[],double &data1[],int count,string symbol,ENUM_TIMEFRAMES period,int jaw_period,int jaw_shift,int teeth_period,int teeth_shift,int lips_period,int lips_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price)
{
   int h=iGator(symbol,period,jaw_period,jaw_shift,teeth_period,teeth_shift,lips_period,lips_shift,ma_method,applied_price);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Ichimoku(double &data0[],double &data1[],double &data2[],double &data3[],double &data4[],int count,string symbol,ENUM_TIMEFRAMES period,int tenkan_sen,int kijun_sen,int senkou_span_b)
{
   int h=iIchimoku(symbol,period,tenkan_sen,kijun_sen,senkou_span_b);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   ArraySetAsSeries(data2,true);
   ArraySetAsSeries(data3,true);
   ArraySetAsSeries(data4,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   a=CopyBuffer(h,2,0,count,data2);
   a=CopyBuffer(h,3,0,count,data3);
   a=CopyBuffer(h,4,0,count,data4);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::MACD(double &data0[],double &data1[],int count,string symbol,ENUM_TIMEFRAMES period,int fast_ema_period,int slow_ema_period,int signal_period,ENUM_APPLIED_PRICE applied_price)
{
   int h=iMACD(symbol,period,fast_ema_period,slow_ema_period,signal_period,applied_price);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::MFI(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_APPLIED_VOLUME applied_volume)
{
   int h=iMFI(symbol,period,ma_period,applied_volume);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Momentum(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int mom_period,ENUM_APPLIED_PRICE applied_price)
{
   int h=iMomentum(symbol,period,mom_period,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::OBV(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,ENUM_APPLIED_VOLUME applied_volume)
{
   int h=iOBV(symbol,period,applied_volume);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::OsMA(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int fast_ema_period,int slow_ema_period,int signal_period,ENUM_APPLIED_PRICE applied_price)
{
   int h=iOsMA(symbol,period,fast_ema_period,slow_ema_period,signal_period,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::RSI(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_APPLIED_PRICE applied_price)
{
   int h=iRSI(symbol,period,ma_period,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::RVI(double &data0[],double &data1[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period)
{
   int h=iRVI(symbol,period,ma_period);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::SAR(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,double step,double maximum)
{
   int h=iSAR(symbol,period,step,maximum);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::StdDev(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_MA_METHOD ma_method,ENUM_APPLIED_PRICE applied_price)
{
   int h=iStdDev(symbol,period,ma_period,ma_shift,ma_method,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Stochastic(double &data0[],double &data1[],int count,string symbol,ENUM_TIMEFRAMES period,int Kperiod,int Dperiod,int slowing,ENUM_MA_METHOD ma_method,ENUM_STO_PRICE price_field)
{
   int h=iStochastic(symbol,period,Kperiod,Dperiod,slowing,ma_method,price_field);
   ArraySetAsSeries(data0,true);
   ArraySetAsSeries(data1,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   a=CopyBuffer(h,1,0,count,data1);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::TEMA(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,int ma_shift,ENUM_APPLIED_PRICE applied_price)
{
   int h=iTEMA(symbol,period,ma_period,ma_shift,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::TriX(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ma_period,ENUM_APPLIED_PRICE applied_price)
{
   int h=iTriX(symbol,period,ma_period,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::VIDyA(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int cmo_period,int ema_period,int ma_shift,ENUM_APPLIED_PRICE applied_price)
{
   int h=iVIDyA(symbol,period,cmo_period,ema_period,ma_shift,applied_price);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::Volumes(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,ENUM_APPLIED_VOLUME applied_volume)
{
   int h=iVolumes(symbol,period,applied_volume);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
int Kdata::ZigZag(double &data0[],int count,string symbol,ENUM_TIMEFRAMES period,int ExtDepth,int ExtDeviation,int ExtBackstep)
{
   int h=iCustom(symbol,period,"Examples\\ZigZag",ExtDepth,ExtDeviation,ExtBackstep);
   ArraySetAsSeries(data0,true);
   int a;
   a=CopyBuffer(h,0,0,count,data0);
   //IndicatorRelease(h);
   return(a);
}
void Kdata::getzigzag(double &zigzag[][4],int geshu,int ExtDepth,int ExtDeviation,int ExtBackstep)
{
    ArrayResize(zigzag,geshu);
    ArrayInitialize(zigzag,0);
    double zigzagzhi[];
    int bars=Bars(Symbol(),0);
    ZigZag(zigzagzhi,bars,Symbol(),0,ExtDepth,ExtDeviation,ExtBackstep);
    datetime time[];
    gettime(time,bars);
    double low[];
    getlow(low,bars); 
    int jishu=0;
    for(int i=0;i<bars;i++)
     {
        if(jishu>(geshu-1))
         {
           break;
         }
        if(zigzagzhi[i]>0)
         {
           zigzag[jishu][0]=zigzagzhi[i];//记录高低点的值
           zigzag[jishu][1]=i;//记录高低点所在的K线序号
           zigzag[jishu][2]=(int)time[i];//记录高低点所在K线的时间
           //string ts=TimeToString(zigzag[jishu][2]);
           if(zigzagzhi[i]<=low[i])//低点
            {
              zigzag[jishu][3]=1;//如果值等于1，说明是低点
            }
           else//高点
            {
              zigzag[jishu][3]=2;//如果值等于2，说明是高点
            }
           jishu++;
         }
     }
}

int Kdata::gettime(datetime &time[],int count,string symbol,ENUM_TIMEFRAMES tf)
{
    ArraySetAsSeries(time,true);
    int a=CopyTime(symbol,tf,0,count,time);
    return(a);
}
int Kdata::gettime(datetime &time[],int count)
{
    ArraySetAsSeries(time,true);
    int a=CopyTime(Symbol(),0,0,count,time);
    return(a);
}

int Kdata::getlow(double &low[],int count,string symbol,ENUM_TIMEFRAMES tf)
{
   ArraySetAsSeries(low,true);
   return(CopyLow(symbol,tf,0,count,low));
}
int Kdata::getlow(double &low[],int count)
{
   ArraySetAsSeries(low,true);
   return(CopyLow(Symbol(),0,0,count,low));
}
// 一些基础定义
