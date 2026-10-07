import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_project/core/di/di.dart';
import 'package:practice_project/features/products/presentation/cubits/product_cubit.dart';
import 'package:practice_project/features/products/presentation/cubits/product_detail_cubit.dart';
import 'package:practice_project/features/products/presentation/pages/product_detail_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return switch (state) {
            ProductInitial() => const SizedBox(),
            ProductSuccess() => ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ListTile(
            title: Text(product.title),
            subtitle: Text(product.price.toString()),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => getIt<ProductDetailCubit>(),
                    child: ProductDetailPage(productId: product.id),
                  ),
                ),
              );
            },
                        );
              },
              ),
              ProductLoading() => const CircularProgressIndicator(),
              ProductError()=> Text(state.message)
          };
        },
      ),
    );
  }
}
