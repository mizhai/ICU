import 'package:json_annotation/json_annotation.dart'; 
  
part 'catmodel.g.dart';


@JsonSerializable()
  class catmodel extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  List<Data> data;

  catmodel(this.code,this.msg,this.data,);

  factory catmodel.fromJson(Map<String, dynamic> srcJson) => _$catmodelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$catmodelToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'aword')
  String aword;

  @JsonKey(name: 'minicon')
  String minicon;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'update_time')
  String updateTime;

  Data(this.id,this.name,this.title,this.thumb,this.aword,this.minicon,this.sort,this.updateTime,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
