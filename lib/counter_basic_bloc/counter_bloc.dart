import 'dart:async';

import 'package:codingiscaring_flutter/counter_basic_bloc/counter_state.dart';
import 'package:codingiscaring_flutter/counter_basic_bloc/counter_event.dart';

class CounterBloc {
  CounterState counterState = CounterState();

  final StreamController<CounterEvent> _input = StreamController();
  final StreamController<int> _output = StreamController.broadcast();

  StreamSink<CounterEvent> get sendEvent => _input.sink;
  Stream<int> get counterStream => _output.stream;

  void _onEvent(CounterEvent event) {
    if (event is IncrementCountEvent) {
      counterState.onIncrement(event.counter);
    }

    if (event is DecrementCountEvent) {
      counterState.onDecrement(event.counter);
    }

    _output.add(counterState.count);
  }

  CounterBloc() {
    _input.stream.listen(_onEvent);
  }

  void dispose() {
    _input.close();
    _output.close();
  }
}
