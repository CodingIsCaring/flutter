import 'package:codingiscaring_flutter/counter_basic_bloc/counter_bloc.dart';
import 'package:codingiscaring_flutter/counter_basic_bloc/counter_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final CounterBloc _counterBloc = CounterBloc();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Codingiscaring basic counter App'),
      ),
      body: StreamBuilder<int>(
          stream: _counterBloc.counterStream,
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            );
          }),
      floatingActionButton: StreamBuilder<int>(
          stream: _counterBloc.counterStream,
          builder: (context, snapshot) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () => _counterBloc.sendEvent.add(IncrementCountEvent(snapshot.data)),
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                const Divider(indent: 20),
                FloatingActionButton(
                  onPressed: () => _counterBloc.sendEvent.add(DecrementCountEvent(snapshot.data)),
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
              ],
            );
          }),
    );
  }
}
