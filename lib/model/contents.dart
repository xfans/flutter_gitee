import 'package:json_annotation/json_annotation.dart'; 
  
part 'contents.g.dart';

// https://gitee.com/api/v5/repos/xfans/VoiceWaveView/contents/gradlew.bat?access_token=ac70d0529882dcd67b57adcaae8ac08b 
@JsonSerializable()
  class Contents extends Object {

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'encoding')
  String encoding;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'sha')
  String sha;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'download_url')
  String downloadUrl;

  @JsonKey(name: '_links')
  Links links;

  Contents(this.type,this.encoding,this.size,this.name,this.path,this.content,this.sha,this.url,this.htmlUrl,this.downloadUrl,this.links,);

  factory Contents.fromJson(Map<String, dynamic> srcJson) => _$ContentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentsToJson(this);

}

  
@JsonSerializable()
  class Links extends Object {

  @JsonKey(name: 'self')
  String self;

  @JsonKey(name: 'html')
  String html;

  Links(this.self,this.html,);

  factory Links.fromJson(Map<String, dynamic> srcJson) => _$LinksFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LinksToJson(this);

}

  
