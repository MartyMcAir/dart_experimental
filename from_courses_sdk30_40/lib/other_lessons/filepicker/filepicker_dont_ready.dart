import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() {
    return _App();
  }
}

class _App extends State<App> {
  String? _fileName;
  String? _path;
  Map<String, String>? _paths;
  String? _extension;
  bool _loadingPath = false;
  final bool _multiPick = false;
  final bool _hasValidMime = false;
  FileType? _pickingType;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    if (_pickingType != FileType.custom || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          // _paths = await FilePicker.getMultiFilePath(
          //     type: _pickingType, fileExtension: _extension);
        } else {
          _paths = null;
          // _path = await FilePicker.getFilePath(
          //     type: _pickingType, fileExtension: _extension);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation$e");
      }
      if (!mounted) return;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("FilePickerApp"),
        ),
        body: Center(
          // child: Text("Lets coding.."),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                child: MaterialButton(
                  onPressed: () => _openFileExplorer(),
                  child: const Text("Open file picker"),
                ),
              ),
              // const Builder()
            ],
          ),
        ),
      ),
    );
    return materialApp;
  }
}
