import 'package:equatable/equatable.dart';

import '../data/models/character.dart';

abstract class CharactersBlocState extends Equatable {
  const CharactersBlocState();

  @override
  List<Object> get props => [];
}

class InitialState extends CharactersBlocState {}

class LoadingState extends CharactersBlocState {}

class LoadedState extends CharactersBlocState {
  final List<Character> data;
  final bool hasReachedMax;

  const LoadedState({required this.data, this.hasReachedMax = false});

  LoadedState copyWith({List<Character>? data, bool? hasReachedMax}) {
    return LoadedState(
      data: data ?? this.data,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [data, hasReachedMax];

  @override
  String toString() => 'LoadedState { data: ${data.length}, hasReachedMax: $hasReachedMax }';
}

class ErrorState extends CharactersBlocState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'ErrorState { message: $message }';
}
