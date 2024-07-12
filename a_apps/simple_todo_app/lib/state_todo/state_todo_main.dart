import 'package:flutter/material.dart';

import 'screen_state_contoller.dart';

void main() {
  runApp(const TodoApp());
}

// https://www.youtube.com/watch?v=VfdTUKt21Ls
class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const StateTodoPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class StateTodoPage extends StatefulWidget {
  final String title;
  const StateTodoPage({super.key, required this.title});

  @override
  State<StateTodoPage> createState() => TodoScreenState();
}
