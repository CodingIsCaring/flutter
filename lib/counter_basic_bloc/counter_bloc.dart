import 'dart:async';

import 'package:codingiscaring_flutter/counter_basic_bloc/counter_state.dart';
import 'package:codingiscaring_flutter/counter_basic_bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter;
  CounterBloc({this.counter = 0}) : super(CountInitial(counter));

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementCountEvent) {
      counter = counter + 1;
      yield CountIncremented(counter);
    }

    if (event is DecrementCountEvent) {
      counter = counter - 1;
      yield CountDecremented(counter);
    }
  }
}
