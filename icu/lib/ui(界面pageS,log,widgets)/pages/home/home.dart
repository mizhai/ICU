
import 'package:flutter/material.dart';



class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomepageState();
  }

}


class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('首页'),
      ),
      body: Text('data'),
    );
  }
}


