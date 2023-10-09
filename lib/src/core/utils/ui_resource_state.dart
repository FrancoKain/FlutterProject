enum UiState {
  loading,
  error,
  empty,
  success,
}

class UiResourceState<T> {
  UiResourceState({
    this.data,
    required this.responseState,
    this.error,
  });

  final T? data;
  final UiState responseState;
  final String? error;

  @override
  bool operator ==(Object other) {
    return other is UiResourceState &&
        this.responseState == other.responseState;
  }
}
