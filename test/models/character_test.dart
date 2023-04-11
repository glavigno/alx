import 'package:flutter_test/flutter_test.dart';
import 'package:alx_technical_test/data/models/character.dart';

void main() {
  group('Character model', () {
    test('fromJson creates a Character object', () {
      final json = {
        'id': 1,
        'name': 'John',
        'image': 'http://example.com/image.jpg',
        'gender': 'male',
        'hairColor': 'black',
        'firstEpisode': 'Episode 1',
        'voicedBy': 'Jane Doe',
        'url': 'http://example.com/character/1',
        'wikiUrl': 'http://example.com/character/1/wiki',
      };

      final character = Character.fromJson(json);

      expect(character.id, equals(1));
      expect(character.name, equals('John'));
      expect(character.image, equals('http://example.com/image.jpg'));
      expect(character.gender, equals('male'));
      expect(character.hairColor, equals('black'));
      expect(character.firstEpisode, equals('Episode 1'));
      expect(character.voicedBy, equals('Jane Doe'));
      expect(character.url, equals('http://example.com/character/1'));
      expect(character.wikiUrl, equals('http://example.com/character/1/wiki'));
    });

    test('toJson creates a Map<String, dynamic> object', () {
      final character = Character(
        id: 1,
        name: 'John',
        image: 'http://example.com/image.jpg',
        gender: 'male',
        hairColor: 'black',
        firstEpisode: 'Episode 1',
        voicedBy: 'Jane Doe',
        url: 'http://example.com/character/1',
        wikiUrl: 'http://example.com/character/1/wiki',
      );

      final json = Character.toJson(character);

      expect(json, equals({
        'id': 1,
        'name': 'John',
        'image': 'http://example.com/image.jpg',
        'gender': 'male',
        'hairColor': 'black',
        'firstEpisode': 'Episode 1',
        'voicedBy': 'Jane Doe',
        'url': 'http://example.com/character/1',
        'wikiUrl': 'http://example.com/character/1/wiki',
      }));
    });
  });
}
