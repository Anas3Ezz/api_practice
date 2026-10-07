import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_project/core/network/api_client.dart';
import 'package:practice_project/feature/products/data/datasources/product_remote_data_source.dart';
import 'package:practice_project/feature/products/data/repo/product_repository_impl.dart';
import 'package:practice_project/feature/products/ui/cubit/product_cubit.dart';
import 'package:practice_project/feature/products/ui/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductCubit(
          repository: ProductRepositoryImpl(
            productRemoteDataSource: ProductRemoteDataSource(apiClient: ApiClient())
            )
            ),
        child: const MyHomePage(),
      ),
    );
  }
}

