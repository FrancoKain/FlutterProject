import '../../core/utils/bloc_utils.dart';

abstract class MyRepository<T> {
  Future<T> getData(MovieCategory category);
}
