import 'dart:async';
import 'package:flutter_project/src/core/api_constants.dart';
import 'package:flutter_project/src/data/models/movie_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieApiProvider {
  static const moviesUrl = "movie/popular?";

  Future<MovieResponse> fetchMovieList() async {
    final response = await http
        .get(Uri.parse(ApiConstants.apiUrl + moviesUrl + ApiConstants.apiKey));
    if (response.statusCode == 200) {
      return MovieResponse(json: json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
