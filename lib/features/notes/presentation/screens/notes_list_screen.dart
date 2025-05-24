import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/screens/widgets/note_tile.dart';

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
              itemBuilder: (context, index) {
                return NoteTile(note: state.notes[index]);
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
