import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/features/notes/domain/entities/note.dart';
import 'package:notes_app/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:notes_app/features/notes/presentation/screens/note_detail_screen.dart';

class NoteTile extends StatelessWidget {
  final Note note;

  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
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
        final cubit = context.read<NotesCubit>();
        Navigator.pushNamed(
          context,
          NoteDetailScreen.name,
          arguments: {
            'noteId': note.id,
            'cubit': cubit,
          },
        );
      },
      onLongPress: () {
        context.read<NotesCubit>().toggleFavorite(note.id);
      },
    );
  }
}
