abstract class NetworkErrors {
  String get error;

  @override
  String toString() {
    return error;
  }
}

class NoInternetConnection extends NetworkErrors {
  @override
  final String error;

  NoInternetConnection({required this.error});
}

class FetchError extends NetworkErrors {
  @override
  final String error;

  FetchError({required this.error});
}
