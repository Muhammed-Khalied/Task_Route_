
import 'package:injectable/injectable.dart';
import 'package:task_route_final/data/datasource_contract/product_datasource_contract.dart';
import 'package:task_route_final/data/network/api_manager/api_manager.dart';
import 'package:task_route_final/domain/entities/product.dart';

@Injectable(as: ProductDatasourceContract)
class ProductDatasourceImpl extends ProductDatasourceContract {
  ApiManager apiManager;
  @factoryMethod
  ProductDatasourceImpl({required this.apiManager});
  @override
  Future<List<Product>?> getProducts() async {
    var response = await apiManager.getProducts();
    
    return response.products?.map((e) => e.toProduct()).toList();

  }
}
