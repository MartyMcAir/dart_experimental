import 'package:flutter/material.dart';
import 'package:get/get.dart';

// https://medium.com/@pvaddoriya1246/mastering-state-management-in-flutter-with-getx-a-comprehensive-guide-b0ac89ba1aac
void main() {
  runApp(const MyApp());
}

// GetX Controller
final userController = Get.put(UserController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GetX Controller App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('Username: ${userController.username.value}')),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: userController.textEditingController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your name',
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  userController
                      .setUsername(userController.textEditingController.text);
                },
                child: const Text('Set Username'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => userController.incrementCount(),
                child: const Text('Increment Count'),
              ),
              Obx(() => Text('Count: ${userController.count.value}')),
            ],
          ),
        ),
      ),
    );
  }
}

class UserController extends GetxController {
  final RxString username = ''.obs;
  final RxInt count = 0.obs;
  final TextEditingController textEditingController = TextEditingController();

  void setUsername(String name) {
    username.value = name;
  }

  void incrementCount() {
    count.value++;
  }
}
