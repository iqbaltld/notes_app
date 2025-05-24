import 'package:notes_app/features/notes/domain/entities/note.dart';

class NoteModel {
  final String id;
  final String title;
  final bool isFavorite;

  const NoteModel({
    required this.id,
    required this.title,
    this.isFavorite = false,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json['id'] as String,
        title: json['title'] as String,
        isFavorite: json['isFavorite'] as bool? ?? false,
      );

  /// Converts this model into an Entity
  Note toEntity() {
    return Note(
      id: id,
      title: title,
      isFavorite: isFavorite,
    );
  }
}
