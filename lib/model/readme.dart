import 'package:json_annotation/json_annotation.dart';
part 'readme.g.dart';

@JsonSerializable()
class Readme {
  String type;
  String encoding;
  int size;
  String name;
  String path;
  String content;
  String sha;
  String url;

  @JsonKey(name: 'html_url')
  String htmlUrl;

  @JsonKey(name: 'download_url')
  String downloadUrl;
  Links lLinks;

  Readme(
      {this.type,
      this.encoding,
      this.size,
      this.name,
      this.path,
      this.content,
      this.sha,
      this.url,
      this.htmlUrl,
      this.downloadUrl,
      this.lLinks});

  factory Readme.fromJson(Map<String, dynamic> srcJson) => _$ReadmeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ReadmeToJson(this);
}

@JsonSerializable()
class Links {
  String self;
  String html;

  Links({this.self, this.html});

  factory Links.fromJson(Map<String, dynamic> srcJson) => _$LinksFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
