// import 'dart:typed_data';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

void main() async {
  runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}

class ScreenshotService {
  final ScreenshotController _controller = ScreenshotController();
  final GlobalKey _globalKey = GlobalKey();

  Future<Uint8List?> takeScreenshot() async {
    try {
      Uint8List? image = await _controller.capture(
          delay: Duration(seconds: 1), pixelRatio: 3.0);
      if (image != null) {
        // Directory? directory = await getApplicationDocumentsDirectory();
        Directory? directory = await null;
        if (directory != null) {
          File file = File('${directory.path}/screenshot.png');
          await file.writeAsBytes(image);
          print('Скриншот сохранен: ${file.path}');
          return image;
        }
      }
      return null;
    } catch (e) {
      print('Ошибка при создании скриншота: $e');
      return null;
    }
  }

  Widget buildScreenshotWidget(Widget child) {
    return Screenshot(
      controller: _controller,
      child: RepaintBoundary(
        key: _globalKey,
        child: child,
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Screenshot App'),
        ),
        body: Center(
          child:
              ScreenshotService().buildScreenshotWidget(Text('Hello, World')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await ScreenshotService().takeScreenshot();
          },
          tooltip: 'Take Screenshot',
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
