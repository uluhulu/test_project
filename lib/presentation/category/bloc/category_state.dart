part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitialS extends CategoryState {}

class CategoryLoadedS extends CategoryState {
  final List<Product> productList;

  const CategoryLoadedS({
    required this.productList,
  });
  @override
  List<Object> get props => [
        productList,
      ];
}
