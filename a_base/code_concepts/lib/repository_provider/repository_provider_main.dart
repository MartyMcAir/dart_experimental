import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'task_bloc.dart';
import 'task_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
// Предоставляет экземпляр TaskRepository всему дереву виджетов.
      providers: [
        RepositoryProvider(create: (context) => TaskRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
// В сочетании с BlocProvider, TaskBloc получает доступ к TaskRepository для загрузки задач.
          BlocProvider(
            create: (context) =>
                TaskBloc(RepositoryProvider.of<TaskRepository>(context))
                  ..add(LoadTasksEvent()),
          ),
        ],
        child: const MaterialApp(
          title: 'RepositoryProvider Example',
          home: TaskScreen(),
        ),
      ),
    );
  }
}

// TaskScreen - использует BlocListener для прослушивания изменений состояния и показывает всплывающее сообщение (Snackbar) в случае ошибки.
class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = BlocProvider.of<TaskBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RepositoryProvider Example'),
      ),
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
// в BlocBuilder строится UI на основе текущего состояния.
        child: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is TaskInitial) {
              return const Center(child: Text('No tasks yet.'));
            } else if (state is TaskLoading) {
              return const Center(child: CircularProgressIndicator());
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
            } else if (state is TaskError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskBloc.add(LoadTasksEvent());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
