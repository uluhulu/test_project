part of 'menu_bloc.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitialS extends MenuState {}

class MenuLoadingS extends MenuState {}

class MenuLoadedS extends MenuState {
  final List<Catalog> catalog;

  const MenuLoadedS({
    required this.catalog,
  });
  @override
  List<Object> get props => [catalog];
}
