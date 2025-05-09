import 'package:flutter/material.dart';

// lesson 23 Expanded - для распределения места между элементами

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
        body: Row(children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.network('https://www.pngmart.com/files/11/Not-Bad-Obama-Face-Transparent-PNG.png'),
          ),
          Expanded(
            // fill all free  space
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(30),
              color: Colors.orange,
              child: const Text('1'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(30),
              color: Colors.pink,
              child: const Text('1'),
            ),
          ),
          Expanded(
            // fill all free  space
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(30),
              color: Colors.green,
              child: const Text('1'),
            ),
          ),
        ]),
      ),
    );
  }
}
