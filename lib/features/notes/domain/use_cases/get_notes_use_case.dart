
import 'package:injectable/injectable.dart';
import '../entities/note.dart';
import '../repositories/note_repository.dart';

@injectable
class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call() async {
    return await repository.getNotes();
  }
}
