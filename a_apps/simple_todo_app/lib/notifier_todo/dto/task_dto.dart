class TaskDto {
  final String title;
  bool isCompleted;

  TaskDto({
    required this.title,
    required this.isCompleted,
  });

  void isDone() {
    isCompleted = !isCompleted;
  }
}
