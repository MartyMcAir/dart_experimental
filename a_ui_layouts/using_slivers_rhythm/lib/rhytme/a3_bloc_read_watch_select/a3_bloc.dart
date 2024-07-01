// context.read() - при поступлении новых данных, перерисовки UI не происходит
// используется для: получения значения из провайдера, БЕЗ подписки на его изменения
// плюсы: получение данных не вызывая перестроение виджета при изменении этих данных

// context.watch() - перерисовка всего UI при любых изменениях
// используется для: получения значения из провайдера, C подпиской на его изменения
// плюсы: их нет, просто обновляет весь UI при любых изменениях провайдера

// context.select() - перерисовка UI части виджета, при определнных изменениях данных
// используется для: получения части данных из провайдера,
//      подписываясь только на оперделенные изменения конкретной части
// плюсы: когда виджет зависит, только от определнной части данных,
//      и подписываясь только на эту часть данных провайдера,
//      тогда только при их изменении будет перестраиваться нужный виджет

// https://www.youtube.com/watch?v=Sunwo30Q_68 - не понял примеры не оч наглядно

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:using_slivers_rhythm/rhytme/a1_bloc_counter_lite/bloc/counter_bloc.dart';

import '../a2_multi_bloc_provider/config_reader.dart';
import 'log_field_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LogConfig.init();
  runApp(const MyAppCounter2());
}

class MyAppCounter2 extends StatelessWidget {
  const MyAppCounter2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyReadWatchSelectApp(),
    );
  }
}

class MyReadWatchSelectApp extends StatelessWidget {
  const MyReadWatchSelectApp({super.key});
  final double buttonSize = 66;
  static final Logger logger = LogConfig.logger;
  static final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    logger.i('This is a build -----------------------------------------');

    final CounterBloc counterBloc = CounterBloc()..add(CounterDecrementEvent());
    final LogBloc logBloc = LogBloc()..add(ClearLogEvent());

    return MultiBlocProvider(
      providers: [
        // ---- PROVIDERS --------------------------- >>>
        BlocProvider<CounterBloc>(
          create: (context) => counterBloc,
        ),
        // ------------------------------------
        BlocProvider<LogBloc>(
          create: (context) => logBloc,
        ),
        // ---- PROVIDERS --------------------------- <<<
      ],
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ---- BUTTONS --------------------------- >>>
            IconButton(
              onPressed: () {
                counterBloc.add(CounterIncrementEvent());
                logger.i(' CounterIncrementEvent pressed ');
              },
              icon: Icon(Icons.plus_one, size: buttonSize),
            ),
            IconButton(
              onPressed: () {
                logBloc.add(ClearLogEvent());
                logger.i(' ClearLogEvent pressed ');
                _controller.clear();
              },
              icon: Icon(Icons.delete, size: buttonSize),
            ),
            IconButton(
              onPressed: () {
                // при нажатии передаем значение из LogStorage.getLastLog()
                // и оно отобразится в поле
                logBloc.add(UpdLogEvent(LogStorage.getLastLog()));
                // logBloc.stream.listen((state) { // слушает состояние
                //   _controller.text = state;
                // });
                logger.i(' UpdLogEvent pressed ');
              },
              icon: Icon(Icons.update, size: buttonSize),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final text = _controller.text;
                final doubledText = text + text;
                _controller.text = doubledText;
                logger.i(' doubledText pressed ');
              },
              child: const Text('Double Text'),
            ),
            // ---- BUTTONS --------------------------- <<<
          ],
        ),
        // SafeArea чтоб контент не выпал за границы экрана (!?)
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                // ---- (context, state) --------------------------- >>>
                BlocBuilder<CounterBloc, int>(
                  bloc: counterBloc,
                  builder: (context, state) {
                    return Text(state.toString(),
                        style: const TextStyle(fontSize: 33));
                  },
                ),
                // ------------------------------------
                Expanded(child: Container()),
                BlocBuilder<LogBloc, String>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        maxLines: 3,
                        controller: TextEditingController(
                          text: state.toString(),
                        ),
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: 'Logs',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
                  },
                ),
                Expanded(child: Container()),
                BlocBuilder<LogBloc, String>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        // controller: _controller,
                        controller: TextEditingController(text: state),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your username',
                        ),
                      ),
                    );
                  },
                ),
                Expanded(child: Container()),
                BlocBuilder<LogBloc, String>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter some text',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
                  },
                ),
                // ---- (context, state) --------------------------- <<<
              ],
            ),
          ),
        ),
      ),
    );
  }

// --- BUTTONS - METHODS -------------------------------------------------

// --- (context, state) - METHODS -----------------------------------------------
}
