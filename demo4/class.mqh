//+------------------------------------------------------------------+
//|                                                        class.mqh |
//|                        Copyright 2020, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2020, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"

class People
{
public:
    string name;
    int age;
    string getName() {
      return this.name;
    }
    // 函数重载
    string getName(string hel) {
      return hel + " " + this.name;
    }
    
    // 构造函数 和class名称一样
    People(string name,int age) {
      this.name = name;
      this.age = age;
      printf(__FUNCTION__); // __FUNCTION__ 内置变量  函数名称
    }
    // 析构函数
    ~People() {
    // 次类执行完毕 会执行这个   (mql 没有内存回收机制 是需要在这里手动回收内存  傻逼mt5 为什么不直接接入py呢)
    }
    
    static int Chen(int x,int y) { // 静态函数不需要声明可以直接调用
    return x * y;
    }
};

