import 'dart:async';

import 'package:flutter/material.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _windowSize = 'Unknown';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setInitialWindowSizeAndPosition(); // Устанавливаем начальный размер и положение окна
    });
  }

  // Функция для установки начального размера и позиции окна на основе физического размера дисплея
  Future<void> _setInitialWindowSizeAndPosition() async {
    final primaryDisplay =
        await screenRetriever.getPrimaryDisplay(); // Получаем основной экран

    // 1.6 & 1.3 = vs_code
    // 2.0 & 1.6 = sublime
    var width = primaryDisplay.size.width / 2.0;
    var height = primaryDisplay.size.height / 1.6;

    // Устанавливаем размер окна
    await windowManager.setSize(Size(width, height));

    // Рассчитываем координаты для центрирования окна
    var x = (primaryDisplay.size.width - width) / 2;
    var y = (primaryDisplay.size.height - height) / 2;

    // Устанавливаем положение окна
    await windowManager.setPosition(Offset(x, y));
  }

  Future<void> _getWindowSize() async {
    var size = await windowManager.getSize();
    setState(() {
      _windowSize = '${size.width} x ${size.height}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Centered Window Example'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$_windowSize\n'),
                ElevatedButton(
                  onPressed: _getWindowSize,
                  child: const Text("getWindowSize"),
                ),
                Wrap(
                  children: [
                    ElevatedButton(
                      child: const Text("Smaller"),
                      onPressed: () async {
                        var size = await windowManager.getSize();
                        await windowManager
                            .setSize(Size(size.width - 50, size.height - 50));
                        await _getWindowSize();
                      },
                    ),
                    ElevatedButton(
                      child: const Text("Larger"),
                      onPressed: () async {
                        var size = await windowManager.getSize();
                        await windowManager
                            .setSize(Size(size.width + 50, size.height + 50));
                        await _getWindowSize();
                      },
                    ),
                    ElevatedButton(
                      child: const Text("divide 2"),
                      onPressed: () async {
                        var size = await windowManager.getSize();
                        await windowManager
                            .setSize(Size(size.width / 2, size.height / 2));
                        await _getWindowSize();
                      },
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    ElevatedButton(
                      child: const Text("toggleFullScreen"),
                      onPressed: () async {
                        bool isFullScreen = await windowManager.isFullScreen();
                        await windowManager.setFullScreen(!isFullScreen);
                      },
                    ),
                    ElevatedButton(
                      child: const Text("setFullScreen(true)"),
                      onPressed: () async {
                        await windowManager.setFullScreen(true);
                      },
                    ),
                    ElevatedButton(
                      child: const Text("setFullScreen(false)"),
                      onPressed: () async {
                        await windowManager.setFullScreen(false);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
