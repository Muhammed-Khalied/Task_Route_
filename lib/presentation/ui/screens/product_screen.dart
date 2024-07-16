// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_route_final/di/di.dart';
import 'package:task_route_final/presentation/bloc/cubit/product_screen_cubit.dart';
import 'package:task_route_final/presentation/bloc/state/product_state.dart';
import 'package:task_route_final/presentation/ui/widgets/product_widget.dart';

class ProductScreen extends StatefulWidget {
  // ProductScreenCubit viewModel = ProductScreenCubit(
  //     getProductsUseCase: GetProductsUseCase(
  //         productRepositoryContract: ProductRepositoryImpl(
  //             productDatasourceContract:
  //                 ProductDatasourceImpl(apiManager: ApiManager()))));

  const ProductScreen({super.key});
  @override
  State<ProductScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<ProductScreen> {
  ProductScreenCubit viewModel = getIt<ProductScreenCubit>();
  @override
  void initState() {
    super.initState();
    viewModel.initPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductScreenCubit, ProductState>(
      bloc: viewModel,
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              return const Center(
                child: CircularProgressIndicator(backgroundColor: Colors.blue,),
              );
            }
          case ErrorState():
            {
              return Center(
                child: Column(
                  children: [
                    Expanded(
                        child: Center(
                            child: Text(
                      state.errorMassage ?? '',
                      style: const TextStyle(fontSize: 18),
                    ))),
                    ElevatedButton(
                        onPressed: () {
                          print(state.errorMassage);
                        },
                        child: const Text('Try Again'))
                  ],
                ),
              );
            }
          case SuccsessState():
            {
              var products = state.Products;
              return Scaffold(
                  body: Column(
                children: [
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: SizedBox(
                          height: 50,
                          width: 100,
                          child: Image.asset('assets/images/rot.PNG')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 139, 178, 211)),
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'What do you search for ?',
                                hintStyle: TextStyle(fontSize: 12),
                                border: InputBorder.none,
                                icon: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.search,
                                      color: Color.fromARGB(255, 53, 123, 181)),
                                )),
                          ),
                        ),
                        SizedBox(
                            height: 50,
                            width: 40,
                            child: Image.asset('assets/images/ic.PNG')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 565,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) =>
                            ProductWidget(product: products![index]),
                        itemCount: products?.length),
                  ),
                ],
              ));
            }
        }
      },
    );
  }
}
