import 'package:flutter/material.dart';
import './utils/route_generator.dart';

import './utils/theme.dart';

class OnGenerateRoute extends StatelessWidget {
  const OnGenerateRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      home: const HomeScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('onGenerateRoute'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              // 'https://www.opensourceforu.com/wp-content/uploads/2017/02/Tux-with-tablet.jpg',
              'https://3.bp.blogspot.com/-nJEfWk0sys4/Vl8P8OnJ9iI/AAAAAAAAGxc/Hwl5uJux2H4/s1920/picty-2.jpg',
              width: 200,
            ),
            ElevatedButton(
              child: const Text('Подробнее'),
              onPressed: () {
                // для перехода к конкретному продукту по его ID
                Navigator.pushNamed(context, '/details/2');
              },
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  final int id;
  final String imageUrl;
  final String name;
  final String description;

  Product(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.description});
}

List<Product> products = [
  Product(
    id: 1,
    imageUrl:
        'https://3.bp.blogspot.com/-nJEfWk0sys4/Vl8P8OnJ9iI/AAAAAAAAGxc/Hwl5uJux2H4/s1920/picty-2.jpg',
    name: 'Macbook Pro 13, 2020',
    description: 'Intel Core i5,Turbo Boost up to 3.8GHz, 32GB, 1TB SSD',
  ),
  Product(
    id: 2,
    imageUrl:
        'https://3.bp.blogspot.com/-nJEfWk0sys4/Vl8P8OnJ9iI/AAAAAAAAGxc/Hwl5uJux2H4/s1920/picty-2.jpg',
    name: 'iPhone 12 Pro Max',
    description: '6.7-inch display, Pacific Blue, 512GB',
  ),
];

class DetailScreen extends StatelessWidget {
  final int _id;
  const DetailScreen({super.key, required int id}) : _id = id;

  Product findProduct(int id) =>
      products.firstWhere((product) => product.id == id);

  @override
  Widget build(BuildContext context) {
    Product product = findProduct(_id);

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
