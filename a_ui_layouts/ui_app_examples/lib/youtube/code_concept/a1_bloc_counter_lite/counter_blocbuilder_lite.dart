import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_slivers_rhythm/youtube/code_concept/a1_bloc_counter_lite/bloc/counter_bloc.dart';

// https://www.youtube.com/watch?v=yHDzHZVcL6Y
void main() {
  runApp(const MyAppCounter1());
}

class MyAppCounter1 extends StatelessWidget {
  const MyAppCounter1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBlocCounter1(
          // title: 'some title',
          ),
    );
  }
}

class MyBlocCounter1 extends StatelessWidget {
  const MyBlocCounter1({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBloc bloc = CounterBloc()..add(CounterDecrementEvent());
    const double buttonSize = 66;

    return BlocProvider<CounterBloc>(
      create: (context) => bloc,
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                bloc.add(CounterIncrementEvent());
              },
              icon: const Icon(Icons.plus_one, size: buttonSize),
            ),
            IconButton(
              onPressed: () {
                bloc.add(CounterDecrementEvent());
              },
              icon: const Icon(Icons.exposure_minus_1, size: buttonSize),
            ),
          ],
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, int>(
            bloc: bloc,
            builder: (context, state) {
              return Text(state.toString(),
                  style: const TextStyle(fontSize: 33));
            },
          ),
        ),
      ),
    );
  }
}
