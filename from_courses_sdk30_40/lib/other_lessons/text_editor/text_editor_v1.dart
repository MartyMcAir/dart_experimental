import 'package:flutter/material.dart';

void main() {
  runApp(const TextEditorV1App());
}

class TextEditorV1App extends StatelessWidget {
  const TextEditorV1App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyTextEditor(),
    );
  }
}

class MyTextEditor extends StatefulWidget {
  const MyTextEditor({super.key});

  @override
  _MyTextEditorState createState() => _MyTextEditorState();
}

class _MyTextEditorState extends State<MyTextEditor> {
  final TextEditingController _textEditingController = TextEditingController();
  String _enteredText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Editor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(labelText: 'Enter Text'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _enteredText = _textEditingController.text;
                });
                // Дополнительные действия при сохранении текста, если необходимо
              },
              child: const Text('Save Text'),
            ),
            const SizedBox(height: 20),
            Text(
              'Entered Text: $_enteredText',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
