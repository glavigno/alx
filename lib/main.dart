import 'package:flutter/material.dart';

import 'app.dart';
import 'utils/init_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = await initRepository();
  runApp(App(repository: repository));
}
