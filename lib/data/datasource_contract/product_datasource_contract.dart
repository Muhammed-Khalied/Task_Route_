
import 'package:task_route_final/domain/entities/product.dart';

abstract class ProductDatasourceContract {
  Future<List<Product>?> getProducts();
}
