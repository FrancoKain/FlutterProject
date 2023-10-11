import 'dart:io';

import '../../lib/src/core/utils/state.dart';
import '../../lib/src/data/datasource/remote/i_api_service.dart';
import '../../lib/src/data/models/genre_page_model.dart';
import '../../lib/src/data/models/movie_page_model.dart';
import '../../lib/src/data/repositories/genre_repository.dart';
import '../../lib/src/data/repositories/movies_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class MovieApiProviderSuccess implements ApiService {
  final Map<String, dynamic> map = {
    'page': 2,
    'total_results': 2,
    'total_pages': 2,
    'results': [
      {
        "adult": false,
        "backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
        "genre_ids": [14, 28, 12],
        "id": 455476,
        "original_language": "en",
        "original_title": "Knights of the Zodiac",
        "overview":
            "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
        "popularity": 3963.447,
        "poster_path": "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg",
        "release_date": "2023-04-27",
        "title": "Knights of the Zodiac",
        "video": false,
        "vote_average": 6.5,
        "vote_count": 367
      },
      {
        "adult": false,
        "backdrop_path": "/4XM8DUTQb3lhLemJC51Jx4a2EuA.jpg",
        "genre_ids": [28, 80, 53],
        "id": 385687,
        "original_language": "en",
        "original_title": "Fast X",
        "overview":
            "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
        "popularity": 3705.176,
        "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
        "release_date": "2023-05-17",
        "title": "Fast X",
        "video": false,
        "vote_average": 7.4,
        "vote_count": 2508
      },
    ],
  };

  @override
  Future<MoviePageModel> fetch(_) async {
    return await MoviePageModel.fromJson(
       map,
    );
  }
}

class MovieApiProvideEmpty implements ApiService {
  final Map<String, dynamic> emptyMap = {
    'page': 2,
    'total_results': 2,
    'total_pages': 2,
    'results': [],
  };

  @override
  Future<MoviePageModel> fetch(_) async {
    return await MoviePageModel.fromJson(
       emptyMap,
    );
  }
}

class GenreApiProvideSuccess implements ApiService {
  final Map<String, dynamic> map = {
    'genres': [
      {
        "id": 28,
        "name": "Action",
      },
      {
        "id": 12,
        "name": "Adventure",
      },
    ],
  };

  @override
  Future<GenrePageModel> fetch(String url) async {
    return await GenrePageModel.fromJson(
      map,
    );
  }
}

class GenreApiProvideEmpty implements ApiService {
  final Map<String, dynamic> map = {
    'genres': [],
  };

  @override
  Future<GenrePageModel> fetch(String url) async {
    return await GenrePageModel.fromJson(
      map,
    );
  }
}

class MovieApiProviderFailure implements ApiService {
  @override
  Future fetch(String url) {
    throw const SocketException(
      'Exception',
    );
  }
}

class GenreApiProvideFailure implements ApiService {
  @override
  Future fetch(String url) {
    throw const SocketException(
      'Exception',
    );
  }
}

void main() {
  group('testing of all possibilities in repository', () {
    test(
        'getData() from MovieRepository should return a instance of DataState with a responseState success',
        () async {
      MoviesRepository repo = MoviesRepository(
        api: MovieApiProviderSuccess(),
      );
      DataState result = await repo.getData(
        'success',
      );
      expect(
        result.responseState,
        equals(
          ResponseState.success,
        ),
      );
    });

    test(
        'getData() from MovieRepository should return a instance of DataState with a responseState empty',
        () async {
      MoviesRepository repo = MoviesRepository(
        api: MovieApiProvideEmpty(),
      );
      DataState result = await repo.getData(
        'empty',
      );
      expect(
        result.responseState,
        equals(
          ResponseState.empty,
        ),
      );
    });

    test(
        'getData() from MovieRepository should return a instance of DataState with a responseState error',
        () async {
      MoviesRepository repo = MoviesRepository(
        api: MovieApiProviderFailure(),
      );
      DataState result = await repo.getData(
        '',
      );
      expect(
        result.responseState,
        equals(
          ResponseState.error,
        ),
      );
    });

    test(
        'getData() from GenreRepository should return a instance of DataState with a responseState success',
        () async {
      GenreRepository repo = GenreRepository(
        api: GenreApiProvideSuccess(),
      );
      DataState result = await repo.getData(
        'success',
      );
      expect(
        result.responseState,
        equals(
          ResponseState.success,
        ),
      );
    });

    test(
        'getData() from GenreRepository should return a instance of DataState with a responseState empty',
        () async {
      GenreRepository repo = GenreRepository(
        api: GenreApiProvideEmpty(),
      );
      DataState result = await repo.getData(
        'empty',
      );
      expect(
        result.responseState,
        equals(
          ResponseState.empty,
        ),
      );
    });

    test(
        'getData() from GenreRepository should return a instance of DataState with a responseState error',
        () async {
      GenreRepository repo = GenreRepository(
        api: GenreApiProvideFailure(),
      );
      DataState result = await repo.getData(
        '',
      );
      expect(
        result.responseState,
        equals(
          ResponseState.error,
        ),
      );
    });
  });
}
