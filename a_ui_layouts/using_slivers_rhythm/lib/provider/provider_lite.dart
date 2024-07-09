import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// https://www.youtube.com/watch?v=d8axHiTPcj0
void main() {
  runApp(const ProviderApp());
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
// --------------------------------------------

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const ProviderPage(title: 'Provider page title'),
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: const ProviderPage(
          title: 'provider page title',
        ),
      ),
    );
  }
}

// class ChangeNotifierProvider {}

class ProviderPage extends StatefulWidget {
  final String title;

  const ProviderPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _MyProviderState();
}

class _MyProviderState extends State<ProviderPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times'),
            Text(
              // '$_counter',
              '${counterModel._counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        onPressed: () {
          counterModel.incrementCounter();
        },
        tooltip: 'increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    _counter++;
  }
}
