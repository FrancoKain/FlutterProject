import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/models/genres.dart';
import '../../domain/repositories/i_repository.dart';

class GenreRepository implements MyRepository {
  static const String genresJsonPath = 'assets/mock_data/genres.json';
  List<Genre> allGenres = [];

  @override
  Future<List<Genre>> getData() async {
    String genreData = await rootBundle.loadString(
      genresJsonPath,
    );
    var genresFromData = jsonDecode(genreData);
    List<dynamic> genreList = genresFromData['genres'];
    allGenres = genreList.map((genre) => Genre.fromJson(genre)).toList();
    return allGenres;
  }

  List<Genre> getGenresById(List<int> ids) {
    if (allGenres.isEmpty) {
      getData();
    }
    List<Genre> selectedGenres = [];
    selectedGenres =
        allGenres.where((genre) => ids.contains(genre.id)).toList();
    return selectedGenres;
  }
}
