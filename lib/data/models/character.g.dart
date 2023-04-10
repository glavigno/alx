// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Character _$CharacterFromJson(Map<String, dynamic> json) => Character(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      gender: json['gender'] as String?,
      hairColor: json['hairColor'] as String?,
      firstEpisode: json['firstEpisode'] as String?,
      voicedBy: json['voicedBy'] as String?,
      url: json['url'] as String?,
      wikiUrl: json['wikiUrl'] as String?,
    );

Map<String, dynamic> _$CharacterToJson(Character instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'gender': instance.gender,
      'hairColor': instance.hairColor,
      'firstEpisode': instance.firstEpisode,
      'voicedBy': instance.voicedBy,
      'url': instance.url,
      'wikiUrl': instance.wikiUrl,
    };
