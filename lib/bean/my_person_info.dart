import 'package:json_annotation/json_annotation.dart';

part 'my_person_info.g.dart';


@JsonSerializable()
class MyPersonInfo extends Object {

  @JsonKey(name: 'head')
  Head head;

  @JsonKey(name: 'para')
  Para para;

  MyPersonInfo(this.head,this.para,);

  factory MyPersonInfo.fromJson(Map<String, dynamic> srcJson) => _$MyPersonInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MyPersonInfoToJson(this);

}


@JsonSerializable()
class Head extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'msg')
  String msg;

  Head(this.code,this.msg,);

  factory Head.fromJson(Map<String, dynamic> srcJson) => _$HeadFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HeadToJson(this);

}


@JsonSerializable()
class Para extends Object {

  @JsonKey(name: 'suspenser')
  List<Suspenser> suspenser;

  @JsonKey(name: 'victim')
  List<Victim> victim;

  Para(this.suspenser,this.victim,);

  factory Para.fromJson(Map<String, dynamic> srcJson) => _$ParaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ParaToJson(this);

}


@JsonSerializable()
class Suspenser extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'identity_no')
  String identityNo;

  @JsonKey(name: 'sfxd')
  String sfxd;

  @JsonKey(name: 'bz')
  String bz;

  @JsonKey(name: 'find_time')
  String findTime;

  @JsonKey(name: 'place')
  String place;

  @JsonKey(name: 'addr')
  String addr;

  @JsonKey(name: 'vf')
  List<Vf> vf;

  @JsonKey(name: 'pic')
  List<Pic> pic;

  @JsonKey(name: 'video')
  List<Video> video;

  Suspenser(this.id,this.name,this.identityNo,this.sfxd,this.bz,this.findTime,this.place,this.addr,this.vf,this.pic,this.video,);

  factory Suspenser.fromJson(Map<String, dynamic> srcJson) => _$SuspenserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SuspenserToJson(this);

}


@JsonSerializable()
class Vf extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  Vf(this.id,this.name,);

  factory Vf.fromJson(Map<String, dynamic> srcJson) => _$VfFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VfToJson(this);

}


@JsonSerializable()
class Pic extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  Pic(this.id,this.name,);

  factory Pic.fromJson(Map<String, dynamic> srcJson) => _$PicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PicToJson(this);

}


@JsonSerializable()
class Victim extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'identity_no')
  String identityNo;

  @JsonKey(name: 'start_time')
  String startTime;

  @JsonKey(name: 'end_time')
  String endTime;

  @JsonKey(name: 'addr')
  String addr;

  @JsonKey(name: 'place')
  String place;

  @JsonKey(name: 'bz')
  String bz;

  @JsonKey(name: 'video')
  List<Video> video;

  Victim(this.id,this.name,this.identityNo,this.startTime,this.endTime,this.addr,this.place,this.bz,this.video,);

  factory Victim.fromJson(Map<String, dynamic> srcJson) => _$VictimFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VictimToJson(this);

}


@JsonSerializable()
class Video extends Object {

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  Video(this.id,this.name,);

  factory Video.fromJson(Map<String, dynamic> srcJson) => _$VideoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VideoToJson(this);

}


