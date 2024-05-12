import 'dart:async';
import 'package:flutter/material.dart';

// lesson 23 Expanded - для распределения места между элементами

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
        body: Row(children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.network(
                'https://www.pngmart.com/files/11/Not-Bad-Obama-Face-Transparent-PNG.png'),
          ),
          Expanded(
            // fill all free  space
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.orange,
              child: Text('1'),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.pink,
              child: Text('1'),
            ),
          ),
          Expanded(
            // fill all free  space
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(30),
              color: Colors.green,
              child: Text('1'),
            ),
          ),
        ]),
      ),
    );
  }
}
