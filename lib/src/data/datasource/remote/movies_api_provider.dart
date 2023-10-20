import 'dart:async';
import 'dart:io';

import '../../../core/api_constants.dart';
import '../../models/movie_page_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'i_api_service.dart';

class ApiMovieService implements ApiService {
  Future<MoviePageModel> fetch(String url) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.apiUrl}$url${ApiConstants.apiKey}'),
    );
    if (response.statusCode == HttpStatus.ok) {
      return MoviePageModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception(ApiConstants.errorMessage);
    }
  }
}
