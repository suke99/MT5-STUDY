//+------------------------------------------------------------------+
//|                                         network_verification.mqh |
//|                                                     DollarKiller |
//|                                 https://github.com/dollarkillerx |
//+------------------------------------------------------------------+
#property copyright "DollarKiller"
#property link      "https://github.com/dollarkillerx"
// 网络验证部分 配合Golang 服务端
// 网络传输通过TLS加密 请在服务端使用HTTPS 不然这很容易被中间人攻击破坏了加密系统
#include <JAson.mqh>
#include <user.mqh>
Network nw;
class NetworkVerification
{
public:
   // 登录服务系统
   // params: 用户名,密码,MT5交易账户ID,账户过期时间
   // return: 是否登录成功
   string serverUrl;
   int timeout;
   // 初始化 
   // params: 传入服务器URL, 超时时间
   NetworkVerification(string serverUrl,int timeout);
   bool loginServer(string username,string password,string mt5ID,datetime &outTime);
};

NetworkVerification::NetworkVerification(string serverUrl,int timeout) {
   this.serverUrl = serverUrl;
   this.timeout = timeout;
}

bool NetworkVerification::loginServer(string username,string password,string mt5ID,datetime &outTime) {
   CJAVal js;
   js["username"] = username;
   js["password"] = password;
   js["mt5_id"] = mt5ID;
   
   string data = js.Serialize();
   string result;
   int res = nw.Post(this.serverUrl,data,this.timeout,result);
   js.Clear();
   js.Deserialize(result);
   if (res != 200 || js["out_time"].ToStr() == "") {
      printf("Server Login err HttpCode: %d",res);
      return false;
   }
   outTime = StringToTime(js["out_time"].ToStr());
   return true;
}
