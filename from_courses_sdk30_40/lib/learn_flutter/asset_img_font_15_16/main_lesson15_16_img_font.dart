import 'package:flutter/material.dart';

// lesson 15 img _ 16 font

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // enable font for all app
      theme: ThemeData(fontFamily: 'IndieFlower'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Adding Assets'),
          centerTitle: true,
        ),
        body: Center(
            child: Stack(fit: StackFit.expand, children: <Widget>[
          const Image(
            image: AssetImage('assets/images/apple.png'),
          ),
          Image.asset('assets/icons/yasher.jpeg'),
          const Positioned(
            top: 16,
            left: 115,
            child: Text(
              'My font',
              style: TextStyle(
                fontSize: 30,
                color: Colors.yellow,
                // enable font for this widget place
                // fontFamily: 'IndieFlower',
              ),
            ),
          ),
        ])),
      ),
    );
  }
}
