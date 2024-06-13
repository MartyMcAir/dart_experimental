import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_slivers_rhythm/rhytme/bloc_counter_lite/bloc/counter_bloc.dart';

// https://www.youtube.com/watch?v=yHDzHZVcL6Y
void main() {
  runApp(const MyAppCounter2());
}

class MyAppCounter2 extends StatelessWidget {
  const MyAppCounter2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBlocCounter2(
          // title: 'some title',
          ),
    );
  }
}

class MyBlocCounter2 extends StatelessWidget {
  const MyBlocCounter2({super.key});

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
