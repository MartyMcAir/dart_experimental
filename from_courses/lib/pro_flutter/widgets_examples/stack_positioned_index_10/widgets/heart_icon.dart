import 'package:flutter/material.dart';

// Иконка с сердцем
class HeartIcon extends StatelessWidget {
  const HeartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.favorite,
      color: Colors.red,
      size: 30,
    );
  }
}
