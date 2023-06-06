part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class InitCategoryE extends CategoryEvent {}

class AddToCartE extends CategoryEvent {
  final Product product;
  final CartBloc cartBloc;

  const AddToCartE(this.product, this.cartBloc);

  @override
  List<Object> get props => [product];
}
