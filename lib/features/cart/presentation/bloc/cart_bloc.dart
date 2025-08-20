import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lifely/features/cart/domain/entity/cart.dart';
import 'package:lifely/features/cart/domain/entity/cart_mapper.dart';
import 'package:lifely/features/cart/domain/usecases/cart_usecases.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecases cartUsecases;
  CartBloc(this.cartUsecases) : super(CartInitial()) {
    on<CartFetchEvent>(cartFetchEvent);
    on<CartAddEvent>(cartAddEvent);
    on<CartClearEvent>(cartClearEvent);
    on<CartDeleteEvent>(dartDeleteEvent);
  }

  FutureOr<void> cartFetchEvent(
    CartFetchEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoadingState());
    final result = await cartUsecases.fetchCartItems();

    result.fold(
      ifLeft: (failure) => emit(CartErrorState(message: failure.message)),
      ifRight: (items) {
        emit(CartLoadedState(cartItems: items));
      },
    );
  }

  FutureOr<void> cartAddEvent(
    CartAddEvent event,
    Emitter<CartState> emit,
  ) async {
    final cartItem = CartMapper.fromProductEntity(event.products);
    final result = await cartUsecases.addCartItem(cartItem);

    result.fold(
      ifLeft: (failure) => emit(CartErrorState(message: failure.message)),
      ifRight: (_) => emit(CartItemAddSuccessState()), // Refresh cart items
    );
  }

  FutureOr<void> cartClearEvent(
    CartClearEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await cartUsecases.clearCart();

    result.fold(
      ifLeft: (failure) => emit(CartErrorState(message: failure.message)),
      ifRight: (_) {
        emit(CartItemClearSuccessState());
        add(CartFetchEvent()); // Refresh cart items
      }, // Notify that cart is cleared
    );
  }

  FutureOr<void> dartDeleteEvent(
    CartDeleteEvent event,
    Emitter<CartState> emit,
  ) async {
    final result = await cartUsecases.deleteCartItem(event.productId);

    result.fold(
      ifLeft: (failure) => emit(CartErrorState(message: failure.message)),
      ifRight: (_) {
        emit(CartItemDeleteSuccessState());
        add(CartFetchEvent());
      },
      // Notify that item is deleted
    );
  }
}
