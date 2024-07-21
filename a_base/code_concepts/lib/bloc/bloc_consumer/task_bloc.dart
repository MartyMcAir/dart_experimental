import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'task_repository.dart';

// Bloc Events
abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasksEvent extends TaskEvent {}

class ToggleTaskCompletionEvent extends TaskEvent {
  final int index;

  const ToggleTaskCompletionEvent(this.index);

  @override
  List<Object?> get props => [index];
}

// Bloc State
// TaskState управляет состояниями, включая начальное состояние (TaskInitial), состояние загрузки (TaskLoading), состояние с загруженными задачами (TaskLoaded), и состояние ошибки (TaskError).
abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;

  const TaskLoaded(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class TaskError extends TaskState {
  final String message;

  const TaskError(this.message);

  @override
  List<Object?> get props => [message];
}

// Bloc Implementation
// Управляет событиями загрузки задач (LoadTasksEvent) и переключения состояния завершения задач (ToggleTaskCompletionEvent).
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoading());
      try {
        final tasks = await taskRepository.fetchTasks();
        emit(TaskLoaded(tasks));
      } catch (e) {
        emit(const TaskError('Failed to load tasks'));
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
