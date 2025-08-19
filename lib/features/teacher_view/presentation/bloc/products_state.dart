part of 'products_bloc.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

// Non action states
final class ProductsNonActionState extends ProductsState {}

final class ProductsLoadingState extends ProductsNonActionState {}

final class ProductsLoadedState extends ProductsNonActionState {
  final List<Products> products;

  ProductsLoadedState({required this.products});
}

final class ProductsErrorState extends ProductsNonActionState {
  final String message;

  ProductsErrorState({required this.message});
}

// Action states
final class ProductsActionStates extends ProductsState {}
