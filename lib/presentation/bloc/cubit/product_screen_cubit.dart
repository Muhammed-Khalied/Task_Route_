import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task_route_final/domain/use%20cases/get_products_usecase.dart';
import 'package:task_route_final/presentation/bloc/state/product_state.dart';

@injectable
class ProductScreenCubit extends Cubit<ProductState> {
  GetProductsUseCase getProductsUseCase;
  @factoryMethod
  ProductScreenCubit({required this.getProductsUseCase})
      : super(LoadingState(massage: 'Loading...'));

  initPage() async {
    emit(LoadingState(massage: 'Loading...'));
    try {
      var products = await getProductsUseCase.invoke();
      emit(SuccsessState(Products: products));
    } catch (e) {
      emit(ErrorState(errorMassage: e.toString()));
    }
  }
}
