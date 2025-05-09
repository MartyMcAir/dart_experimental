import 'package:flutter/material.dart';

void main() => runApp(const ScreenWidget());

var centerText = "Some text is good 333";

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatefullWidget'),
        ),
        body: const SimpleWidget(),
      ),
    );
  }
}

class SimpleWidget extends StatefulWidget {
  const SimpleWidget({super.key});

  @override
  _SimpleWidgetState createState() => _SimpleWidgetState();
}

class _SimpleWidgetState extends State<SimpleWidget> {
  int _count = 0;

  void _handleButton() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('$_count'),
          ElevatedButton(
            onPressed: () {
              _handleButton();
              // print('Button Pressed');// write your onPressed function here
            },
            child: const Text('Press Me'),
          )
        ],
      ),
    );
  }
}
