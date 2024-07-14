import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:route_task/data/model/productResponse/ProductResponseDto.dart';

@singleton
@injectable
class ApiManager {
  static const baseUrl = 'dummyjson.com';

  Future<ProductResponseDto> getProduct() async {
    var url = Uri.https(baseUrl, '/products');
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ProductResponseDto productResponse = ProductResponseDto.fromJson(json);
    return productResponse;
  }
}
