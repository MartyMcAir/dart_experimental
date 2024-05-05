import 'package:flutter/material.dart';
import 'widgets/about_island.dart';
import 'widgets/background_image.dart';
import 'widgets/heart_icon.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BackgroundImage(),
        AboutIsland(),
        HeartIcon(),
      ],
    );
  }
}
