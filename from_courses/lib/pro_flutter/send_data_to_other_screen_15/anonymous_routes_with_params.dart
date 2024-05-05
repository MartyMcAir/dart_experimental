import 'package:flutter/material.dart';
import './utils/theme.dart';

class Product {
  final String imageUrl;
  final String name;
  final String description;

  Product(
      {required this.imageUrl, required this.name, required this.description});
}

class AnonymousRoutesWithParams extends StatelessWidget {
  const AnonymousRoutesWithParams({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: basicTheme(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anonymous Routes With Params'),
      ),
      backgroundColor: Colors.white,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailScreen(product: product);
                  }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
