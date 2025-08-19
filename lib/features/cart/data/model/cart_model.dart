import 'package:isar/isar.dart';
import 'package:lifely/features/cart/domain/entity/cart.dart';
import 'package:lifely/features/teacher_view/data/model/products_model.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';

part 'cart_model.g.dart';

@collection
class CartModel {
  Id isarId = Isar.autoIncrement; // local storage id

  late String productId; // unique identifier for the product
  late String productName;
  late int productPrice;
  late String imageUrl;

  CartModel();

  // convert from model to entity
  Cart toEntity() {
    return Cart(
      productId: isarId
          .toString(), // assuming isarId is used as a unique identifier
      productName: productName,
      productPrice: productPrice,
      imageUrl: imageUrl,
    );
  }

  // convert from entity to model
  static CartModel fromEntity(Cart cart) {
    return CartModel()
      ..productId = cart.productId
      ..productName = cart.productName
      ..productPrice = cart.productPrice
      ..imageUrl = cart.imageUrl;
  }

  // copywith method
  CartModel copyWith({
    String? productId,
    String? productName,
    int? productPrice,
    String? imageUrl,
  }) {
    return CartModel()
      ..isarId = isarId
      ..productId = productId ?? this.productId
      ..productName = productName ?? this.productName
      ..productPrice = productPrice ?? this.productPrice
      ..imageUrl = imageUrl ?? this.imageUrl;
  }

  // convert from ProductsModel to CartModel
  static CartModel fromProductModel(ProductsModel product) {
    return CartModel()
      ..productId = product.isarId.toString()
      ..productName = product.productName
      ..productPrice = product.productPrice
      ..imageUrl = product.imageUrl;
  }

  // convert from Products to CartModel
  static CartModel fromProductEntity(Products product) {
    return CartModel()
      ..productId = product.id
      ..productName = product.productName
      ..productPrice = product.productPrice
      ..imageUrl = product.imageUrl;
  }

  // convert from CartModel to ProductsModel
  ProductsModel toProductModel() {
    return ProductsModel()
      ..isarId =
          int.parse(
            productId,
          ) // assuming productId is a string representation of an integer
      ..productName = productName
      ..productPrice = productPrice
      ..imageUrl = imageUrl;
  }

  // convert from CartModel to Products
  Products toProductEntity() {
    return Products(
      id: productId, // assuming productId is used as a unique identifier
      productName: productName,
      productPrice: productPrice,
      imageUrl: imageUrl,
    );
  }
}
