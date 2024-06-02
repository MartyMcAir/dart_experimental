import 'dart:async';
import 'package:flutter/material.dart';

// lesson 24 Stack widget

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
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Icon(Icons.air_sharp, color: Colors.pink, size: 200),
          Positioned(
            top: 60,
            left: 45,
            child: Text('sharp', style: TextStyle(fontSize: 30)),
          ),
        ]),
      ),
    );
  }
}
