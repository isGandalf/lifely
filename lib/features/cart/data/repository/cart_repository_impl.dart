// ignore: implementation_imports
import 'package:dart_either/src/dart_either.dart';
import 'package:lifely/core/errors/cart_errors.dart';
import 'package:lifely/features/cart/data/model/cart_model.dart';
import 'package:lifely/features/cart/data/source/cart_source.dart';
import 'package:lifely/features/cart/domain/entity/cart.dart';
import 'package:lifely/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartSource cartSource;

  CartRepositoryImpl({required this.cartSource});
  @override
  Future<Either<CartErrors, void>> addCartItem(Cart cartItem) async {
    final cartModel = CartModel.fromEntity(cartItem);
    final result = await cartSource.addCartItem(cartModel);

    return result.fold(
      ifLeft: (failure) => Left(CartItemAddError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  @override
  Future<Either<CartErrors, void>> clearCart() async {
    final result = await cartSource.clearCart();
    return result.fold(
      ifLeft: (failure) => Left(CartItemClearError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  @override
  Future<Either<CartErrors, void>> deleteCartItem(String productId) async {
    final result = await cartSource.deleteCartItem(productId);
    return result.fold(
      ifLeft: (failure) => Left(CartItemDeleteError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  @override
  Future<Either<CartErrors, List<Cart>>> fetchCartItems() async {
    final result = await cartSource.fetchCartItems();
    return result.fold(
      ifLeft: (failure) => Left(CartItemsFetchError(message: failure.message)),
      ifRight: (cartModels) {
        final cartItems = cartModels.map((model) => model.toEntity()).toList();
        return Right(cartItems);
      },
    );
  }
}
