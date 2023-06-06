import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(const TimerState()) {
    startTimer();
  }
  Timer? timer;
  int seconds = 600;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds--;
      if (seconds == 0) {
        timer.cancel();
      }
      emit(TimerStartS(seconds));
    });
  }
}
