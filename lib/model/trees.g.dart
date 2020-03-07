// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trees _$TreesFromJson(Map<String, dynamic> json) {
  return Trees(
    json['sha'] as String,
    json['url'] as String,
    (json['tree'] as List)
        ?.map(
            (e) => e == null ? null : Tree.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['truncated'] as bool,
  );
}

Map<String, dynamic> _$TreesToJson(Trees instance) => <String, dynamic>{
      'sha': instance.sha,
      'url': instance.url,
      'tree': instance.tree,
      'truncated': instance.truncated,
    };

Tree _$TreeFromJson(Map<String, dynamic> json) {
  return Tree(
    json['path'] as String,
    json['mode'] as String,
    json['type'] as String,
    json['sha'] as String,
    json['size'] as int,
    json['url'] as String,
  );
}

Map<String, dynamic> _$TreeToJson(Tree instance) => <String, dynamic>{
      'path': instance.path,
      'mode': instance.mode,
      'type': instance.type,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
    };
