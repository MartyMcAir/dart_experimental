import 'package:flutter/material.dart';
import './utils/theme.dart';

class NamedRoutesWithParams extends StatelessWidget {
  const NamedRoutesWithParams({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const DetailScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Named Routes With Params'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://3.bp.blogspot.com/-nJEfWk0sys4/Vl8P8OnJ9iI/AAAAAAAAGxc/Hwl5uJux2H4/s1920/picty-2.jpg',
              width: 200,
            ),
            ElevatedButton(
              child: const Text('Подробнее'),
              onPressed: () {
                Product product = Product(
                  imageUrl:
                      'https://3.bp.blogspot.com/-nJEfWk0sys4/Vl8P8OnJ9iI/AAAAAAAAGxc/Hwl5uJux2H4/s1920/picty-2.jpg',
                  name: 'Macbook Pro 13, 2020',
                  description:
                      'Intel Core i5,Turbo Boost up to 3.8GHz, 32GB, 1TB SSD',
                );
                Navigator.pushNamed(context, '/details', arguments: product);
              },
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String name;
  final String description;

  Product(
      {required this.imageUrl, required this.name, required this.description});
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
    // ModalRoute.of - для передачи данных с одного экрана на другой
    final Product product =
        ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Подробная информация'),
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  Image.network(
                    product.imageUrl,
                    width: 300,
                  ),
                  ListTile(
                    title: Text(product.name),
                    subtitle: Text(product.description),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('Назад'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
