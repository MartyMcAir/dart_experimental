import 'package:flutter/material.dart';

import './utils/theme.dart';

class NamedRoutes extends StatelessWidget {
  const NamedRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      routes: {
        '/': (context) => const HomeScreen(), // стартовый экран по умолчанию
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
        title: const Text('Named Routes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp13touch-space-select-202005?wid=904&hei=840&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1587460552755',
              width: 200,
            ),
            ElevatedButton(
              child: const Text('Подробнее'),
              onPressed: () {
                // Тут происходит навигация благодаря "Navigator"
                // push - добавляем путь на вершину стека
                Navigator.pushNamed(
                  context,
                  '/details',
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
  const DetailScreen({super.key});

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
                    'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp13touch-space-select-202005?wid=904&hei=840&fmt=jpeg&qlt=80&op_usm=0.5,0.5&.v=1587460552755',
                    width: 300,
                  ),
                  const ListTile(
                    // leading: Icon(Icons.album),
                    title: Text('Macbook Pro 13, 2020'),
                    subtitle: Text(
                        'Intel Core i5,Turbo Boost up to 3.8GHz, 32GB, 1TB SSD'),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              child: const Text('Назад'),
              onPressed: () {
                // Тут происходит навигация благодаря "Navigator"
                // pop удаляет верхний маршрут стека = предыдущая страница
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
