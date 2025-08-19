part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class FetchProductsEvent extends ProductsEvent {}
