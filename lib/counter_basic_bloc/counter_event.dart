import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {}

class IncrementCountEvent extends CounterEvent {
  IncrementCountEvent();

  @override
  List<Object?> get props => [];
}

class DecrementCountEvent extends CounterEvent {
  @override
  List<Object?> get props => [];
}
