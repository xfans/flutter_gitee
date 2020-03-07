// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contents _$ContentsFromJson(Map<String, dynamic> json) {
  return Contents(
    json['type'] as String,
    json['encoding'] as String,
    json['size'] as int,
    json['name'] as String,
    json['path'] as String,
    json['content'] as String,
    json['sha'] as String,
    json['url'] as String,
    json['html_url'] as String,
    json['download_url'] as String,
    json['_links'] == null
        ? null
        : Links.fromJson(json['_links'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ContentsToJson(Contents instance) => <String, dynamic>{
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
      '_links': instance.links,
    };

Links _$LinksFromJson(Map<String, dynamic> json) {
  return Links(
    json['self'] as String,
    json['html'] as String,
  );
}

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'self': instance.self,
      'html': instance.html,
    };
