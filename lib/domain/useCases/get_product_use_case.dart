import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/entity/ProductResponse.dart';
import 'package:route_task/domain/repositoryContract/product_repository.dart';

@injectable
class GetProductUseCase {
  ProductRepository productRepository;

  @factoryMethod
  GetProductUseCase({required this.productRepository});

  Future<Either<ProductResponse, String>> invoke() {
    return productRepository.getProduct();
  }
}
