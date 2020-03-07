import 'package:json_annotation/json_annotation.dart'; 
  
part 'trees.g.dart';


@JsonSerializable()
  class Trees extends Object {

  @JsonKey(name: 'sha')
  String sha;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'tree')
  List<Tree> tree;

  @JsonKey(name: 'truncated')
  bool truncated;

  Trees(this.sha,this.url,this.tree,this.truncated,);

  factory Trees.fromJson(Map<String, dynamic> srcJson) => _$TreesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TreesToJson(this);

}

  //https://gitee.com/api/v5/repos/xfans/VoiceWaveView/git/trees/52e57c3f30875c91b31aecb89fbc970eea2c7d21?access_token=ac70d0529882dcd67b57adcaae8ac08b&recursive=1 
@JsonSerializable()
  class Tree extends Object {

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'mode')
  String mode;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'sha')
  String sha;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'url')
  String url;

  Tree(this.path,this.mode,this.type,this.sha,this.size,this.url,);

  factory Tree.fromJson(Map<String, dynamic> srcJson) => _$TreeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TreeToJson(this);

}

  
