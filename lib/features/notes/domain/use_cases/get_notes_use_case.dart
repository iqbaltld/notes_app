import 'package:injectable/injectable.dart';
import 'package:notes_app/features/notes/domain/entities/note.dart';
import 'package:notes_app/features/notes/domain/repositories/note_repository.dart';

@injectable
class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call() async {
    return await repository.getNotes();
  }
}
