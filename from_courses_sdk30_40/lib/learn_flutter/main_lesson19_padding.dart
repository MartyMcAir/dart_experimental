import 'dart:async';
import 'package:flutter/material.dart';

// lesson 19 Padding widget

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
        body: Padding(
          // padding: EdgeInsets.all(16),
          padding: EdgeInsets.only(left: 50, top: 60),
          child: Text(
            'Hello flutter!',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
