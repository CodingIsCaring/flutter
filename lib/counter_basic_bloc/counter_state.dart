import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {
  final int count;

  const CounterState(this.count);
  @override
  List<Object?> get props => [count];
}

class CountInitial extends CounterState {
  const CountInitial(int count) : super(count);

  @override
  List<Object?> get props => [count];
}

class CountIncremented extends CounterState {
  const CountIncremented(int count) : super(count);

  @override
  List<Object?> get props => [count];
}

class CountDecremented extends CounterState {
  CountDecremented(int count) : super(count);

  @override
  List<Object?> get props => [count];
}
