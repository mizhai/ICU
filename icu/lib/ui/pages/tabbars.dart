import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:icu/ui/pages/home/home.dart';
import 'package:icu/ui/pages/pozhuhao/C/pozhuhao.dart';
import 'package:icu/ui/pages/wenda/wenda.dart';
import 'package:icu/ui/pages/my/my.dart';



class Mytabbar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MytabbarState();
  }
}

class MytabbarState extends State<Mytabbar> {
   ///页面底部当前tab选中值
  int _tabIndex = 0;
   /// 设置底部TabItem上的图标数组
  var tabItemages;
   /// 底部按钮文字
  var appBarTitles = ['首页','破竹号','问答','我的'];
   /// 页面内容区域
  var _body;
   /// 默认字体颜色
  final taBTextStyleNormal = new TextStyle(color: Colors.black);
   /// 选中字体颜色
  final taBTextStyleSelected = new TextStyle(color: Colors.orange);


  /// 获取图片数据
  void initData() {
     if (tabItemages ==null) {
       tabItemages = [
         [
           getTabImage('images/home.png'),
           getTabImage('images/home_select.png')
         ],
         [
           getTabImage('images/pzh.png'),
           getTabImage('images/pzh_select.png')
         ],
         [
           getTabImage('images/wenda.png'),
           getTabImage('images/wenda_select.png')
         ],
         [
           getTabImage('images/wode.png'),
           getTabImage('images/wode_select.png')
         ]
       ];
     }

     _body = new IndexedStack(
        children: <Widget>[
         new Homepage(),
         new Pozhuhaopage(),
         new Wendapage(),
         new Mypage()
         ],
       index: _tabIndex,
      );
   }

   /// 根据索引值确定Tab是选中状态的样式还是非选中状态的样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return taBTextStyleSelected;
    }
    return taBTextStyleNormal;
  }

  /// 设置图片样式
 Image getTabImage(path){
     return new Image.asset(
       path,
       width: 20,
       height: 20
     );
   }
   /// 获取items 
   List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> list = new List();
    for (var i = 0; i < 4; i++) {
      list.add( new BottomNavigationBarItem(
        icon : getTabIcon(i),
        title: getTabTitle(i)
      ));
    }
    return list;
  }

  /// 设置选中时的图片
    Image getTabIcon(int curindex){
      if (curindex ==_tabIndex) {
          return tabItemages[curindex][1];
        }
      return tabItemages[curindex][0];
    }

/// 设置选中的文字
    Text getTabTitle(int curIndex){
      return new Text(
          appBarTitles[curIndex],
          style: getTabTextStyle(curIndex)
        );
    }

   @override
   Widget build(BuildContext context) {

     initData();


     return new MaterialApp(
       debugShowCheckedModeBanner: false,

       


       home: new Scaffold(
         body: _body,
         bottomNavigationBar: new CupertinoTabBar(
           items: getBottomNavItems(),
           currentIndex: _tabIndex,
           onTap: (index){
             setState(() {
               _tabIndex =index;
             });
           },
         ),
       ),
     );
    } 
}