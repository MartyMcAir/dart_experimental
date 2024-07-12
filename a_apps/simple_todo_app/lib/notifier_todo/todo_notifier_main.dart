import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/notifier_todo/controller/task_notifier.dart';

import 'screen/add_todo_screen.dart';
import 'screen/todo_list_screen.dart';

// https://www.youtube.com/watch?v=b1Loe5q_Zpc
void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => TaskNotifier(),
      child: const TodoNotifierApp()));
}

class TodoNotifierApp extends StatelessWidget {
  const TodoNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ToDoNotifierPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ToDoNotifierPage extends StatelessWidget {
  const ToDoNotifierPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoListScreen(),
        '/add-todo-screen': (_) => AddTodoScreen(),
      },
    );
  }
}
