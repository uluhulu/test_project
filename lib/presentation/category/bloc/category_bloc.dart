import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/presentation/cart/bloc/cart_bloc.dart';

import '../../../domain/models/product/product.dart';
import '../../../use_cases/cart/cart_store.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final List<Product> productList;
  final CartStore cartStore;

  CategoryBloc(this.productList, this.cartStore) : super(CategoryInitialS()) {
    on<InitCategoryE>(_initCategory);
    on<AddToCartE>(_addToCart);
    add(InitCategoryE());
  }
  FutureOr<void> _initCategory(
      InitCategoryE event, Emitter<CategoryState> emit) async {
    emit(CategoryLoadedS(
      productList: productList,
    ));
  }

  FutureOr<void> _addToCart(
      AddToCartE event, Emitter<CategoryState> emit) async {
    await cartStore.addProduct(event.product);
    event.cartBloc.add(FetchCartE());
    emit(CategoryLoadedS(
      productList: productList,
    ));
  }
}
