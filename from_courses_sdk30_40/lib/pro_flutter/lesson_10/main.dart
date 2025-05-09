import 'package:flutter/material.dart';

import '../widgets_examples/stack_positioned_index_10/indexed_stack.dart';
// import 'package:lessons/indexedStack.dart';
// import 'package:lessons/positioned.dart';
// import 'package:lessons/stack.dart';

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
        // body: Example(),
        // body: StackWidget(),
        // body: PositionedWidget(),
        body: const IndexedStackWidget(),
      ),
    );
  }
}
