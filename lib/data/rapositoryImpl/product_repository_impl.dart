import 'package:injectable/injectable.dart';
import 'package:route_task/data/dataSourceContract/product_data_source.dart';
import 'package:route_task/domain/entity/Product.dart';

import '../../domain/repositoryContract/product_repository.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  ProductDataSource productDataSource;

  @factoryMethod
  ProductRepositoryImpl({required this.productDataSource});

  @override
  Future<List<Product>?> getProduct() {
    return productDataSource.getProduct();
  }
}
