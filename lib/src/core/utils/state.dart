enum ResponseState {
  loading,
  error,
  empty,
  success,
}

class DataState<T> {
  DataState({
    this.data,
    required this.state,
    this.error,
  });

  final T? data;
  final ResponseState state;
  final String? error;

  bool get isLoading => this.state == ResponseState.loading;

  bool get isEmpty => this.state == ResponseState.empty;

  bool get hasData => this.state == ResponseState.success;

  bool get hasError => this.state == ResponseState.error;
}
