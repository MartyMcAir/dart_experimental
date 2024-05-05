import 'package:flutter/material.dart';
import 'widgets/about_island.dart';
import 'widgets/background_image.dart';
import 'widgets/heart_icon.dart';

// помогает гибче настроить позицию сердечка над текстом
class PositionedWidget extends StatelessWidget {
  const PositionedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none, // если проблема с отображением за слоями
      fit: StackFit.expand, // для растягивания изображения на дисплее
      children: <Widget>[
        BackgroundImage(),
        Positioned(
          top: 500,
          child: AboutIsland(),
        ),
        Positioned(
          right: 50,
          top: 150, // 500
          child: HeartIcon(),
        ),
      ],
    );
  }
}
