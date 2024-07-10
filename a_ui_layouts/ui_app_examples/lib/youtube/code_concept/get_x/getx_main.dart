import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'conroller/counter_controller.dart';

void main() {
  runApp(const GetxApp());
}

// https://www.youtube.com/watch?v=5tUZlzRJ11E
class GetxApp extends StatelessWidget {
  const GetxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GetX Demo",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const GetxPage(title: "Getx Page Title"),
    );
  }
}

class GetxPage extends StatefulWidget {
  const GetxPage({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _GetxPageState();
}

class _GetxPageState extends State<GetxPage> {
  late CounterController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(CounterController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
          // Invalid constant value.
          // child: Text("Counter Value ${controller.count}"),
          ),
    );
  }
}
