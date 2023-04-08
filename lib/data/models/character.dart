import 'package:json_annotation/json_annotation.dart';

import 'relative.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final int id;
  final String name;
  final String image;
  final String gender;
  final String hairColor;
  final List<Relative> relatives;
  final String firstEpisode;
  final String voicedBy;
  final String url;
  final String wikiUrl;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.gender,
    required this.hairColor,
    required this.relatives,
    required this.firstEpisode,
    required this.voicedBy,
    required this.url,
    required this.wikiUrl,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}