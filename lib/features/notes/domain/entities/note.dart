
class Note {
  final String id;
  final String title;
  final bool isFavorite;

  Note({
    required this.id,
    required this.title,
    this.isFavorite = false,
  });

  Note copyWith({bool? isFavorite}) {
    return Note(
      id: id,
      title: title,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
