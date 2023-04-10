import 'package:equatable/equatable.dart';

abstract class CharactersBlocEvent extends Equatable {
  const CharactersBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchData extends CharactersBlocEvent {}

class LoadNextPage extends CharactersBlocEvent {}
