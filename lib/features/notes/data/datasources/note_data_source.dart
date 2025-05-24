
import 'package:injectable/injectable.dart';
import '../models/note_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';



abstract class NoteDataSource {
  Future<List<NoteModel>> getNotes();
}

@Injectable(as: NoteDataSource)
class HomeDataSourceImpl implements NoteDataSource {

  @override
  Future<List<NoteModel>> getNotes() async {
    try {
      final String response = await rootBundle.loadString('assets/notes.json');
      final data = json.decode(response);
      return (data['notes'] as List)
          .map((element) => NoteModel.fromJson(element))
          .toList();
    } catch (e) {
      throw Exception('Failed to load notes: $e');
    }
  }
}
