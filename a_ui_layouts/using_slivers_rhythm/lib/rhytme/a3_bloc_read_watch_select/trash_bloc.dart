import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

// Блок для управления состоянием логов
class LogBloc extends Cubit<List<String>> {
  LogBloc() : super([]);

  void addLog(String message) {
    List<String> logs = List.from(state);
    logs.add(message);
    emit(logs);
  }

  void clearLogs() {
    emit([]);
  }
}

class LogWidget extends StatelessWidget {
  const LogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogBloc, List<String>>(
      builder: (context, logs) {
        return Column(
          children: [
            // ------------------------------------
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                maxLines: 3,
                controller: TextEditingController(
                  text: logs.join('\n'),
                ),
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Logs',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<LogBloc>().clearLogs();
                    },
                  ),
                ),
              ),
            ),
            // ------------------------------------
          ],
        );
      },
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LogBloc()),
      ],
      child: MaterialApp(
        title: 'Log Example',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Log Example'),
          ),
          body: const LogWidget(),
        ),
      ),
    );
  }
}
