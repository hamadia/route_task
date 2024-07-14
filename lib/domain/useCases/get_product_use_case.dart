import 'package:injectable/injectable.dart';
import 'package:route_task/domain/entity/Product.dart';
import 'package:route_task/domain/repositoryContract/product_repository.dart';

@injectable
class GetProductUseCase {
  ProductRepository productRepository;

  @factoryMethod
  GetProductUseCase({required this.productRepository});

  Future<List<Product>?> invoke() {
    return productRepository.getProduct();
  }
}
