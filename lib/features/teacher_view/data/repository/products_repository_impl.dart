import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/products_errors.dart';
import 'package:lifely/features/teacher_view/data/source/datasources.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';
import 'package:lifely/features/teacher_view/domain/repository/products_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final Datasources datasources;

  ProductsRepositoryImpl({required this.datasources});
  @override
  Future<Either<ProductsErrors, List<Products>>> fetchProducts() async {
    final result = await datasources.fetchProducts();

    return result.fold(
      ifLeft: (failure) => Left(ProductsFetchError(message: failure.message)),
      ifRight: (products) {
        final productList = products.map((e) => e.toEntity()).toList();
        return Right(productList);
      },
    );
  }
}
