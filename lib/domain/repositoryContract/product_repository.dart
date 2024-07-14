import 'package:either_dart/either.dart';
import 'package:route_task/domain/entity/ProductResponse.dart';

abstract class ProductRepository {
  Future<Either<ProductResponse, String>> getProduct();
}
