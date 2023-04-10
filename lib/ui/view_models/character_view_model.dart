import 'package:alx_technical_test/data/models/character.dart';

class CharacterViewModel {
  CharacterViewModel(this.character);

  final Character character;

  String get imagePath => character.image!;

  String get name => character.name ?? 'No name';

  String get gender => character.gender ?? 'No gender specified';

  String get hairColor => character.hairColor ?? 'No hair color specified';

  String get voiceBy => character.voicedBy ?? 'No voice actor specified';

  String get firstEpisode => character.firstEpisode ?? 'No first episode specified';
}
