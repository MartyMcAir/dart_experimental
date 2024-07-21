import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Управляет событиями добавления задач (AddTaskEvent) и переключения состояния завершения задач (ToggleTaskCompletionEvent).
// TaskState управляет состояниями, включая начальное состояние (TaskInitial) и состояние с загруженными задачами (TaskLoaded).

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

// Bloc Events
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final Task task;

  const AddTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

class ToggleTaskCompletionEvent extends TaskEvent {
  final int index;

  const ToggleTaskCompletionEvent(this.index);

  @override
  List<Object?> get props => [index];
}

// Bloc State
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  const TaskLoaded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

// Bloc Implementation
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<AddTaskEvent>((event, emit) {
      if (state is TaskLoaded) {
        final updatedTasks = List<Task>.from((state as TaskLoaded).tasks)
          ..add(event.task);
        emit(TaskLoaded(updatedTasks));
      } else {
        emit(TaskLoaded([event.task]));
      }
    });

    on<ToggleTaskCompletionEvent>((event, emit) {
      if (state is TaskLoaded) {
        final updatedTasks = List<Task>.from((state as TaskLoaded).tasks);
        updatedTasks[event.index] = updatedTasks[event.index]
            .copyWith(isCompleted: !updatedTasks[event.index].isCompleted);
        emit(TaskLoaded(updatedTasks));
      }
    });
  }
}
