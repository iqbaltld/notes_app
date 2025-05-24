import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/injection/injection_container.dart';
import 'package:notes_app/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/screens/note_detail_screen.dart';
import 'package:notes_app/features/notes/presentation/screens/notes_list_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<NotesCubit>(),
                  child: const NotesListScreen(),
                ));
      case NoteDetailScreen.name:
        final args = routeSettings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as NotesCubit;
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: cubit,
                  child: NoteDetailScreen(noteId: args['noteId']),
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => sl<NotesCubit>(),
                  child: const NotesListScreen(),
                ));
    }
  }
}
