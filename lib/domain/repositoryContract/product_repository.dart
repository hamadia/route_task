import '../entity/Product.dart';

abstract class ProductRepository {
  Future<List<Product>?> getProduct();
}
