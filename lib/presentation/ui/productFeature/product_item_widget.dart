import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/domain/entity/Product.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key, required this.product});

  final Product product;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment(.8, -.8),
      children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          width: 191.w,
          height: 250.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.blue.shade900),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: 180.w,
                height: 100.h,
                fit: BoxFit.cover,
                imageUrl: widget.product.images![0],
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Text(
                widget.product.title!,
                maxLines: 1,
                style: TextStyle(fontSize: 14.sp),
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 191.w),
                child: Text(
                  widget.product.description ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(children: [
                Text('EGP '),
                Text(widget.product.discountPercentage == null
                    ? widget.product.price.toString()
                    : widget.product.discountPercentage.toString()),
                SizedBox(
                  width: 15,
                ),
                Visibility(
                    visible: widget.product.discountPercentage != null,
                    child: Text(widget.product.price.toString(),
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color.fromRGBO(0, 65, 130, 0.6)))),
              ]),
              Row(
                children: [
                  Text('Review (${widget.product.rating.toString() ?? ''})'),
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Spacer(),
                  ImageIcon(
                    AssetImage('assets/images/img_3.png'),
                    color: Colors.blue.shade900,
                  ),
                ],
              )
            ],
          ),
        ),
        CircleAvatar(
          child: Image.asset(
            'assets/images/img_2.png',
            width: 30.w,
            height: 30.h,
          ),
        )
      ],
    );
  }
}
