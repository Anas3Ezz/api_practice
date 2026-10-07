import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_project/feature/products/ui/cubit/product_detail_cubit.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productId});
  final int productId;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailCubit>().getProductById(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
       builder: (context, state) {
          return switch (state) {
            ProductDetailInitial() => SizedBox(),
            ProductDetailSuccess() => SizedBox(
              child: Column(
                children: [
                  Text(state.product.id.toString()),
                  Text(state.product.title),
                  Text(state.product.price.toString()),
                ],
              ),
            ),
              ProductDetailLoading() => CircularProgressIndicator(),
              ProductDetailError()=> Text(state.message)
          };
        },
    )
    );
  }
}
