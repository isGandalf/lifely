import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/cart_errors.dart';
import 'package:lifely/features/cart/domain/entity/cart.dart';
import 'package:lifely/features/cart/domain/repository/cart_repository.dart';

class CartUsecases {
  final CartRepository cartRepository;

  CartUsecases({required this.cartRepository});

  // fetch cart items
  Future<Either<CartErrors, List<Cart>>> fetchCartItems() async {
    final result = await cartRepository.fetchCartItems();
    return result.fold(
      ifLeft: (failure) => Left(CartItemsFetchError(message: failure.message)),
      ifRight: (cartItems) => Right(cartItems),
    );
  }

  // add cart item
  Future<Either<CartErrors, void>> addCartItem(Cart cartItem) async {
    final result = await cartRepository.addCartItem(cartItem);
    return result.fold(
      ifLeft: (failure) => Left(CartItemAddError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  // delete cart item
  Future<Either<CartErrors, void>> deleteCartItem(String productId) async {
    final result = await cartRepository.deleteCartItem(productId);
    return result.fold(
      ifLeft: (failure) => Left(CartItemDeleteError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }

  // clear cart
  Future<Either<CartErrors, void>> clearCart() async {
    final result = await cartRepository.clearCart();
    return result.fold(
      ifLeft: (failure) => Left(CartItemClearError(message: failure.message)),
      ifRight: (_) => const Right(null),
    );
  }
}
