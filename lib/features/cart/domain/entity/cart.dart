class Cart {
  final String productId;
  final String productName;
  final int productPrice;
  final String imageUrl;

  Cart({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
  });

  Cart copyWith({
    String? productId,
    String? productName,
    int? productPrice,
    String? imageUrl,
  }) {
    return Cart(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
