part of 'bottom_tab_bar_cubit.dart';

class BottomTabBarState {
  final int currentIndex;
  final int sum;
  const BottomTabBarState({required this.currentIndex, required this.sum});

  // @override
  // List<Object> get props => [currentIndex, sum];
}

class ShowModalState extends BottomTabBarState {
  final Product product;
  ShowModalState(this.product,
      {required super.currentIndex, required super.sum});
  // @override
  // List<Object> get props => [currentIndex, sum, product];
}
