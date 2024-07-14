import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/task_notifier.dart';
import 'screen/add_todo_screen.dart';
import 'screen/todo_list_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) => TaskNotifier(),
      child: const TodoNotifierApp()));
}

class TodoNotifierApp extends StatelessWidget {
  const TodoNotifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoNotifierPage(),
    );
  }
}

class ToDoNotifierPage extends StatelessWidget {
  const ToDoNotifierPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoListScreen(),
        '/add-todo-screen': (_) => AddTodoScreen(),
      },
    );
  }
}
