import 'package:icu/data/net/dio_util.dart';
import 'package:icu/data/protocol/protocolModel.dart';
import 'package:icu/data/api/apis.dart';
import 'package:icu/common/common_index.dart';
import 'package:icu/ui/pages/pozhuhao/M/catmodel.dart';
import 'package:icu/data/net/network.dart';
import 'dart:async';
class ICURepository {


  /// 获取破竹号列表页数据 parame
  Future<List<PozhuhaolistModel>> getPozhuhaoList(Map<String, String> parame) async {
    BaseRespR baseResp = await DioUtil().requestR(Method.get,ICUApi.getparameterSplicing(ICUApi.Pozhuhaoindex, parame));
    List<PozhuhaolistModel> pozhuhaolist = new List();
    print(baseResp.code);
    print('-----------------------------------ddddddd----------------------');
     if (baseResp.code != Constant.STATUS_SUCCESS) {
      print('失败了');
      return new Future.error(baseResp.msg);
    }
    if (baseResp.data != null) {
      List data =  baseResp.data['data'];
      pozhuhaolist = data.map((value){
        return PozhuhaolistModel.fromJson(value);
      }).toList();
    }
    return pozhuhaolist;
  }

  getpozhuhaoCat(Map<String, String> parame, Function callBlock) async {
    TTDio.get(ICUApi.PozhuhaoList , (data){
      catmodel model = catmodel.fromJson(data);
      if (callBlock != null) {
        callBlock(model, true);
      }
    },params:ICUApi.postparameterSpling(parame),errorCallBack: (errorMsg) {
        callBlock(errorMsg, false);
    });
  }


  


  




}