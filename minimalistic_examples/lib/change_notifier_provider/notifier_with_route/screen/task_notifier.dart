import 'package:flutter/material.dart';

import 'add_todo_screen.dart';

class TaskNotifier extends ChangeNotifier {
  final List<TaskDto> _tasks = [TaskDto(title: 'Learn Flutter', isCompleted: false)];

  List<TaskDto> get tasks => _tasks;

  void addTask(TaskDto task) {
    tasks.add(task);
    notifyListeners();
  }

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }
}
