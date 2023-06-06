part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchCartE extends CartEvent {}

class DeleteItemE extends CartEvent {
  final Product product;

  const DeleteItemE({required this.product});

  @override
  List<Object> get props => [product];
}

class AddItemE extends CartEvent {
  final Product product;

  const AddItemE({required this.product});
  @override
  List<Object> get props => [product];
}
