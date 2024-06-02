import 'dart:async';
import 'package:flutter/material.dart';

// lesson 20 Allign widget _ or use Center() - widget

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Building layouts"),
          centerTitle: true,
        ),
        body: Align(
          // body: Center( // OR use widget Center()
          alignment: Alignment.center,
          // alignment: Alignment.topLeft,
          // alignment: Alignment(-1.0, -1.0),
          child: Text(
            'Hello flutter!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
