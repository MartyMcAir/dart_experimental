import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(TextEditorV2App());
}

class TextEditorV2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyTextEditor(),
    );
  }
}

class MyTextEditor extends StatefulWidget {
  @override
  _MyTextEditorState createState() => _MyTextEditorState();
}

class _MyTextEditorState extends State<MyTextEditor> {
  TextEditingController _textEditingController = TextEditingController();
  String _enteredText = "";
  File? _currentFile;

  @override
  void initState() {
    super.initState();
    _loadFileContent();
  }

  Future<void> _loadFileContent() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/text_file.txt');

      if (await file.exists()) {
        setState(() {
          _currentFile = file;
          _enteredText = file.readAsStringSync();
          _textEditingController.text = _enteredText;
        });
      }
    } catch (e) {
      print("Error loading file: $e");
    }
  }

  Future<void> _saveToFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/text_file.txt');

      await file.writeAsString(_textEditingController.text);

      setState(() {
        _currentFile = file;
        _enteredText = _textEditingController.text;
      });
    } catch (e) {
      print("Error saving file: $e");
    }
  }

  Future<void> _openFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
      );

      if (result != null) {
        File file = File(result.files.single.path!);

        setState(() {
          _currentFile = file;
          _enteredText = file.readAsStringSync();
          _textEditingController.text = _enteredText;
        });
      }
    } catch (e) {
      print("Error opening file: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Editor'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              await _saveToFile();
            },
          ),
          IconButton(
            icon: Icon(Icons.folder_open),
            onPressed: () async {
              await _openFile();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(labelText: 'Enter Text'),
            ),
            SizedBox(height: 20),
            Text(
              'Entered Text: $_enteredText',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _saveToFile(); // Автоматическое сохранение при закрытии приложения
    super.dispose();
  }
}
