import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'min_notifier.dart';

class NotifierScreen extends StatelessWidget {
  const NotifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo Notifier List title')),
      body: Consumer<SomeNotifier>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (BuildContext context, index) {
              return ListTitle(
                  title: Text(task.tasks[index].title,
                      style: TextStyle(
                          decoration: task.tasks[index].isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none)),
                  trailing: Wrap(
                    children: [
                      Checkbox(
                          value: task.tasks[index].isCompleted,
                          onChanged: (_) {
                            context.read<SomeNotifier>().checkTask(index);
                          })
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

  const ListTitle({super.key, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: title, trailing: trailing);
  }
}
