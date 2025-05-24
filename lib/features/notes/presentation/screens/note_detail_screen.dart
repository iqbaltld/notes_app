
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/domain/entities/note.dart';

import '../cubit/notes_cubit.dart';

class NoteDetailScreen extends StatelessWidget {
  final int noteId;

  const NoteDetailScreen({super.key, required this.noteId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Note Detail')),
      body: BlocBuilder<NotesCubit, List<Note>>(
        builder: (_, notes) {
          final note = notes.firstWhere((n) => n.id == noteId);
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(note.title, style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () => context.read<NotesCubit>().toggleFavorite(note.id),
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
        },
      ),
    );
  }
}
