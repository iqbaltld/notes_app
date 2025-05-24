import 'package:flutter/material.dart';
import 'package:notes_app/features/notes/presentation/screens/note_detail_screen.dart';
import 'package:notes_app/features/notes/presentation/screens/notes_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const NotesListScreen());
      case NoteDetailScreen.name:
        final args = routeSettings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => NoteDetailScreen(noteId: args['noteId']));

      default:
        return MaterialPageRoute(builder: (_) => const NotesListScreen());
    }
  }
}
