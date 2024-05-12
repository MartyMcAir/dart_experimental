import 'package:flutter/material.dart';

void main() => runApp(ScreenWidget());

var CENTER_TEXT = "Some text is good 333";

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatelessWidget'),
        ),
        body: SimpleWidget(),
      ),
    );
  }
}

class SimpleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Center(child: Text(CENTER_TEXT, textDirection: TextDirection.ltr)));
  }
}
