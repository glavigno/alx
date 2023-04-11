import 'package:alx_technical_test/ui/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/characters_bloc.dart';
import 'data/repositories/character_repository.dart';
import 'ui/pages/characters_page.dart';

class App extends StatelessWidget {
  final CharactersRepository repository;

  const App({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharactersBloc>(
          create: (BuildContext context) {
            return CharactersBloc(repository: repository);
          },
        ),
      ],
      child: MaterialApp(
        title: 'ALX Technical Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DefaultTabController(
          animationDuration: Duration.zero,
          length: 2,
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              CharactersPage(),
              DashboardPage(),
            ],
          ),
        ),
      ),
    );
  }
}
