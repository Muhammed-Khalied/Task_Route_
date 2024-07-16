import 'package:flutter/material.dart';
import 'package:task_route_final/di/di.dart';
import 'package:task_route_final/presentation/ui/screens/product_screen.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}
//ProductScreen