
import 'package:flutter/material.dart';
import 'package:icu/data(网络数据层)/net/dio_util.dart';
import 'package:icu/data(网络数据层)/api(url字段)/apis.dart';
import 'package:dio/dio.dart';
class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }

}


class HomepageState extends State<Homepage> {
  @override

  Widget build(BuildContext context) {
    // _confiDat();
    return Scaffold(
      appBar:  AppBar(
        title: Text('首页'),
      ),
      body: Text('dataddddd'),
    );
  }


  _confiDat() async{
     var params = Map<String, String>();
     params["id"] = "1";
      BaseRespR baseResp = await DioUtil().requestR(Method.get,ICUApi.getparameterSplicing(ICUApi.ALLHOME,  params) ,data:'');
      print(baseResp.code);
       if (baseResp.code != 1) {
       print(baseResp.msg);
    }

    if (baseResp.data != null) {
       print(baseResp.data['bannerlist']);
    }

    //  var  par = Map<String, String>();
    //  par['params'] = '';
    //   BaseRespR baseResp1 = await DioUtil().requestR(Method.post, ICUApi.SendPlayLogURL,data: par);
    //   print(baseResp1);



      
  }
}


