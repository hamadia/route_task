import 'package:either_dart/either.dart';
import 'package:route_task/data/api_manager/api_manager.dart';
import 'package:route_task/data/dataSourceContract/product_data_source.dart';
import 'package:route_task/data/model/productResponse/ProductResponseDto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductDatasourceImpl extends ProductDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProductDatasourceImpl({required this.apiManager});

  @override
  Future<Either<ProductResponseDto, String>> getProduct() async {
    try {
      var response = await apiManager.getProduct();
      if (response.code != null) {
        return Right(response.message ?? 'Try Later');
      } else {
        return Left(response);
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
