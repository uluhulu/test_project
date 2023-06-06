import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/domain/models/product/product.dart';

part 'bottom_tab_bar_state.dart';

class BottomTabBarCubit extends Cubit<BottomTabBarState> {
  BottomTabBarCubit()
      : super(
          const BottomTabBarState(
            currentIndex: 0,
            sum: 0,
          ),
        );

  void changeIndex(int index) {
    emit(BottomTabBarState(
      currentIndex: index,
      sum: state.sum,
    ));
  }

  void changeSum(int sum) {
    emit(BottomTabBarState(
      currentIndex: state.currentIndex,
      sum: sum,
    ));
  }

  void showModal(Product product) {
    emit(ShowModalState(
      product,
      currentIndex: state.currentIndex,
      sum: state.sum,
    ));
  }
}
