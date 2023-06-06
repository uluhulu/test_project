import 'package:flutter/material.dart';
import 'package:test_project/domain/models/product/product.dart';
import 'package:test_project/presentation/cart/widgets/cart_item.dart';

class CartLoaded extends StatelessWidget {
  final List<Product> productList;

  const CartLoaded({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: productList.length,
        itemBuilder: (BuildContext ctx, index) {
          return CartItem(
            product: productList[index],
            onTap: () {},
          );
        });
  }
}
