import '../../../domain/entity/ProductResponse.dart';
import 'products_dto.dart';

class ProductResponseDto {
  ProductResponseDto({
    this.productsDto,
    this.message,
    this.code,
    this.total,
    this.skip,
    this.limit,
  });

  ProductResponseDto.fromJson(dynamic json) {
    if (json['products'] != null) {
      productsDto = [];
      json['products'].forEach((v) {
        productsDto?.add(ProductsDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
    message = json['message'];
    code = json['code'];
  }

  List<ProductsDto>? productsDto;
  num? total;
  num? skip;
  num? limit;
  String? message;
  String? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (productsDto != null) {
      map['products'] = productsDto?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    map['message'] = message;
    map['code'] = code;
    return map;
  }

  ProductResponse toProductResponse() {
    return ProductResponse(
      product: productsDto?.map((e) => e.toProduct()).toList(),
      total: total,
      skip: skip,
      limit: limit,
      message: message,
      code: code,
    );
  }
}
