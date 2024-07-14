import 'package:route_task/data/api_manager/api_manager.dart';
import 'package:route_task/data/dataSourceContract/product_data_source.dart';
import 'package:route_task/domain/entity/Product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductDataSource)
class ProductDatasourceImpl extends ProductDataSource {
  ApiManager apiManager;

  @factoryMethod
  ProductDatasourceImpl({required this.apiManager});

  @override
  Future<List<Product>?> getProduct() async {
    var response = await apiManager.getProduct();
    return response.products
        ?.map((productsDto) => productsDto.toProduct())
        .toList();
  }
}
