part of 'timer_cubit.dart';

class TimerState extends Equatable {
  final int seconds = 600;
  const TimerState();

  @override
  List<Object> get props => [seconds];
}

class TimerStartS extends TimerState {
  @override
  final int seconds;

  TimerStartS(this.seconds);

  @override
  List<Object> get props => [seconds];
}
