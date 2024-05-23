import 'package:flutter/material.dart';

import 'router/router.dart';

// 6 https://www.youtube.com/watch?v=WiOqf8HOWgM&list=PLtUuja72DaLIywRDTLSSM5kMJLrbrUvbT&index=6
// flutter packages pub run build_runner build
// 7 https://www.youtube.com/watch?v=dXrb5289dmc&list=PLtUuja72DaLIywRDTLSSM5kMJLrbrUvbT&index=7
// .vscode/settings.json - шоб vscode при сохранении сам правил все что мог включая импорты

void main() {
  runApp(const RhymerApp());
}

class RhymerApp extends StatefulWidget {
  const RhymerApp({super.key});

  @override
  State<RhymerApp> createState() => _RhymerAppState();
}

class _RhymerAppState extends State<RhymerApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFF82B10);
    return MaterialApp.router(
      title: 'Rhymer',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: const Color(0xFFEFF1F3),
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      routerConfig: _router.config(),
    );
  }
}
