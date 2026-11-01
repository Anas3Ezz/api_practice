import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_project/core/network/dio_helper.dart';
import 'package:practice_project/features/products_screen/cubit/products_cubit.dart';
import 'package:practice_project/features/products_screen/data/repo/product_repo.dart';
import 'package:practice_project/features/products_screen/ui/products_screen.dart';

void main() {
  DioHelper.init();

  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Day',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A7C59),
          brightness: Brightness.light,
        ),
        fontFamily: 'SF Pro Display',
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ProductsCubit(ProductRepo())..getProducts(),
        child: ProductsScreen(),
      ),
    );
  }
}
