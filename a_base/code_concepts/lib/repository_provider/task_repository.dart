class Task {
  final String title;
  final bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  Task copyWith({
    String? title,
    bool? isCompleted,
  }) {
    return Task(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

// Отвечает за получение данных о задачах. В этом примере метод fetchTasks возвращает фиксированный список задач после задержки
class TaskRepository {
  Future<List<Task>> fetchTasks() async {
    // имитация загрузки данных с сервера или базы данных
    await Future.delayed(const Duration(seconds: 2));
    return [
      Task(title: 'Task 1'),
      Task(title: 'Task 2'),
      Task(title: 'Task 3'),
    ];
  }
}
