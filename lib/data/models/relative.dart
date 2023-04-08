import 'package:json_annotation/json_annotation.dart';

part 'relative.g.dart';

@JsonSerializable()
class Relative {
  final String id;
  final String name;
  final String wikiUrl;
  final String relationship;
  final String url;

  Relative({
    required this.id,
    required this.name,
    required this.wikiUrl,
    required this.relationship,
    required this.url,
  });

  factory Relative.fromJson(Map<String, dynamic> json) =>
      _$RelativeFromJson(json);
}