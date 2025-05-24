
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/note.dart';
import '../cubit/notes_cubit.dart';
import 'note_detail_screen.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: BlocBuilder<NotesCubit, List<Note>>(
        builder: (_, notes) {
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (_, index) {
              final note = notes[index];
              return ListTile(
                title: Text(note.title),
                trailing: Image.asset(
                  note.isFavorite
                      ? 'assets/images/favourite.png'
                      : 'assets/images/favourite-gray.png',
                  width: 24,
                  height: 24,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => NoteDetailScreen(noteId: note.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
