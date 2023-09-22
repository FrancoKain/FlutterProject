import 'dart:async';
import 'package:flutter_project/src/core/utils/state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/api_constants.dart';
import '../../models/genre_response.dart';

class GenreApiProvider {
  static const String genreUrl = "genre/movie/list?";
  static const String genreLanguage = "&language=en";
  static const String errorMessege = "Something went wrong :(";
  Future<DataState> fetchGenreList() async {
    final response = await http.get(Uri.parse(
        ApiConstants.apiUrl + genreUrl + ApiConstants.apiKey + genreLanguage));
    if (response.statusCode == 200) {
      return DataState(data:GenreResponse(json: json.decode(response.body)), state: ResponseState.success);
    } else {
      return DataState(error: errorMessege , state: ResponseState.error);
    }
  }
}
