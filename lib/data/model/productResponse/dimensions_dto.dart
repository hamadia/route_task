import 'package:route_task/domain/entity/Dimensions.dart';

class DimensionsDto {
  DimensionsDto({
    this.width,
    this.height,
    this.depth,
  });

  DimensionsDto.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }

  num? width;
  num? height;
  num? depth;

  DimensionsDto copyWith({
    num? width,
    num? height,
    num? depth,
  }) =>
      DimensionsDto(
        width: width ?? this.width,
        height: height ?? this.height,
        depth: depth ?? this.depth,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }

  Dimensions toDimensions() {
    return Dimensions(width: width, height: height, depth: depth);
  }
}
