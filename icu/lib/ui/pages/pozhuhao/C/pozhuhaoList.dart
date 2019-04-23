import 'package:flutter/material.dart';
import 'package:icu/ui/pages/pozhuhao/V/pozhuhaoCat_item.dart';
import 'package:icu/data/repository/icu_repository.dart';
import 'package:icu/data/api/apis.dart';
import 'package:icu/common/common_index.dart';
import 'package:icu/ui/pages/pozhuhao/M/catmodel.dart';
import 'package:icu/data/net/dio_util.dart';

class PozhuhaoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PozhuhaoListPageState();
  }
}

class PozhuhaoListPageState extends State<PozhuhaoListPage> {
  var repository = ICURepository();

  catmodel _infomodel;

  @override
  void initState() {
    super.initState();
    _configData();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('破竹号列表'),
      ),
      body: ListView.builder(
        itemCount: _infomodel == null ? 0 :_infomodel.data.length,
        itemBuilder: (BuildContext content,int index) {
          return PozhuhaoCatitem(_infomodel.data[index]);
        },
      ),
    );
  }

  _configData() async{
     var params = Map<String, String>();
    repository.getpozhuhaoCat(params, (data , yorn){
      if (yorn) {
       
        setState(() {
           _infomodel = data;
        });
      }else {

      }
    });
  }



}