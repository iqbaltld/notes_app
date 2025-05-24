
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/note.dart';

@injectable
class NotesCubit extends Cubit<List<Note>> {
  NotesCubit() : super([
    Note(id: 1, title: 'Note 1'),
    Note(id: 2, title: 'Note 2'),
    Note(id: 3, title: 'Note 3'),
  ]);

  void toggleFavorite(int id) {
    final updatedNotes = state.map((note) {
      if (note.id == id) {
        return note.copyWith(isFavorite: !note.isFavorite);
      }
      return note;
    }).toList();

    emit(updatedNotes);
  }
}
