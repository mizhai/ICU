import 'package:icu/data(网络数据层)/net/dio_util.dart';
import 'package:icu/data(网络数据层)/protocol(请求与返回实体类)/protocolModel.dart';
import 'package:icu/data(网络数据层)/api(url字段)/apis.dart';
import 'package:icu/common(常用类)/common_index.dart';
import 'dart:async';
class ICURepository {


  /// 获取破竹号列表页数据 parame
  Future<List<PozhuhaolistModel>> getPozhuhaoList(Map<String, String> parame) async {
    BaseRespR baseResp = await DioUtil().requestR(Method.get,ICUApi.getparameterSplicing(ICUApi.Pozhuhaoindex, parame));
    List<PozhuhaolistModel> pozhuhaolist = new List();
    print(baseResp.code);
    print('-----------------------------------ddddddd----------------------');

    if (baseResp == null) {
      print('失败了');
    }else if (baseResp.code != Constant.STATUS_SUCCESS) {
      print('失败了');
      return new Future.error(baseResp.msg);
    }

  
    if (baseResp.data != null) {
     
      List data =  baseResp.data['data'];
      pozhuhaolist = data.map((value){
        return PozhuhaolistModel.fromJson(value);

      }).toList();
    }

    print('-----------------------------------大大大大帅哒d----------------------');
    print(pozhuhaolist);
    return pozhuhaolist;
  }




}