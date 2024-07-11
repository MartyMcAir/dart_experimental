import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/notifier_todo/task_notifier.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Notifier List title'),
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
