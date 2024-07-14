import 'package:route_task/data/model/productResponse/products_dto.dart';

import 'Product.dart';

class ProductResponse {
  ProductResponse({
    this.product,
    this.total,
    this.message,
    this.code,
    this.skip,
    this.limit,
  });

  ProductResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      product = [];
      json['products'].forEach((v) {
        product?.add(Product.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
    code = json['code'];
    message = json['message'];
  }

  List<Product>? product;
  num? total;
  num? skip;
  num? limit;
  String? code;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (product != null) {
      map['products'] = product?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    map['message'] = message;
    map['code'] = code;
    return map;
  }
}
