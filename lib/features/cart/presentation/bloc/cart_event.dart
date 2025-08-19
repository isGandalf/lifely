part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartFetchEvent extends CartEvent {}

final class CartAddEvent extends CartEvent {
  final Products products;

  CartAddEvent({required this.products});
}

final class CartDeleteEvent extends CartEvent {
  final String productId;

  CartDeleteEvent({required this.productId});
}

final class CartClearEvent extends CartEvent {}
