import 'package:flutter/material.dart';

void main() {
  runApp(const TextControllerApp());
}

class TextControllerApp extends StatelessWidget {
  const TextControllerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TextControllerPage());
  }
}

class TextControllerPage extends StatefulWidget {
  const TextControllerPage({super.key});

  @override
  State<TextControllerPage> createState() => TextControlerScreenState();
}

class TextControlerScreenState extends State<TextControllerPage> {
  List toDoList = [
    ['Learn Flutter', false]
  ];

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return BoxElementList(item: toDoList[index][0]);
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Add some text'),
            )),
            FloatingActionButton(
              onPressed: addItem,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  void addItem() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }
}

class BoxElementList extends StatelessWidget {
  final String item;

  const BoxElementList({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(item);
  }
}
