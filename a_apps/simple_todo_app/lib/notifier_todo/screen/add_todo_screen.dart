import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/notifier_todo/dto/task_dto.dart';
import 'package:simple_todo_app/notifier_todo/task_notifier.dart';

class AddTodoScreen extends StatelessWidget {
  final controller = TextEditingController();

  AddTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add todo title'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
                controller: controller,
                autofocus: true,
                decoration:
                    const InputDecoration(hintText: 'Add some todo item')),
            const SizedBox(height: 15),
            ElevatedButton(
                onPressed: () {
                  context.read<TaskNotifier>().addTask(
                      TaskDto(title: controller.text, isCompleted: false));
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
