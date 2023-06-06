import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/domain/models/product/product.dart';

import '../../../use_cases/cart/cart_store.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartStore cartStore;

  CartBloc(this.cartStore) : super(CartInitialS()) {
    on<FetchCartE>(_fetchCart);
    on<AddItemE>(_addItem);
    on<DeleteItemE>(_deleteItem);

    add(FetchCartE());
  }
  FutureOr<void> _fetchCart(FetchCartE event, Emitter<CartState> emit) async {
    emit(CartLoadingS());
    final result = await cartStore.getProducts();
    emit(CartLoadedS(productList: result, sum: countSum(result)));
  }

  FutureOr<void> _addItem(AddItemE event, Emitter<CartState> emit) async {
    await cartStore.addProduct(event.product);
    add(FetchCartE());
  }

  FutureOr<void> _deleteItem(DeleteItemE event, Emitter<CartState> emit) async {
    await cartStore.deleteItem(event.product.id);
    add(FetchCartE());
  }

  int countSum(List<Product> productList) {
    int sum = 0;
    productList.forEach((element) {
      sum += (element.cost * element.selectedCount);
    });
    return sum;
  }
}
