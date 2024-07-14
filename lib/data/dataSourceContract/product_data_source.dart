import '../../domain/entity/Product.dart';

abstract class ProductDataSource {
  Future<List<Product>?> getProduct();
}
