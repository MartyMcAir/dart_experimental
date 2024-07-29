import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_provider_event.dart';
import 'bloc_provider_state.dart';
import 'counter_bloc.dart';

void main() {
  runApp(const MyApp());
}
// Так как `flutter_bloc` под капотом использует `provider`, тогда наиболее подобным `context.read()` является использование `BlocProvider.of<T>(context)`.

// Оба метода позволяют получить экземпляр блока и вызвать его методы или диспатчить события без подписки на изменения состояния и перерисовки виджета (конечно если следом, не используется .add(..)).
//- Диспатчить события - отправлять случившийся Event в систему управления состоянием, с целью уведомления о том, что произошло определённое действие.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: const CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text('Counter: ${state.counter}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Диспатчинг события Increment
                    context.read<CounterBloc>().add(Increment());
                  },
                  child: const Text('Increment'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Диспатчинг события Decrement
                    context.read<CounterBloc>().add(Decrement());
                  },
                  child: const Text('Decrement'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Диспатчинг события Reset используя BlocProvider.of
                    // context.read<CounterBloc>().add(Reset());
                    BlocProvider.of<CounterBloc>(context).add(Reset());
                  },
                  child: const Text('Reset by using BlocProvider.of'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
