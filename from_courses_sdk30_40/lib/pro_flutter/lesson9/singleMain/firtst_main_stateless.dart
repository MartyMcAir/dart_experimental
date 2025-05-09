import 'package:flutter/material.dart';

void main() => runApp(const ScreenWidget());

var centerText = "Some text is good 333";

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatelessWidget'),
        ),
        body: const SimpleWidget(),
      ),
    );
  }
}

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(centerText, textDirection: TextDirection.ltr));
  }
}
