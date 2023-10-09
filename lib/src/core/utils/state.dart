enum ResponseState {
  loading,
  error,
  empty,
  success,
}

class DataState<T> {
  DataState({
    this.data,
    required this.responseState,
    this.error,
  });

  final T? data;
  final ResponseState responseState;
  final String? error;
}
