import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/products_errors.dart';
import 'package:lifely/features/teacher_view/domain/entity/products.dart';

abstract class ProductsRepository {
  Future<Either<ProductsErrors, List<Products>>> fetchProducts();
}
