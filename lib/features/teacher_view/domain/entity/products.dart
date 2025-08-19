class Products {
  final String id;
  final String productName;
  final int productPrice;
  final String imageUrl;

  Products({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.imageUrl,
  });

  Products copyWith({
    String? id,
    String? productName,
    int? productPrice,
    String? imageUrl,
  }) {
    return Products(
      id: id ?? this.id,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
