import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/domain/models/product/product.dart';
import 'package:test_project/presentation/category/bloc/category_bloc.dart';
import 'package:test_project/presentation/category/widgets/category_item.dart';

import '../cart/bloc/cart_bloc.dart';

class CategoryLoaded extends StatelessWidget {
  final List<Product> productList;

  const CategoryLoaded({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: productList.length,
        itemBuilder: (BuildContext ctx, index) {
          return CategoryItem(
            product: productList[index],
            onTap: () {
              BlocProvider.of<CategoryBloc>(context).add(AddToCartE(
                  productList[index], BlocProvider.of<CartBloc>(context)));
            },
          );
        });
  }
}
