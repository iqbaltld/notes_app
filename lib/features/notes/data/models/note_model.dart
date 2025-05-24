import '../../domain/entities/note.dart';

class NoteModel {
  final int id;
  final String title;

  const NoteModel({
    required this.id,
    required this.title,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: (json['id'] as num).toInt(),
        title: json['title'] as String,
      );

  /// Converts this model into an Entity
  Note toEntity() {
    return Note(
      id: id,
      title: title,
    );
  }
}
