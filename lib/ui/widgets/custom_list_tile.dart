import 'package:flutter/material.dart';

import '../pages/details_page.dart';
import '../view_models/character_view_model.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({required this.viewModel, super.key});

  final CharacterViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(viewModel.imagePath),
        backgroundColor: Colors.transparent,
      ),
      title: Text(viewModel.name),
      subtitle: Text(viewModel.gender),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return DetailsPage(viewModel: viewModel);
            },
          ));
        },
        child: const Text('View details'),
      ),
    );
  }
}
