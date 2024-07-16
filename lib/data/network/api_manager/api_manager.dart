import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:task_route_final/data/model/Product%20Response/task_response.dart';
import 'package:task_route_final/utls/constant/api_constant.dart';

@singleton
@injectable
class ApiManager {
  Future<TaskResponse> getProducts() async {
    var url = Uri.https(ApiConstant.baseUrl, ApiConstant.productsUrl);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    TaskResponse taskResponse = TaskResponse.fromJson(json);
    return taskResponse;
  }
}
