import 'package:flutter/material.dart';
import 'widgets/about_island.dart';
import 'widgets/background_image.dart';
import 'widgets/heart_icon.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center, // выравниваем по центру
      // alignment: Alignment(1, 1),
      children: <Widget>[
        BackgroundImage(),
        AboutIsland(),
        HeartIcon(),
      ],
    );
  }
}
