import 'package:dart_either/dart_either.dart';
import 'package:lifely/core/errors/products_errors.dart';
import 'package:lifely/features/teacher_view/data/model/products_model.dart';
import 'package:lifely/features/teacher_view/data/source/products_data.dart';

class Datasources {
  Future<Either<ProductsErrors, List<ProductsModel>>> fetchProducts() async {
    try {
      final products = sampleProducts;

      return Right(products);
    } on Exception catch (e) {
      return Left(
        ProductsFetchError(message: 'Error fetching products --> $e'),
      );
    } catch (e) {
      return Left(
        ProductsFetchError(
          message: 'Unexpected error fetching products --> $e',
        ),
      );
    }
  }
}
