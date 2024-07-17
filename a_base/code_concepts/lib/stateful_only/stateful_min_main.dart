import 'package:flutter/material.dart';

void main() {
  runApp(const SomeApp());
}

class SomeApp extends StatelessWidget {
  const SomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ToggleButtonPage());
  }
}

class ToggleButtonPage extends StatelessWidget {
  const ToggleButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toggle Button Demo')),
      body: const Center(child: ToggleButton()),
    );
  }
}

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key});

  @override
  ToggleButtonScreenState createState() => ToggleButtonScreenState();
}

class ToggleButtonScreenState extends State<ToggleButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 100,
          height: 50,
          decoration:
              BoxDecoration(color: _isPressed ? Colors.blue : Colors.grey)),
    );
  }
}
