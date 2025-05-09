import 'package:flutter/material.dart';

class IndexedStackWidget extends StatefulWidget {
  const IndexedStackWidget({super.key});

  @override
  _IndexedStackWidgetState createState() => _IndexedStackWidgetState();
}

class _IndexedStackWidgetState extends State<IndexedStackWidget> {
  int _index = 0;
  double size = 100.0;

  void _switchLayout() {
    if (_index != 2) {
      setState(() {
        _index++;
        size += 100.0;
      });
    } else {
      setState(() {
        _index = 0;
        size = 50.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IndexedStack(
            index: _index,
            children: [
              AnimatedSquare(size, Colors.redAccent),
              AnimatedSquare(size, Colors.orangeAccent),
              AnimatedSquare(size, Colors.greenAccent),
            ],
          ),
          // RaisedButton( // RaisedButton is DEPRECATED
          //   onPressed: () {
          //     _switchLayout();
          //   },
          //   color: Colors.blue,
          //   textColor: Colors.white,
          //   child: const Text('Color Button'),
          // )

          // alternative: ElevatedButton or MaterialButton
          MaterialButton(
            onPressed: () {
              _switchLayout();
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: const Text('Color Button'),
          ),
        ],
      ),
    );
  }
}

class AnimatedSquare extends StatelessWidget {
  final double size;
  final Color color;

  const AnimatedSquare(this.size, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInBack,
      duration: const Duration(seconds: 1),
      width: size,
      height: size,
      color: color,
    );
  }
}
