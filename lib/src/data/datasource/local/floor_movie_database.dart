import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entities/genre.dart';
import '../../../domain/entities/movie.dart';
import 'converters/category_list_converter.dart';
import 'converters/genres_list_converter.dart';
import 'local_DAOs/genre_dao.dart';
import 'local_DAOs/movie_dao.dart';

part 'floor_movie_database.g.dart';

@TypeConverters(<Type>[GenresConverter, CategoryListConverter])
@Database(
  version: 1,
  entities: <Type>[
    Movie,
    Genre,
  ],
)

abstract class FloorMovieDatabase extends FloorDatabase {
  MovieDao get movieDao;
  MovieGenreDao get genreDao;
}
