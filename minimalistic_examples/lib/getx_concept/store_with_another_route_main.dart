import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final StoreController storeController = Get.put(StoreController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                storeController.setName(nameController.text);
              },
              child: const Text('Submit Name'),
            ),
            const SizedBox(height: 16.0),
            Obx(() => Text('Entered Name: ${storeController.name.value}')),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Get.to(() => const DetailsScreen());
                Get.to(const DetailsScreen());
              },
              child: const Text('Go to Another Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StoreController storeController = Get.find<StoreController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Screen'),
      ),
      body: Center(
        child: Obx(() {
          return Text(storeController.name.value.isNotEmpty
              ? 'Entered Name: ${storeController.name.value}'
              : 'Name not received');
        }),
      ),
    );
  }
}

class StoreController extends GetxController {
  final RxString name = ''.obs;

  void setName(String newName) {
    name.value = newName;
  }
}
