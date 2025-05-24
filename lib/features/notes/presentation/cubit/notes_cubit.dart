import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:notes_app/features/notes/domain/entities/note.dart';
import 'package:notes_app/features/notes/domain/use_cases/get_notes_use_case.dart';
part 'notes_state.dart';

@injectable
class NotesCubit extends Cubit<NotesState> {
  final GetNotesUseCase getNotesUseCase;

  NotesCubit(this.getNotesUseCase) : super(NotesInitial());

  Future<void> getNotes() async {
    emit(NotesLoading());
    await Future.delayed(const Duration(seconds: 1));
    try {
      final notes = await getNotesUseCase.call();
      emit(NotesLoaded(notes));
    } catch (e) {
      emit(NotesError('Failed to load notes: $e'));
    }
  }

  void toggleFavorite(String id) {
    if (state is NotesLoaded) {
      final currentState = state as NotesLoaded;
      final updatedNotes = currentState.notes.map((note) {
        if (note.id == id) {
          return note.copyWith(isFavorite: !note.isFavorite);
        }
        return note;
      }).toList();

      emit(NotesLoaded(updatedNotes));
    }
  }

  void addNote(String title) {
    if (state is NotesLoaded) {
      final currentState = state as NotesLoaded;
      final notes = currentState.notes;
      final newId =
          (notes.isEmpty ? 1 : int.parse(notes.last.id) + 1).toString();
      final newNote = Note(
        id: newId,
        title: title,
        isFavorite: false,
      );
      final updatedNotes = [...notes, newNote];
      emit(NotesLoaded(updatedNotes));
    }
  }
}
