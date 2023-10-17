import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../core/api_constants.dart';
import '../../models/genre_page_model.dart';
import 'i_api_service.dart';

class GenreApiProvider implements ApiService {
  static const String genreUrl = "genre/movie/list?";
  static const String genreLanguage = "&language=en";

  Future<GenrePageModel> fetch(_) async {
    final response = await http.get(
      Uri.parse(
          '${ApiConstants.apiUrl}$genreUrl${ApiConstants.apiKey}$genreLanguage'),
    );
    if (response.statusCode == HttpStatus.ok) {
      return GenrePageModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(ApiConstants.errorMessage);
    }
  }
}
