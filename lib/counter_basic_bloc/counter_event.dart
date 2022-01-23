abstract class CounterEvent {}

class IncrementCountEvent extends CounterEvent {
  final int? counter;

  IncrementCountEvent(this.counter);
}

class DecrementCountEvent extends CounterEvent {
  final int? counter;

  DecrementCountEvent(this.counter);
}
