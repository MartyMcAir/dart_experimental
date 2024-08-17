import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

// https://www.youtube.com/watch?v=PLP_WiB7QgA
// https://github.com/JohannesMilke/flutter_quil_example
// https://pub.dev/packages/flutter_quill#-usage
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter-Quill",
        theme: ThemeData(
            colorSchemeSeed: Colors.orangeAccent,
            textTheme: const TextTheme(bodySmall: TextStyle(fontSize: 20))),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool _isReadOnly = false;

  @override
  void initState() {
    super.initState();
    _controller = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
      readOnly: _isReadOnly,
    );
  }

  late QuillController _controller = QuillController(
    document: Document(),
    selection: const TextSelection.collapsed(offset: 0),
    readOnly: _isReadOnly,
  );
  final FocusNode _focusNode = FocusNode();

  void _toggleReadOnly() {
    setState(() {
      _isReadOnly = !_isReadOnly;
      // Обновляем readOnly через состояние, напрямую через QuillController это сделать нельзя.
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(_isReadOnly ? Icons.lock : Icons.lock_open),
            onPressed: _toggleReadOnly,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          QuillSimpleToolbar(
            controller: _controller,
            configurations: QuillSimpleToolbarConfigurations(),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: QuillEditor(
                controller: _controller,
                scrollController: ScrollController(),
                focusNode: _focusNode,
                // scrollable: true,
                // autoFocus: true,
                // readOnly: _isReadOnly,
                // expands: true,
                // padding: EdgeInsets.all(16),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
