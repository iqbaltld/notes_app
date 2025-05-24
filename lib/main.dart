
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/injection/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(MyApp());
}
