class CounterState {
  int _counter = 0;

  CounterState._() {
    _counter;
  }
  static final CounterState _instance = CounterState._();
  factory CounterState() => _instance;

  int get count => _counter;

  void onIncrement(value) {
    _counter++;
  }

  void onDecrement(value) {
    _counter--;
  }
}
