import 'package:isar/isar.dart';
import 'package:lifely/features/cart/data/model/cart_model.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';


// dart run build_runner build --delete-conflicting-outputs     

part 'products_model.g.dart';

@collection
class ProductsModel {
  Id isarId = Isar.autoIncrement; // local storage id

  late String productName;
  late int productPrice;
  late String imageUrl;

  ProductsModel();

  // convert from model to entity
  Products toEntity() {
    return Products(
      id: isarId.toString(), // assuming isarId is used as a unique identifier
      productName: productName,
      productPrice: productPrice,
      imageUrl: imageUrl,
    );
  }

  // convert from entity to model
  static ProductsModel fromEntity(Products products) {
    return ProductsModel()
      ..isarId = int.parse(products.id) // assuming id is a string representation of an integer
      ..productName = products.productName
      ..productPrice = products.productPrice
      ..imageUrl = products.imageUrl;
  }

  // copywith method
  ProductsModel copyWith({
    String? id,
    String? productName,
    int? productPrice,
    String? imageUrl,
  }) {
    return ProductsModel()
      ..isarId = id != null ? int.parse(id) : isarId
      ..productName = productName ?? this.productName
      ..productPrice = productPrice ?? this.productPrice
      ..imageUrl = imageUrl ?? this.imageUrl;
  }

  // convert from CartModel to ProductsModel
  static ProductsModel fromCartModel(CartModel cart) {
    return ProductsModel()
      ..isarId = int.parse(cart.productId) // assuming productId is a string representation of an integer
      ..productName = cart.productName
      ..productPrice = cart.productPrice
      ..imageUrl = cart.imageUrl;
  }
}
