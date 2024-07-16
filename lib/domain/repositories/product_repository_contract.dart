
import 'package:task_route_final/domain/entities/product.dart';

abstract class ProductRepositoryContract {
  Future<List<Product>?> getProducts();
}
