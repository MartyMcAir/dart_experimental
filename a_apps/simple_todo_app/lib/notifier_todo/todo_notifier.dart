import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/notifier_todo/save_task.dart';

import 'task.dart';

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
        '/': (_) => const TodoList(),
        '/add-todo-screen': (_) => AddTodo(),
      },
    );
  }
}

class AddTodo extends StatelessWidget {
  final controller = TextEditingController();

  AddTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Title add todo')),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  context.read<TaskNotifier>().addTask(
                      Task(title: controller.text, isCompleted: false));
                  controller.clear();
                  // pop - get and delete _ like in JAVA
                  Navigator.of(context).pop();
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Notifier List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-todo-screen');
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<TaskNotifier>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (BuildContext context, index) {
              return ListTitle(
                  title: Text(
                    task.tasks[index].title,
                    style: TextStyle(
                        decoration: task.tasks[index].isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                  trailing: Wrap(
                    children: [
                      Checkbox(
                          value: task.tasks[index].isCompleted,
                          onChanged: (_) {
                            context.read<TaskNotifier>().checkTask(index);
                          }),
                      IconButton(
                          onPressed: () {
                            context
                                .read<TaskNotifier>()
                                .removedTask(task.tasks[index]);
                          },
                          icon: const Icon(Icons.delete))
                    ],
                  ));
            },
          );
        },
      ),
    );
  }
}

class ListTitle extends StatelessWidget {
  final title;
  final Widget trailing;

  const ListTitle({
    super.key,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      trailing: trailing,
    );
  }
}
