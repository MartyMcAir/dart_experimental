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
          title: const Text('Column & Row Widgets'),
        ),
        body: const SimpleWidget(),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key, this.text = '', this.color = Colors.black, this.width = 3.14, this.fontSize = 13})
      : super(key: key);

  final String text;
  final Color color;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    // return Row(); // Column
    return Container(
      width: width,
      color: color,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize),
      ),
    );
  }
}

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // center
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      textDirection: TextDirection.ltr,
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        getFirsWidget(),
        const TextWidget(
          text: 'Second',
          color: Colors.cyanAccent,
          width: 210,
          fontSize: 33,
        ),
        const TextWidget(
          text: 'Third',
          color: Colors.purpleAccent,
          width: 230,
          fontSize: 30,
        )
      ],
    );
  }

  TextWidget getFirsWidget() {
    return const TextWidget(
      text: 'First',
      color: Colors.limeAccent,
      width: 180,
      fontSize: 38,
    );
  }
}
