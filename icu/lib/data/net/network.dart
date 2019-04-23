import 'package:dio/dio.dart';
import 'package:icu/common/common_index.dart';



class TTDio {



  static const String GET = "get";
  static const String POST = "post";


  static void get(String url, Function callBack, {Map<String, String> params , Function errorCallBack}) async {
     _request(Constant.WAN_ANDROID + url, callBack, method: GET,params: params, errorCallBack: errorCallBack);
  }

  static void post(String url, Function callBack,{Map<String, String> params , Function errorCallBack}) async {
    _request(Constant.WAN_ANDROID + url, callBack, method: POST, params: params, errorCallBack: errorCallBack);

  }

  static void _request (String url, Function callBack, {String method, Map<String, String> params, Function errorCallBack}) async {
    String errorMsg = "";
    int statusCode;

    try {
      Response response;
      if (method == GET) {
         if (params != null && params.isNotEmpty) {
           StringBuffer parm = StringBuffer("?");
           params.forEach((key, value){
             parm.write('$key' + '=' + '$value' + "&");
           });
           String paramStr = parm.toString();
           paramStr = paramStr.substring(0, paramStr.length - 1);
           url += paramStr;
         }
         response = await Dio().get(url);
      }else {
         if (params != null && params.isNotEmpty) {
           response = await Dio().post(url, data: params);
         }else {
           response = await Dio().post(url);
         }
      }
      statusCode = response.statusCode;
      if (statusCode < 0) {
        errorMsg = "网络请求错误,状态码:" + statusCode.toString();
        _handError(errorCallBack, errorMsg);
        return;
      }

      if (callBack != null) {
        callBack(response.data);
      }
      
    } catch (exception) {
      _handError(errorCallBack, exception.toString());
    }
  }

  static void _handError(Function erroCallback, String errorMsg) {
    if (erroCallback != null) {
      erroCallback(errorMsg);
    }
    print('ErrorMsg' + errorMsg);
  }
}