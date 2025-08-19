import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/cart_errors.dart';
import 'package:lifely/features/cart/domain/entity/cart.dart';

abstract class CartRepository {
  Future<Either<CartErrors, List<Cart>>> fetchCartItems();
  Future<Either<CartErrors, void>> addCartItem(Cart cartItem);
  Future<Either<CartErrors, void>> deleteCartItem(String productId);
  Future<Either<CartErrors, void>> clearCart();
}
