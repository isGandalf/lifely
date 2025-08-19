part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

// Non action states
final class CartNonActionState extends CartState {}

final class CartLoadingState extends CartNonActionState {}

final class CartLoadedState extends CartNonActionState {
  final List<Cart> cartItems;

  CartLoadedState({required this.cartItems});
}

final class CartErrorState extends CartNonActionState {
  final String message;

  CartErrorState({required this.message});
}

// Action states
final class CartActionState extends CartState {}

final class CartItemAddSuccessState extends CartActionState {}

final class CartItemAddErrorState extends CartActionState {
  final String message;

  CartItemAddErrorState({required this.message});
}

final class CartItemDeleteSuccessState extends CartActionState {}

final class CartItemDeleteErrorState extends CartActionState {
  final String message;

  CartItemDeleteErrorState({required this.message});
}

final class CartItemClearSuccessState extends CartActionState {}

final class CartItemClearErrorState extends CartActionState {
  final String message;

  CartItemClearErrorState({required this.message});
}
