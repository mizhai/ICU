// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

catmodel _$catmodelFromJson(Map<String, dynamic> json) {
  return catmodel(
      json['code'] as int,
      json['msg'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$catmodelToJson(catmodel instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['id'] as int,
      json['name'] as String,
      json['title'] as String,
      json['thumb'] as String,
      json['aword'] as String,
      json['minicon'] as String,
      json['sort'] as int,
      json['update_time'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'thumb': instance.thumb,
      'aword': instance.aword,
      'minicon': instance.minicon,
      'sort': instance.sort,
      'update_time': instance.updateTime
    };
