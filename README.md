# MT5-STUDY
MT5 study

MQL 是事件驱动类型的语言   更上层的语言把

### 基础部分
我们想来看看一个ea文件  的一些事件函数
```
int OnInit() 
{
    // 全局初始化函数
    return (INIT_SUCCEEDED); // 需返回一个枚举对象
    // return (INIT_FAILED);
}

int OnTick() 
{
    // tick 跳动一次 就会调用一次这个函数
}

void OnDeinit(const int reason) 
{
    // 程序生命周期结束的时候
    EventKillTimer();
}
```

简单函数
```
EventSetTimer(60);   //  60 秒执行一次 onTimer()中的代码  (注意 但onTimer()中代码执行时 OnTick()会阻塞)
EventKillTimer(60);  // 删除定时器

// Sleep(10000);  这个会阻塞其他操作 OnTick也会
printf(TimeToString(TimeLocal(),TIME_DATE|TIME_MINUTES|TIME_SECONDS));  // 这个获取的是本地时间
printf("Server Time: %s",TimeToString(TimeTradeServer(),TIME_DATE|TIME_MINUTES|TIME_SECONDS)); // 获取交易服务器的时间

if (TimeTradeServer() > D'2018.01.01') {
    printf("Kill Timer");
    EventKillTimer();
}
```

订单相关函数
```
void OnTrade() 
{
    // 交易发生时调用这个函数，改变下订单和持仓列表，订单历史记录和交易历史记录时会出现。当交易活动执行挂单，持仓/平仓，停止设置，启动挂单等等，订单和交易历史记录或者仓位和当前订单列表也会相应改变。
}



void  OnTradeTransaction( 
   const MqlTradeTransaction&    trans,        // 交易结构 
   const MqlTradeRequest&        request,      // 请求结构 
   const MqlTradeResult&         result        // 结果结构 
   )
  {
    // 
   
  }

```

其他鉴定函数
```
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
    //  gui 实践的监听
   if (id == CHARTEVENT_CLICK) {
      Alert("你单机了界面"," x: ",lparam," y: ",dparam);
   }
   
  }


//+------------------------------------------------------------------+
//| BookEvent function                                               |
//+------------------------------------------------------------------+
void OnBookEvent(const string &symbol)
  {
    // 市场深度发生改变的适合  (量价)
    printf(symbol," 货币 市场深度发生改变");  
   
  }
  // 市场深度监听需要初始化 MarketBookAdd(Symbol()); // 初始化监听市场深度  Symbol()自动适用你ea当前运行的货币
```

### EA编写时  常用函数1
```
string timeString = "2020.12.01";
datetime time = StringToTime(timeString);
printf(time);
printf(TimeToString(time));

string as = StringFormat("%s hello","world");
   
```

### 字符串处理函数
- StringFind    查询
- StringSubstr  截取
- StringSplit   拼接
```
// StringFind
   string as = StringFormat("%s hello","world");
   int als = StringFind(as,"hello",0); // 目标  需要查询的内容  起始位置
   printf(als);

// StringSubstr 截取
   string as1 = StringSubstr(as,1,2); // 目标 起始位置 结束位置
   printf(as1);

// StringSplit 拼接
   string test1 = "1,2,3,4,5,6,7,8,9";
   string c2[]; // 定义一个数组 c2
   a = StringSplit(test1,",",c2); // 目标 特征符 目的地
   printf(a);
```

### 外部接受用户输入参数
```
#property script_show_inputs;  // 编写脚本框默认是不显示的需要用这个把它调出来

// 操作 // 注释     
input double lots=0.1;// this is test  

```

### 中级语法
```
### 持久化

   // 获取Mql程序的信息 (info id)
   name = MQLInfoString(MQL_PROGRAM_NAME) + Symbol() + IntegerToString(majic);
   
   if (GlobalVariableCheck(name) != true) {
   GlobalVariableSet(name,0); // 持久化  里面应该是应该HASHMAP
   }

### 枚举类型
  enum duokong 
  {
    duo,// 多
    kong,// 空
    duokong,// 多&空
  };  
  input duokong duokongName=duo;// 多空

### 结构体
  // 结构体
  struct kbar 
  {
    double open;
    double close;
    double hight;
    datetime time;
  };

 // 结构体声明与赋值
   kbar kb;
   kb.open=1.1;
   kb.time = D'2020.01.01';
   kb.close = 1.2;

### 数组

   double a[]; // 空的 可变数组
   double a1[10]; // 不可变数组
   
   double c = a1[0];
   printf("a1 0 : %f",c);
   
   ArrayResize(a,2); // 调整动态数组大小 1.数组2.new数组大小
   a[0] = 1.1;

   # 操作价格数据 
   MqlRates rates[];
   ArraySetAsSeries(rates,true); // 序列化 索引
   CopyRates(NULL,0,0,100,rates); // 分配数据
   double op = rates[0].open;

### 循环语句
    int acs = 0;
    while(acs < 10) {
        acs++;
        printf(acs);
    }

    for(int i =0;i<100;i++) {
        printf(i);
    }
```
