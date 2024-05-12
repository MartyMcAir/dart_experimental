import 'dart:async';
import 'package:flutter/material.dart';

// lesson 22 widgets: Row and Column

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
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 130, 26, 139),
          ),
          child: Row(
              // child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Icon(Icons.adjust, size: 50, color: Colors.red),
                Icon(Icons.adjust, size: 150, color: Colors.green),
                Icon(Icons.adjust, size: 100, color: Colors.yellow),
              ]),
        ),
      ),
    );
  }
}
