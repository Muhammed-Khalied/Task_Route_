// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/datasource_contract/product_datasource_contract.dart' as _i4;
import '../data/datasource_impl/product_datasource_impl.dart' as _i5;
import '../data/network/api_manager/api_manager.dart' as _i3;
import '../data/repositories_impl/product_repository_impl.dart' as _i7;
import '../domain/repositories/product_repository_contract.dart' as _i6;
import '../domain/use%20cases/get_products_usecase.dart' as _i8;
import '../presentation/bloc/cubit/product_screen_cubit.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductDatasourceContract>(
        () => _i5.ProductDatasourceImpl(apiManager: gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductRepositoryContract>(() => _i7.ProductRepositoryImpl(
        productDatasourceContract: gh<_i4.ProductDatasourceContract>()));
    gh.factory<_i8.GetProductsUseCase>(() => _i8.GetProductsUseCase(
        productRepositoryContract: gh<_i6.ProductRepositoryContract>()));
    gh.factory<_i9.ProductScreenCubit>(() => _i9.ProductScreenCubit(
        getProductsUseCase: gh<_i8.GetProductsUseCase>()));
    return this;
  }
}
