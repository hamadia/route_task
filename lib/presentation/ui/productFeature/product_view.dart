import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/di/di.dart';
import 'package:route_task/presentation/ui/productFeature/product_item_widget.dart';
import 'package:route_task/presentation/ui/productFeature/product_view_model.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductViewModel productViewModel = getIt<ProductViewModel>();

  @override
  void initState() {
    super.initState();
    productViewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: productViewModel,
        builder: (BuildContext context, state) {
          return Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 10 / 10),
            itemBuilder: (context, index) {
              switch (state) {
                case LoadingState():
                  {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                case ErrorState():
                  {
                    return Center(
                      child: Text(state.errorMessage!),
                    );
                  }
                case SuccessState():
                  {
                    return ProductItemWidget(
                      product: state.productResponse.product![index],
                    );
                  }
              }
              return null;
            },
            itemCount: state is SuccessState
                ? state.productResponse.product!.length
                : 0,
          ));
        });
  }
}
