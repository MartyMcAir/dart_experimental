import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlocListener Example',
      home: BlocProvider(
        create: (_) => TaskBloc(),
        child: const TaskScreen(),
      ),
    );
  }
}

// Использует BlocProvider для предоставления TaskBloc всему дереву виджетов.
// В BlocListener слушает изменения состояния и показывает Snackbar.
// В BlocBuilder строит UI на основе текущего состояния.
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocListener Example'),
      ),
      // Слушает изменения состояния TaskBloc и показывает всплывающее сообщение (Snackbar) при каждом изменении списка задач.
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text(
                      'Task list updated. Total tasks: ${state.tasks.length}')),
            );
          }
        },
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskInitial) {
              return const Center(child: Text('No tasks yet.'));
            } else if (state is TaskLoaded) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) {
                  final task = state.tasks[index];
                  return ListTile(
                    title: Text(task.title),
                    leading: Checkbox(
                      value: task.isCompleted,
                      onChanged: (_) {
                        taskBloc.add(ToggleTaskCompletionEvent(index));
                      },
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTask = Task(title: 'New Task');
          taskBloc.add(AddTaskEvent(newTask));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
