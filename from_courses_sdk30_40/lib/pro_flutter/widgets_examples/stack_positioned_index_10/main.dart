import 'package:flutter/material.dart';
import 'example.dart';
import 'indexedStack.dart';
import 'positioned.dart';
import 'stack.dart';

void main() => runApp(const ScreenWidget());

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack & Positioned Widgets'),
        ),
        // body: const Example(),
        // body: const StackWidget(), // StackWidget упорядочивает снизу вверх, последний это 1ый сверху а 1ый самый нижний это img
        // - Stack - позволяет наложить один widget на другой
        // body: const PositionedWidget(),
        body: const IndexedStackWidget(),
      ),
    );
  }
}
