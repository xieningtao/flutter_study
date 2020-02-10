import 'package:json_annotation/json_annotation.dart';

part 'person_info.g.dart';


@JsonSerializable()
class PersonInfo {

  @JsonKey(name: 'head')
  Head head;

  @JsonKey(name: 'para')
  Para para;

  PersonInfo(this.head,this.para,);

  factory PersonInfo.fromJson(Map<String, dynamic> srcJson) => _$PersonInfoFromJson(srcJson);

}


@JsonSerializable()
class Head {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'msg')
  String msg;

  Head(this.code,this.msg,);

  factory Head.fromJson(Map<String, dynamic> srcJson) => _$HeadFromJson(srcJson);

}


@JsonSerializable()
class Para {

  @JsonKey(name: 'person')
  Person person;

  @JsonKey(name: 'background')
  List<Background> background;

  Para(this.person,this.background,);

  factory Para.fromJson(Map<String, dynamic> srcJson) => _$ParaFromJson(srcJson);

}


@JsonSerializable()
class Person {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'sex')
  String sex;

  @JsonKey(name: 'birthday')
  String birthday;

  @JsonKey(name: 'identity_no')
  String identityNo;

  @JsonKey(name: 'domicile_place')
  String domicilePlace;

  @JsonKey(name: 'addr')
  String addr;

  @JsonKey(name: 'flag')
  String flag;

  Person(this.name,this.sex,this.birthday,this.identityNo,this.domicilePlace,this.addr,this.flag,);

  factory Person.fromJson(Map<String, dynamic> srcJson) => _$PersonFromJson(srcJson);

}


@JsonSerializable()
class Background{

  @JsonKey(name: 'tpe')
  String tpe;

  @JsonKey(name: 'count')
  String count;

  @JsonKey(name: 'name')
  String name;

  Background(this.tpe,this.count,this.name,);

  factory Background.fromJson(Map<String, dynamic> srcJson) => _$BackgroundFromJson(srcJson);

}


