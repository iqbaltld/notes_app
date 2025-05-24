import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/notes_cubit.dart';
import 'note_detail_screen.dart';

class NotesListScreen extends StatelessWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          if (state is NotesInitial) {
            context.read<NotesCubit>().getNotes();
          }
          if (state is NotesLoaded) {
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (_, index) {
                final note = state.notes[index];
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
                  onLongPress: () {
                    context.read<NotesCubit>().toggleFavorite(note.id);
                  },
                );
              },
            );
          }
          if (state is NotesError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const Center(
              child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  )));
        },
      ),
    );
  }
}
