import 'products_dto.dart';

class ProductResponse {
  ProductResponse({
    this.products,
    this.total,
    this.skip,
    this.limit,
  });

  ProductResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  List<ProductsDto>? products;
  num? total;
  num? skip;
  num? limit;

  ProductResponse copyWith({
    List<ProductsDto>? products,
    num? total,
    num? skip,
    num? limit,
  }) =>
      ProductResponse(
        products: products ?? this.products,
        total: total ?? this.total,
        skip: skip ?? this.skip,
        limit: limit ?? this.limit,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }
}
