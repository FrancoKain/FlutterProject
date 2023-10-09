abstract class MyRepository<T> {
  Future<T> getData(
    String url,
  );
}
