import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  final int? id;
  final String? name;
  final String? image;
  final String? gender;
  final String? hairColor;
  final String? firstEpisode;
  final String? voicedBy;
  final String? url;
  final String? wikiUrl;

  Character({
    this.id,
    this.name,
    this.image,
    this.gender,
    this.hairColor,
    this.firstEpisode,
    this.voicedBy,
    this.url,
    this.wikiUrl,
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);
  static Map<String, dynamic> toJson(Character character) => _$CharacterToJson(character);
}
