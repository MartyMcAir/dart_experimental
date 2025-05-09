import 'package:flutter/material.dart';

// lesson 22 widgets: Row and Column

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
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 130, 26, 139),
          ),
          child: const Row(
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
