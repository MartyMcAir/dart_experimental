import 'package:flutter/material.dart';

import 'task.dart';

class TaskNotifier extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'Learn Flutter', isCompleted: false),
    Task(title: 'Drink milk', isCompleted: false)
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    tasks.add(task);
    // instead using state(){} _ here using notifyListeners();
    notifyListeners();
  }

  void removedTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }
}
