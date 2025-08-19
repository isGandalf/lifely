import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';
import 'package:lifely/features/teacher_view/domain/usecases/product_usecases.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductUsecases productsUsecases;

  ProductsBloc(this.productsUsecases) : super(ProductsInitial()) {
    on<FetchProductsEvent>(fetchProductsEvent);
  }

  FutureOr<void> fetchProductsEvent(
    FetchProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoadingState());

    final products = await productsUsecases.fetchProducts();

    return products.fold(
      ifLeft: (failure) => emit(ProductsErrorState(message: failure.message)),
      ifRight: (products) => emit(ProductsLoadedState(products: products)),
    );
  }
}
