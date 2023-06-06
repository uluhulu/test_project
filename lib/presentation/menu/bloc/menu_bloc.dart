import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/domain/models/catalog/catalog.dart';
import 'package:test_project/domain/repos/catalog_repo/catalog_repo.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final CatalogRepository repository;

  MenuBloc({required this.repository}) : super(MenuInitialS()) {
    on<FetchMenuE>(_fetchMenu);
    add(FetchMenuE());
  }
  FutureOr<void> _fetchMenu(FetchMenuE event, Emitter<MenuState> emit) async {
    emit(MenuLoadingS());
    final result = await repository.getCatalog();
    emit(MenuLoadedS(catalog: result));
  }
}
