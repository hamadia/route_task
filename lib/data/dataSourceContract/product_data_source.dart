import 'package:either_dart/either.dart';
import 'package:route_task/data/model/productResponse/ProductResponseDto.dart';

abstract class ProductDataSource {
  Future<Either<ProductResponseDto, String>> getProduct();
}
