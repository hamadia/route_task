import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/domain/useCases/get_product_use_case.dart';

import '../../../domain/entity/ProductResponse.dart';

@injectable
class ProductViewModel extends Cubit<ProductState> {
  GetProductUseCase getProductUseCase;

  @factoryMethod
  ProductViewModel({required this.getProductUseCase})
      : super(LoadingState(message: 'Loading'));

  void initPage() async {
    emit(LoadingState(message: 'Loading....'));
    var product = await getProductUseCase.invoke();
    try {
      return product.fold((response) {
        emit(SuccessState(productResponse: response));
      }, (error) {
        emit(ErrorState(errorMessage: error));
      });
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class ProductState {}

class LoadingState extends ProductState {
  String message;

  LoadingState({required this.message});
}

class ErrorState extends ProductState {
  String? errorMessage;

  ErrorState({this.errorMessage});
}

class SuccessState extends ProductState {
  ProductResponse productResponse;

  SuccessState({required this.productResponse});
}
