import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/notes_cubit.dart';

class NoteDetailScreen extends StatelessWidget {
  final String noteId;

  const NoteDetailScreen({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note Details')),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesLoaded) {
            final note = state.notes.firstWhere((n) => n.id == noteId);
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(note.title, style: const TextStyle(fontSize: 24)),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () =>
                        context.read<NotesCubit>().toggleFavorite(noteId),
                    child: Image.asset(
                      note.isFavorite
                          ? 'assets/images/favourite.png'
                          : 'assets/images/favourite-gray.png',
                      width: 48,
                      height: 48,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
