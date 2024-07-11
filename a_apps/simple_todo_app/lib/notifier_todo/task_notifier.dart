import 'package:flutter/material.dart';

import 'dto/task_dto.dart';

class TaskNotifier extends ChangeNotifier {
  List<TaskDto> _tasks = [
    TaskDto(title: 'Learn Flutter', isCompleted: false),
    TaskDto(title: 'Drink milk', isCompleted: false)
  ];

  List<TaskDto> get tasks => _tasks;

  void addTask(TaskDto task) {
    tasks.add(task);
    // instead using state(){} _ here using notifyListeners();
    notifyListeners();
  }

  void removedTask(TaskDto task) {
    tasks.remove(task);
    notifyListeners();
  }

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }
}
