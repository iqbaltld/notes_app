import 'package:flutter/material.dart';
import '../../features/notes/presentation/screens/notes_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const NotesListScreen());

      default:
        return MaterialPageRoute(builder: (_) => const NotesListScreen());
    }
  }
}
