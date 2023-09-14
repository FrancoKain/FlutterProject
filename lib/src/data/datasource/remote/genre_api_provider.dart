import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/api_constants.dart';
import '../../../domain/entities/genres.dart';
import '../../models/genre_response.dart';

class GenreApiProvider {
  static const String genreUrl = "genre/movie/list?";
  static const String genreLanguage = "&language=en";

  Future<List<Genre>> fetchGenreList() async {
    final response = await http.get(Uri.parse(
        ApiConstants.apiUrl + genreUrl + ApiConstants.apiKey + genreLanguage));
    if (response.statusCode == 200) {
      return GenreResponse(json: json.decode(response.body)).results;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
