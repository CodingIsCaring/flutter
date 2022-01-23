import 'package:codingiscaring_flutter/counter_basic_bloc/counter_bloc.dart';
import 'package:codingiscaring_flutter/counter_basic_bloc/counter_event.dart';
import 'package:codingiscaring_flutter/counter_basic_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Codingiscaring basic counter App'),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        }),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => {print(_counterBloc.state), _counterBloc.add(IncrementCountEvent())},
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const Divider(indent: 20),
            FloatingActionButton(
              onPressed: () => {print(_counterBloc.state), _counterBloc.add(DecrementCountEvent())},
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
