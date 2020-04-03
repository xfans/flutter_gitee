// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Readme _$ReadmeFromJson(Map<String, dynamic> json) {
  return Readme(
    type: json['type'] as String,
    encoding: json['encoding'] as String,
    size: json['size'] as int,
    name: json['name'] as String,
    path: json['path'] as String,
    content: json['content'] as String,
    sha: json['sha'] as String,
    url: json['url'] as String,
    htmlUrl: json['html_url'] as String,
    downloadUrl: json['download_url'] as String,
    lLinks: json['lLinks'] == null
        ? null
        : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReadmeToJson(Readme instance) => <String, dynamic>{
      'type': instance.type,
      'encoding': instance.encoding,
      'size': instance.size,
      'name': instance.name,
      'path': instance.path,
      'content': instance.content,
      'sha': instance.sha,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'download_url': instance.downloadUrl,
      'lLinks': instance.lLinks,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    self: json['self'] as String,
    html: json['html'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
    };
