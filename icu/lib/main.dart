import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:icu/data/net/dio_util.dart';
import 'package:icu/common/common_index.dart';
import 'package:icu/ui/pages/tabbars.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}


class MyAppState extends State<MyApp> {
  Color _themeColor = Colors.white;



  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      home: Mytabbar(),
      theme: ThemeData(
        primaryColor: _themeColor,
      ),

    );
  }


  


  _init() {
    Options options = DioUtil.getDefOptions();
    DioUtil.openDebug();
    options.baseUrl = Constant.SERVER_ADDRESS;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }

  





}
