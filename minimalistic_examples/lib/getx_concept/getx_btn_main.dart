import 'package:flutter/material.dart';
import 'package:get/get.dart';

// https://medium.com/@pvaddoriya1246/mastering-state-management-in-flutter-with-getx-a-comprehensive-guide-b0ac89ba1aac
void main() {
  runApp(const MyApp());
}

// Example of a reactive variable in GetX
final count = 0.obs;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Simple Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Obx - it from GetX
              // Widget updates automatically when count changes
              Obx(() => Text('Count: ${count.value}')),
              ElevatedButton(
                onPressed: () => count.value++,
                child: const Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
