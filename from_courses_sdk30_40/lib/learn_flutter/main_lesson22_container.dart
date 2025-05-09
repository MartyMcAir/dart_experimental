import 'package:flutter/material.dart';

// lesson 21 Container widget
// it contains 2 widgets: Padding() and Align() and BoxDecoration()?

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Building layouts"),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(),
          ),
          width: 200,
          height: 100,
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(30),

          alignment: Alignment.center,
          // here text
          child: const Text(
            'Hello flutter!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
