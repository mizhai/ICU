
import 'package:flutter/material.dart';
import 'package:icu/data(网络数据层)/net/dio_util.dart';
import 'dart:io';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }

}


class HomepageState extends State<Homepage> {
  @override

  Widget build(BuildContext context) {
    _confiDat();
    return Scaffold(
      appBar:  AppBar(
        title: Text('首页'),
      ),
      body: Text('data'),
    );
  }


  _confiDat() {
     var params = Map<String, String>();
    params["id"] = "1";
    DioUtil().requestR(Method.get, "/home/home",data: '?id=1');
  }
}


