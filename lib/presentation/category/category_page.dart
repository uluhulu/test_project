import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/presentation/category/category_loaded.dart';
import 'package:test_project/use_cases/cart/cart_store.dart';

import '../../domain/models/product/product.dart';
import '../../locator/locator.dart';
import '../widgets/screen_view.dart';
import 'bloc/category_bloc.dart';

class CategoryPage extends StatelessWidget {
  final List<Product> productList;
  final String title;

  const CategoryPage(
      {super.key, required this.productList, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryBloc>(
      create: _createCategoryBloc,
      child: ScreenView(
        title: title,
        body: const CategoryContent(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(true),
        ),
      ),
    );
  }

  CategoryBloc _createCategoryBloc(BuildContext context) {
    return CategoryBloc(
      productList,
      sl.get<CartStore>(),
    );
  }
}

class CategoryContent extends StatelessWidget {
  const CategoryContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadedS) {
          return CategoryLoaded(
            productList: state.productList,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
