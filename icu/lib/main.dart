import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:icu/data(网络数据层)/net/dio_util.dart';
import 'package:icu/common(常用类)/common_index.dart';
import 'package:icu/ui(界面pageS,log,widgets)/pages/tabbars.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}


class MyAppState extends State<MyApp> {
  Color _themeColor = Colours.app_main;



  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: Mytabbar(),
      theme: ThemeData.light().copyWith(
        primaryColor: _themeColor,
        accentColor: _themeColor,
        indicatorColor: _themeColor,
      ),

    );
  }


  


  _init() {
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Constant.SERVER_ADDRESS;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  





}
