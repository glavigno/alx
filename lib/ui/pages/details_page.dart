import 'package:flutter/material.dart';

import '../view_models/character_view_model.dart';

class DetailsPage extends StatelessWidget {
  final CharacterViewModel viewModel;

  const DetailsPage({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewModel.name),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Image.network(
                    viewModel.imagePath,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ..._buildInfo(viewModel),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildInfo(CharacterViewModel viewModel) {
    final characterInfo = [
      'Gender: ${viewModel.gender}',
      'Hair color: ${viewModel.hairColor}',
      'Voice by: ${viewModel.voiceBy}',
      'First episode: ${viewModel.firstEpisode}'
    ];

    return characterInfo.map(_buildInfoLine).toList();
  }

  Widget _buildInfoLine(String data) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
