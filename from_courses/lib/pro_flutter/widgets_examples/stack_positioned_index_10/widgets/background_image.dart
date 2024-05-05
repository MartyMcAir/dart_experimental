import 'package:flutter/material.dart';

// Изображение в контейнере (Container убрал тк подсвечивало его ненужность)
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/bali.jpg', fit: BoxFit.cover);
  }
}
