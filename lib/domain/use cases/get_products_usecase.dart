import 'package:injectable/injectable.dart';
import 'package:task_route_final/domain/entities/product.dart';
import 'package:task_route_final/domain/repositories/product_repository_contract.dart';

@injectable
class GetProductsUseCase {
  ProductRepositoryContract productRepositoryContract;
  @factoryMethod
  GetProductsUseCase({required this.productRepositoryContract});

  Future<List<Product>?> invoke() {
    return productRepositoryContract.getProducts();
  }
}
