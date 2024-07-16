import 'productDto.dart';

class TaskResponse {
  List<ProductDto>? products;
  int? total;
  int? skip;
  int? limit;

  TaskResponse({this.products, this.total, this.skip, this.limit});

  @override
  String toString() {
    return 'TaskResponse(products: $products, total: $total, skip: $skip, limit: $limit)';
  }

  factory TaskResponse.fromJson(Map<String, dynamic> json) => TaskResponse(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        total: json['total'] as int?,
        skip: json['skip'] as int?,
        limit: json['limit'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}
