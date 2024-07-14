import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/presentation/ui/productFeature/product_view.dart';
import 'package:route_task/presentation/ui/searchWidget/search_widget.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/img_1.png',
          width: 80.w,
          height: 30.h,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SearchWidget(),
            SizedBox(
              height: 15.h,
            ),
            ProductView(),
          ],
        ),
      ),
    );
  }
}
