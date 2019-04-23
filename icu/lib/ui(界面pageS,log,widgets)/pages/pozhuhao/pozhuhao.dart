
import 'package:flutter/material.dart';
import 'package:icu/data(网络数据层)/repository(接口请求&数据解析)/icu_repository.dart';
import 'package:icu/data(网络数据层)/protocol(请求与返回实体类)/protocolModel.dart';
import 'package:icu/ui(界面pageS,log,widgets)/widgets/pozhuhaolist_item.dart';

class Pozhuhaopage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PozhuhaopageState();
  }
}

class PozhuhaopageState extends State<Pozhuhaopage> {
  ScrollController _controller = ScrollController();
  List<PozhuhaolistModel> pozhuhaolist = new List();
  var repository = ICURepository();
  bool isfresh = false;
  int _page = 1;
  //是否隐藏底部
  bool isBottomShow = false;
  //加载状态
  String statusShow = '加载中...';
  

  @override
   void initState() {
    super.initState();
    _configData();
    _controller.addListener((){
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _onGetMoreData();
      }
    });
   }

   Future _onGetMoreData() async {
     if (!isfresh) {
       setState(() {
        isfresh = true;
      });
      print('dsddsdsdsdsdsd');
      _page++;
      _configData();
     }
   }

   @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        title: Text('破竹号'),
      ),
      body: RefreshIndicator(

        child: ListView.builder(
           itemCount: pozhuhaolist == null ? 0 :pozhuhaolist.length + 1,
           itemBuilder: (BuildContext content,int index) {
              if (index == pozhuhaolist.length ) {
               return _getMoreDataWidget();
             }else {
               PozhuhaolistModel model = pozhuhaolist[index];
               return PozhuhaolistItem(model);
             }
           },
           controller: _controller,
        ),
        onRefresh: _onRefresh,
        
      )
    );
  }


  Future <Null> _onRefresh() async{
    isfresh = true;
    _page = 1;
    _configData();
  }



  _configData() {
    var params = Map<String, String>();
    params["member_id"] = "1";
    params['page'] = _page.toString();
    repository.getPozhuhaoList(params).then((list){
      setState(() {
        if (_page == 1) {
          pozhuhaolist.clear();
        }else {
          isBottomShow = true;
          isfresh = false;
        }
        pozhuhaolist.addAll(list);
      });
    });  
  }


  Widget _getMoreDataWidget(){
     return Center(
       child: Padding(
         padding:EdgeInsets.all(12.0),
         // Offstage就是实现加载后加载提示圆圈是否消失
         child:new Offstage(
         // widget 根据isBottomShow这个值来决定显示还是隐藏
         offstage: isBottomShow,
           child:
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Text(
                   //根据状态来显示什么
                   statusShow,
                   style:TextStyle(
                     color: Colors.grey[300],
                     fontSize: 16.0,
                   )
               ),
               //加载圆圈
               CircularProgressIndicator(
                 strokeWidth: 2.0,
               )
             ],
           ),
         )

       ),
     );
  }













}