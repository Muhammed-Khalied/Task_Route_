import 'package:injectable/injectable.dart';
import 'package:task_route_final/data/datasource_contract/product_datasource_contract.dart';
import 'package:task_route_final/domain/entities/product.dart';
import 'package:task_route_final/domain/repositories/product_repository_contract.dart';

@Injectable(as: ProductRepositoryContract)
class ProductRepositoryImpl extends ProductRepositoryContract {
  ProductDatasourceContract productDatasourceContract;
  @factoryMethod
  ProductRepositoryImpl({required this.productDatasourceContract});
  @override
  Future<List<Product>?> getProducts() {
    return productDatasourceContract.getProducts();
  }
}
