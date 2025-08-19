abstract class ProductsErrors {
  String get message;

  @override
  String toString() => message;
}

class ProductsFetchError extends ProductsErrors {
  @override
  final String message;

  ProductsFetchError({required this.message});
}
