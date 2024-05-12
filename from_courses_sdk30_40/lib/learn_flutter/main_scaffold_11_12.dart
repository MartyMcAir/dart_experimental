// https://www.udemy.com/course/learn_flutter/learn/lecture/17549020#overview
// https://docs.flutter.dev/ui/widgets-intro
// ..
// https://m3.material.io/ - рекомендации по использованию стиля

import 'package:flutter/material.dart';

// https://www.udemy.com/course/learn_flutter/learn/lecture/17776704#overview
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        // Scaffold - основной контейнер Material дизайна
        // Scaffold Settings >>>
        backgroundColor: const Color.fromARGB(255, 138, 20, 124),
        // <<< Scaffold Settings
        appBar: AppBar(
          // appBar - application bar
          title: const Text("Here AppBar"),
          centerTitle: true,
        ),
        body: const Center(
          // body - внутрянка основного виджета
          child: Text(
            "Here body",
            style: TextStyle(
                fontSize: 16,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    ),
  );
}
