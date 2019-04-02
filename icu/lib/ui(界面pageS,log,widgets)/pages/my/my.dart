
import 'package:flutter/material.dart';



class Mypage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MypageState();
  }
}

class MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('个人中心'),
      ),
      body: Text('data'),
    );
  }
}