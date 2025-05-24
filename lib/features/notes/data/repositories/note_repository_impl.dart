import 'package:injectable/injectable.dart';
import 'package:notes_app/features/notes/data/datasources/note_data_source.dart';
import 'package:notes_app/features/notes/domain/entities/note.dart';
import 'package:notes_app/features/notes/domain/repositories/note_repository.dart';

@Injectable(as: NoteRepository)
class NoteRepositoryImpl implements NoteRepository {
  final NoteDataSource dataSource;
  NoteRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<Note>> getNotes() async {
    final result = await dataSource.getNotes();
    return result.map((element) => element.toEntity()).toList();
  }
}
