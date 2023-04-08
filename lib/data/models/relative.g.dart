// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relative _$RelativeFromJson(Map<String, dynamic> json) => Relative(
      id: json['id'] as String,
      name: json['name'] as String,
      wikiUrl: json['wikiUrl'] as String,
      relationship: json['relationship'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$RelativeToJson(Relative instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'wikiUrl': instance.wikiUrl,
      'relationship': instance.relationship,
      'url': instance.url,
    };
