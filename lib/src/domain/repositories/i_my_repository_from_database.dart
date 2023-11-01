import '../../core/utils/movie_category_enum.dart';

abstract class MyRepositoryFromDatabase<T> {
  Future<T> getData(MovieCategory category);
}
