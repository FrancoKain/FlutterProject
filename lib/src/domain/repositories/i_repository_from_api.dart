import '../../core/utils/movie_category_enum.dart';

abstract class MyRepositoryFromApi<T> {
  Future<T> getData(MovieCategory category);
}
