import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlocSelector Example',
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: const CounterScreen(),
      ),
    );
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocSelector Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
// Первый параметр указывает на тип блока (CounterCubit).
// Второй параметр указывает на тип полного состояния (int).
// Третий параметр указывает на тип выбранной части состояния (int).
            BlocSelector<CounterCubit, int, int>(
// selector выбирает часть состояния. В первом BlocSelector выбирается только четное состояние, во втором — нечетное.
              selector: (state) => state % 2 == 0 ? state : 0,
              builder: (context, evenCount) {
// builder строит виджет на основе выбранной части состояния.
                return Text(
                  'Even Count: $evenCount',
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
            ),
            const SizedBox(height: 20),
            BlocSelector<CounterCubit, int, int>(
              selector: (state) => state % 2 != 0 ? state : 0,
              builder: (context, oddCount) {
                return Text(
                  'Odd Count: $oddCount',
                  style: Theme.of(context).textTheme.bodyMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterCubit>().decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
