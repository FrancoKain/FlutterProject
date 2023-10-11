abstract class ApiService<T> {
  Future<T> fetch(String url);
}
