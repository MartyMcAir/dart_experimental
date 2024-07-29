import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'context_event.dart';
import 'context_state.dart';

// context.read() - при поступлении новых данных, перерисовки UI не происходит
// используется для: получения значения из провайдера, БЕЗ подписки на его изменения
// плюсы: получение данных не вызывая перестроение виджета при изменении этих данных

// context.watch() - перерисовка всего UI при любых изменениях
// используется для: получения значения из провайдера, C подпиской на его изменения
// плюсы: их нет, просто обновляет весь UI при любых изменениях провайдера

// context.select() - перерисовка UI части виджета, при определенных изменениях данных
// используется для: получения части данных из провайдера,
//      подписываясь только на оперделенные изменения конкретной части
// плюсы: когда виджет зависит, только от определнной части данных,
//      и подписываясь только на эту часть данных провайдера,
//      тогда только при их изменении будет перестраиваться нужный виджет

// https://www.youtube.com/watch?v=Sunwo30Q_68 - не понял примеры не оч наглядно

void main() {
  runApp(const MyApp());
}

class ContextBloc extends Bloc<ContextEvent, ContextState> {
  ContextBloc() : super(ContextState(counter: 0, message: 'Initial message')) {
    on<Increment>((event, emit) {
      emit(ContextState(counter: state.counter + 1, message: state.message));
    });
    on<ChangeMessage>((event, emit) {
      emit(ContextState(counter: state.counter, message: 'Message changed'));
    });
    on<Reset>((event, emit) {
      emit(ContextState(counter: 0, message: 'Initial message'));
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ContextBloc(),
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
      appBar: AppBar(title: const Text('context Read Watch Select')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Использование context.watch() для подписки на изменения всего состояния
            BlocBuilder<ContextBloc, ContextState>(
              builder: (context, state) {
                return Text('Counter: ${state.counter}');
              },
            ),
            // Использование context.select() для подписки на конкретное значение
            BlocBuilder<ContextBloc, ContextState>(
              builder: (context, state) {
                final message = context
                    .select<ContextBloc, String>((bloc) => bloc.state.message);
                return Text('Message: $message');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Использование context.read() для вызова метода без подписки на изменения
                print('Accessing CounterBloc without triggering rebuild');
                context.read<ContextBloc>().add(ChangeMessage());
              },
              child: const Text(
                  'Change Message (context.read()) _ получаем изменения из провайдера с перерисовкой ChangeMessage (но чаще используется для получения изменений из провайдера без перерисовки UI)'),
            ),
            ElevatedButton(
              onPressed: () {
                // Использование context.read() для перерисовки виджета
                context.read<ContextBloc>().add(Increment());
              },
              child: const Text(
                  'Increment Counter (context.watch()) _ перерисовка Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                // Использование context.select() для перерисовки виджета
                context.read<ContextBloc>().add(ChangeMessage());
              },
              child: const Text(
                  'Change Message (context.select()) _ перерисовка нужного виджета, происходит только при изменении конкретной части данных провайдера _ те подписание только на изменения конкретной части данных (подписание есть на bloc.state.message _ а для перерисовки используется context.read)'),
            ),
            ElevatedButton(
              onPressed: () {
                print('Resetting CounterBloc state');
                context.read<ContextBloc>().add(Reset());
              },
              child: const Text(
                  'Reset State (context.read()) _ получаем изменения из провайдера без перерисовки UI'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Использование context.read() для вызова метода без подписки на изменения
          print('Accessing CounterBloc without triggering rebuild');
          context.read<ContextBloc>().add(Increment());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
