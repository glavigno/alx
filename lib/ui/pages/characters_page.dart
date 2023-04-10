import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/characters_bloc.dart';
import '../../blocs/characters_bloc_events.dart';
import '../../blocs/characters_bloc_states.dart';
import '../shared/custom_app_bar.dart';
import '../shared/custom_loader.dart';
import '../view_models/character_view_model.dart';
import '../widgets/custom_list_tile.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<CharactersBloc, CharactersBlocState>(
        bloc: context.read<CharactersBloc>(),
        builder: (context, state) {
          if (state is InitialState){
            _fetchData(context);
            return const CustomLoader();
          } else if (state is LoadingState) {
            return const CustomLoader();
          } else if (state is LoadedState) {
            return _buildList(context, state);
          } else if (state is ErrorState) {
            return Center(child: Text('Failed to load characters: ${state.message}'));
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }

  void _fetchData(BuildContext context) {
    context.read<CharactersBloc>().add(FetchData());
  }

  Column _buildList(BuildContext context, LoadedState state) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: context.read<CharactersBloc>().scrollController,
            itemCount: state.data.length,
            itemBuilder: (context, index) {
              final character = state.data[index];

              return CustomListTile(viewModel: CharacterViewModel(character));
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<CharactersBloc>().add(LoadNextPage());
          },
          child: const Text('Load more'),
        )
      ],
    );
  }
}
