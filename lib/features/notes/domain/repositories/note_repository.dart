import 'package:notes_app/features/notes/domain/entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();
}
