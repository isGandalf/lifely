import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/products_errors.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';
import 'package:lifely/features/teacher_view/domain/repository/products_repository.dart';

class ProductUsecases {
  final ProductsRepository productsRepository;

  ProductUsecases({required this.productsRepository});

  Future<Either<ProductsErrors, List<Products>>> fetchProducts() async {
    final products = await productsRepository.fetchProducts();

    return products.fold(
      ifLeft: (failure) => Left(ProductsFetchError(message: failure.message)),
      ifRight: (products) => Right(products),
    );
  }
}
