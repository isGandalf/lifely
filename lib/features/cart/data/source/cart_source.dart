import 'package:dart_either/dart_either.dart';
import 'package:isar/isar.dart';
import 'package:lifely/core/errors/cart_errors.dart';
import 'package:lifely/features/cart/data/model/cart_model.dart';

class CartSource {
  final Isar isarDb;

  CartSource({required this.isarDb});

  // fetch cart
  Future<Either<CartErrors, List<CartModel>>> fetchCartItems() async {
    try {
      final cartItems = await isarDb.cartModels.where().findAll();

      return Right(cartItems);
    } on Exception catch (e) {
      return Left(
        CartItemsFetchError(message: 'Failed to fetch cart items: $e'),
      );
    } catch (e) {
      return Left(
        CartItemsFetchError(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  // add items to cart
  Future<Either<CartErrors, void>> addCartItem(CartModel cartItem) async {
    try {
      await isarDb.writeTxn(() async {
        await isarDb.cartModels.put(cartItem);
      });

      return const Right(null);
    } on Exception catch (e) {
      return Left(CartItemAddError(message: 'Failed to add cart item: $e'));
    } catch (e) {
      return Left(
        CartItemAddError(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  // delete a cart item
  Future<Either<CartErrors, void>> deleteCartItem(String productId) async {
    try {
      final cartItem = await isarDb.cartModels.get(int.parse(productId));

      if (cartItem == null) {
        return Left(CartItemDeleteError(message: 'Cart item not found'));
      }

      await isarDb.writeTxn(() async {
        await isarDb.cartModels.delete(cartItem.isarId);
      });

      return const Right(null);
    } on Exception catch (e) {
      return Left(
        CartItemDeleteError(message: 'Failed to remove cart item: $e'),
      );
    } catch (e) {
      return Left(
        CartItemDeleteError(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  // clear cart
  Future<Either<CartErrors, void>> clearCart() async {
    try {
      await isarDb.writeTxn(() async {
        await isarDb.cartModels.clear();
      });

      return const Right(null);
    } on Exception catch (e) {
      return Left(CartItemClearError(message: 'Failed to clear cart: $e'));
    } catch (e) {
      return Left(CartItemClearError(message: 'An unexpected error occurred: $e'));
    }
  }
}
