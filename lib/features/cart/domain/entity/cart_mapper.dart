import 'package:lifely/features/cart/domain/entity/cart.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';

class CartMapper {
  // convert productentity to cart entity
  static Cart fromProductEntity(Products product) {
    return Cart(
      productId: product.id,
      productName: product.productName,
      productPrice: product.productPrice,
      imageUrl: product.imageUrl,
    );
  }
}