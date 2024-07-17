import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

// https://www.youtube.com/watch?v=yHDzHZVcL6Y
void main() {
  runApp(const MyAppCounter());
}

class MyAppCounter extends StatelessWidget {
  const MyAppCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBlocCounter(
          // title: 'some title',
          ),
    );
  }
}

class MyBlocCounter extends StatelessWidget {
  const MyBlocCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc()..add(CounterDecrementEvent());

    return BlocProvider<CounterBloc>(
      // добавление BlocProvider дает доступ к Блоку изнурри Scaffold
      // create: (context) => CounterBloc(), // фукциюю которая вернет наш generic
      // используя оператор .. (двоеточтя) можно добавить event происходящий при загрузке
      // те в итоге к дефолтным 5 прибавят 1
      // create: (context) => CounterBloc()..add(CounterIncrementEvent()),
      create: (context) => bloc,

      // ---
      // widget который необходимо рендерить те перерисовывать оборчую в BlocBuilder
      // либо оборачивают вообще все widgets в BlocBuilder смотря какая цель
      child: BlocBuilder<CounterBloc, int>(
        bloc: bloc, // указываем билдеру какой блок "провайдить"
        //state->int>, но можно и obj
        builder: (context, state) {
          CounterBloc blocProvider = BlocProvider.of<CounterBloc>(context);
          double buttonSize = 66;
          return Scaffold(
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    // тут получаем доступ к состоянию события CounterIncrementEvent
                    // и говорим когда происходит onPressed -> происходит событие инкрементации
                    blocProvider.add(CounterIncrementEvent());
                  },
                  icon: Icon(
                    Icons.plus_one,
                    size: buttonSize,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    blocProvider.add(CounterDecrementEvent());
                  },
                  icon: Icon(
                    Icons.exposure_minus_1,
                    size: buttonSize,
                  ),
                ),
              ],
            ),
            body: Center(
              // тут берем state (те наш int) и берем из него строку
              child:
                  Text(state.toString(), style: const TextStyle(fontSize: 33)),
            ),
          );
        },
      ),
    );
  }
}
