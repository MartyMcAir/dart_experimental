import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InputProvider()),
        ChangeNotifierProvider(create: (_) => DisplayProvider()),
      ],
      child: const MaterialApp(
        title: 'Provider Example',
        home: HomeScreen(),
      ),
    );
  }
}

class InputProvider with ChangeNotifier {
  String _input = '';

  String get input => _input;

  void updateInput(String input) {
    _input = input;
    notifyListeners();
  }

  void clearInput() {
    _input = '';
    notifyListeners();
  }
}

class DisplayProvider with ChangeNotifier {
  String _displayText = '';
  String _topText = '';

  String get displayText => _displayText;
  String get topText => _topText;

  void updateDisplayText(String text) {
    _displayText = text;
    notifyListeners();
  }

  void moveToTop() {
    _topText = _displayText;
    _displayText = '';
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final inputProvider = Provider.of<InputProvider>(context);
    final displayProvider = Provider.of<DisplayProvider>(context);
    // Если нужно программно управлять текстовым полем, использовать курсор или выделять текст, тогда использовать TextEditingController удобнее
    // но все это можно делать и в InputProvider
    final TextEditingController inputController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              // текстовое поле ввода, для использования контроллера расскоментить
              // controller: inputController,
              // те если контроллер то поле "controller" - если у многих виджетов
              // или использовать onChanged для провайдеров
              onChanged: (text) {
                inputProvider.updateInput(text);
              },
              decoration: const InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // обновляет _input в InputProvider, затем передает это значение в DisplayProvider, и очищает _input
                // раскомментировать для использования inputController
                // String input = inputController.text;
                // inputProvider.updateInput(input);
                displayProvider.updateDisplayText(inputProvider.input);
                inputProvider.clearInput();
                inputController.clear();
              },
              child: const Text('SEND'),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Top Display: ${displayProvider.topText}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Display: ${displayProvider.displayText}',
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                displayProvider.moveToTop();
              },
              child: const Text('ShowToP'),
            ),
          ],
        ),
      ),
    );
  }
}
