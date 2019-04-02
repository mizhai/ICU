
import 'package:flutter/material.dart';

class Pozhuhaopage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PozhuhaopageState();
  }
}

class PozhuhaopageState extends State<Pozhuhaopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('破竹号'),
      ),
      body: Text('data'),
    );
  }
}