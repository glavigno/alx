import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/character.dart';
import '../data/repositories/character_repository.dart';
import 'characters_bloc_events.dart';
import 'characters_bloc_states.dart';

class CharactersBloc extends Bloc<CharactersBlocEvent, CharactersBlocState> {
  final CharactersRepository repository;
  final scrollController = ScrollController();
  final List<Character> characters = [];
  int _currentPage = 1;

  CharactersBloc({required this.repository}) : super(InitialState()) {
    on<FetchData>(
      (event, emit) async {
        try {
          final data = await repository.getData(_currentPage);
          emit(LoadedState(data: data, hasReachedMax: false));
          characters.addAll(data);
        } catch (e) {
          emit(ErrorState(message: e.toString()));
        }
      },
    );
    on<LoadNextPage>(
      (event, emit) async {
        try {
          if (!_isMaxReached(state)) {
            _currentPage++;
            final data = await repository.getData(_currentPage);
            characters.addAll(data);
            final updatedCharacters = List<Character>.from(characters);
            emit(LoadedState(data: updatedCharacters, hasReachedMax: data.isEmpty));
            _scroll();
          }
        } catch (e) {
          emit(ErrorState(message: e.toString()));
        }
      },
    );
  }

  void _scroll() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        if (scrollController.hasClients) {
          await scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }
      },
    );
  }

  bool _isMaxReached(CharactersBlocState state) => state is LoadedState && state.hasReachedMax;
}
