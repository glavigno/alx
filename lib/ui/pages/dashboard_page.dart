import 'package:alx_technical_test/ui/shared/custom_loader.dart';
import 'package:alx_technical_test/ui/view_models/dashboard_view_model.dart';
import 'package:alx_technical_test/ui/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/characters_bloc.dart';
import '../../blocs/characters_bloc_states.dart';
import '../shared/custom_app_bar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<CharactersBloc, CharactersBlocState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return _buildGrid(DashboardPageViewModel(state));
          } else {
            return const CustomLoader();
          }
        },
      ),
    );
  }

  Widget _buildGrid(DashboardPageViewModel viewModel) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      padding: const EdgeInsets.all(10.0),
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      children: _buildCards(viewModel),
    );
  }

  List<Widget> _buildCards(DashboardPageViewModel viewModel) {
    const defaultColor = Colors.black;
    final cardsInfo = [
      CardInfo(
        icon: Icons.numbers,
        title: 'Characters',
        subtitle: viewModel.countStatistics,
        color: defaultColor,
      ),
      CardInfo(
        icon: Icons.people,
        title: 'Gender',
        subtitle: viewModel.genderStatistics,
        color: defaultColor,
      ),
      CardInfo(
        icon: Icons.face,
        title: 'Hair color',
        subtitle: viewModel.hairColorStatistics,
        color: defaultColor,
      )
    ];

    return cardsInfo.map((cardInfo) => CustomCard(cardInfo: cardInfo)).toList();
  }
}
