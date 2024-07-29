import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mix_counter_bloc.dart';
import 'mix_counter_event.dart';
import 'mix_counter_state.dart';

// ---------------------------------------------------------
// **BlocBuilder**:
// - Используется для построения UI на основе состояний, предоставляемых `Bloc`
// - Подобен `context.watch()`, так как подписывается на все изменения состояния блока

// **BlocListener**:
// - Предназначен для выполнения побочных эффектов в ответ на изменения состояния, но не обновляет пользовательский интерфейс.
// - Подходит для выполнения таких задач, как навигация, показ уведомлений и т.д

// **BlocConsumer**: Комбинирует функциональность BlocBuilder и BlocListener
// - Позволяет одновременно слушать изменения состояния и строить UI.
// - Подобен комбинации `context.watch()` и `context.read()`.

// **BlocSelector**:
// - Подобен `context.select()`, позволяет выбрать часть состояния блока и подписаться только на изменения этой части.
// - Обеспечивает более гибкий и оптимизированный способ работы с состоянием блока.

void main() {
  runApp(const MixCounterApp());
}

class MixCounterApp extends StatelessWidget {
  const MixCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => MixCounterBloc(),
        child: const MixCounterPage(),
      ),
    );
  }
}

class MixCounterPage extends StatelessWidget {
  const MixCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Bloc Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Использование context.watch() для подписки на изменения всего состояния
            Text(
                'Counter (context.watch()): ${context.watch<MixCounterBloc>().state.counter}'),
            // Использование context.select() для подписки на конкретное значение
            Text(
                'Message (context.select()): ${context.select<MixCounterBloc, String>((bloc) => bloc.state.message)}'),
            // Использование BlocSelector для подписки на конкретное значение
            BlocSelector<MixCounterBloc, MixCounterState, int>(
              selector: (state) => state.counter,
              builder: (context, counter) {
                return Text('Counter (BlocSelector): $counter');
              },
            ),
            // Использование BlocListener для выполнения побочных эффектов
            BlocListener<MixCounterBloc, MixCounterState>(
              listener: (context, state) {
                if (state.counter == 5) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text(
                            'Counter reached 5! _ BlocListener -is working!')),
                  );
                }
              },
              child: Container(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Использование context.read() для вызова метода без подписки на изменения
                print('Accessing CounterBloc without triggering rebuild');
                context.read<MixCounterBloc>().add(ChangeMessage());
              },
              child: const Text('Change Message (context.read())'),
            ),
            ElevatedButton(
              onPressed: () {
                // Использование context.read() для перерисовки виджета
                context.read<MixCounterBloc>().add(Increment());
              },
              child: const Text('Increment Counter (context.watch())'),
            ),
            ElevatedButton(
              onPressed: () {
                // Использование context.select() для перерисовки виджета
                print('Accessing CounterBloc with context.select');
                context.read<MixCounterBloc>().add(ChangeMessage());
              },
              child: const Text('Change Message (context.select())'),
            ),
            ElevatedButton(
              onPressed: () {
                // Использование context.read() для сброса состояния
                print('Resetting CounterBloc state');
                context.read<MixCounterBloc>().add(Reset());
              },
              child: const Text('Reset State (context.read())'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Использование context.read() для вызова метода без подписки на изменения
          print('Accessing CounterBloc without triggering rebuild');
          context.read<MixCounterBloc>().add(Increment());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
