import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_project/presentation/app/app_state_cubit/cubit/loading_state.dart';

import 'app_loaded_state.dart';

part 'app_state.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(const LoadingState()) {
    initAppState();
  }

  Future<void> initAppState() async {
    emit(const AppLoadedState());
  }
}
