import 'package:injectable/injectable.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_data_source.dart';

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
