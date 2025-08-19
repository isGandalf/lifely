abstract class CartErrors {
  String get message;

  @override
  String toString() => message;
}

class CartItemsFetchError extends CartErrors {
  @override
  final String message;

  CartItemsFetchError({required this.message});
}

class CartItemAddError extends CartErrors {
  @override
  final String message;

  CartItemAddError({required this.message});
}

class CartItemDeleteError extends CartErrors {
  @override
  final String message;

  CartItemDeleteError({required this.message});
}

class CartItemClearError extends CartErrors {
  @override
  final String message;

  CartItemClearError({required this.message});
}
