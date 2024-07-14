import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/data/dataSourceContract/product_data_source.dart';
import 'package:route_task/domain/entity/ProductResponse.dart';

import '../../domain/repositoryContract/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  ProductDataSource productDataSource;

  @factoryMethod
  ProductRepositoryImpl({
    required this.productDataSource,
  });

  @override
  Future<Either<ProductResponse, String>> getProduct() async {
    var result = await productDataSource.getProduct();
    return result.fold((response) {
      return Left(response.toProductResponse());
    }, (error) {
      return Right(error);
    });
  }
}
