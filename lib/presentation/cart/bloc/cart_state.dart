part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitialS extends CartState {}

class CartLoadingS extends CartState {}

class CartLoadedS extends CartState {
  final List<Product> productList;
  final int sum;

  const CartLoadedS({
    required this.productList,
    required this.sum,
  });
  @override
  List<Object> get props => [productList, sum];
}
