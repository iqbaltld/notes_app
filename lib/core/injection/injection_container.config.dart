// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:notes_app/features/notes/data/datasources/note_data_source.dart'
    as _i676;
import 'package:notes_app/features/notes/data/repositories/note_repository_impl.dart'
    as _i308;
import 'package:notes_app/features/notes/domain/repositories/note_repository.dart'
    as _i105;
import 'package:notes_app/features/notes/domain/use_cases/get_notes_use_case.dart'
    as _i39;
import 'package:notes_app/features/notes/presentation/cubit/notes_cubit.dart'
    as _i525;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i676.NoteDataSource>(() => _i676.HomeDataSourceImpl());
    gh.factory<_i105.NoteRepository>(
        () => _i308.NoteRepositoryImpl(dataSource: gh<_i676.NoteDataSource>()));
    gh.factory<_i39.GetNotesUseCase>(
        () => _i39.GetNotesUseCase(gh<_i105.NoteRepository>()));
    gh.factory<_i525.NotesCubit>(
        () => _i525.NotesCubit(gh<_i39.GetNotesUseCase>()));
    return this;
  }
}
