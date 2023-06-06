import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../navigation/cubit/bottom_tab_bar_cubit.dart';
import '../widgets/screen_view.dart';
import 'bloc/cart_bloc.dart';
import 'cart_loaded.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenView(
      title: "cart",
      body: const CategoryContent(),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          BlocProvider.of<BottomTabBarCubit>(context).changeIndex(0);
          context.go('/menu');
        },
      ),
    );
  }
}

class CategoryContent extends StatelessWidget {
  const CategoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoadedS) {
          return CartLoaded(
            productList: state.productList,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
