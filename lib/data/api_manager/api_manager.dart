import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:route_task/data/model/productResponse/ProductResponse.dart';

abstract class ApiManager {
  static String baseUrl = 'https://dummyjson.com/products';

  Future<ProductResponse> getProduct() async {
    var url = Uri.https(baseUrl);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ProductResponse productResponse = ProductResponse.fromJson(json);
    return productResponse;
  }
}
