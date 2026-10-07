import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_project/core/di/di.dart';
import 'package:practice_project/features/products/presentation/cubits/product_cubit.dart';

import 'package:practice_project/features/products/presentation/pages/home_page.dart';

void main() {
  setUpGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => getIt<ProductCubit>(),
        child: const MyHomePage(),
      ),
    );
  }
}

