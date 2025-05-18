import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Building List View'),
          centerTitle: true,
        ),
        body: const BodyListView(),
      ),
    );
  }
}

class BodyListView extends StatelessWidget {
  const BodyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return _myListView();
  }
}

Widget _myListView() {
  final List<String> items = List<String>.generate(100, (i) => 'Item $i');

  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(items[index]),
          leading: const Icon(Icons.insert_photo, color: Colors.red),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      );
    },
  );
}
