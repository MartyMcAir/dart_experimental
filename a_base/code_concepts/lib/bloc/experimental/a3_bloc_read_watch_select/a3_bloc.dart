import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../a1_bloc_counter_lite/bloc/counter_bloc.dart';
import '../../../multi_provider/bloc_provider_with_logger/config_reader.dart';
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
  static final TextEditingController _doubleTextController =
      TextEditingController();

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
            // INCREMENT BUTTON--------------------------------
            IconButton(
              onPressed: () {
                counterBloc.add(CounterIncrementEvent());
                logger.i(' Increment Button pressed ');
              },
              icon: Icon(Icons.plus_one, size: buttonSize),
            ),
            // CLEAR BUTTON--------------------------------
            IconButton(
              onPressed: () {
                // очищаем сообщения об логах
                logBloc.add(ClearLogEvent());
                // очищаем поле с задублированным текстом
                _doubleTextController.clear();
                // сбрасываем на но 0 счетчик
                counterBloc.add(CounterClearEvent());
                // логгируем
                logger.i(' Clear Button pressed ');
              },
              icon: Icon(Icons.delete, size: buttonSize),
            ),
            // UPDATE BUTTON--------------------------------
            IconButton(
              onPressed: () {
                // при нажатии передаем значение из LogStorage.getLastLog()
                // и оно отобразится в поле
                logBloc.add(UpdLogEvent(LogInterceptor.getLastLog()));
                // logBloc.stream.listen((state) { // слушает состояние
                //   _controller.text = state;
                // });
                logger.i(' Update Button pressed ');
              },
              icon: Icon(Icons.update, size: buttonSize),
            ),
            // DOUBLE TEXT BUTTON--------------------------------
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final currentText = _doubleTextController.text;
                final doubledText = currentText + currentText;
                _doubleTextController.text = doubledText;
                logger.i(' Double Text Button pressed ');
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
                // WIDE FIELD BUILDER --------------------------------
                // вверху по центру цифра
                BlocBuilder<CounterBloc, int>(
                  bloc: counterBloc,
                  builder: (context, state) {
                    // logger.i(' BlocBuilder<CounterBloc, int> ');
                    return Text(state.toString(),
                        style: const TextStyle(fontSize: 33));
                  },
                ),
                // OutlineInputBorder &3 lines _ BUILDER --------------------------------
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
                // OutlineInputBorder BUILDER --------------------------------
                // Принимает из _controller
                Expanded(child: Container()),
                BlocBuilder<LogBloc, String>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextField(
                        controller: _doubleTextController,
                        decoration: const InputDecoration(
                          hintText: 'Enter some text',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
                  },
                ),
                // UnderlineInputBorder BUILDER --------------------------------
                // Принимает из LogBloc-> TextEditingController ->state
                Expanded(child: Container()),
                BlocBuilder<LogBloc, String>(
                  builder: (context, state) {
                    // Update the controller with the state
                    _doubleTextController.text = state;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: TextFormField(
                        controller: _doubleTextController,
                        // Использование TextEditingController внутри BlocBuilder: Каждый раз, когда состояние изменяется, создается новый TextEditingController
                        // controller: TextEditingController(text: state),
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter your username',
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
