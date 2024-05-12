import 'package:flutter/material.dart';

import '../../widgets_examples/stack_positioned_index_10/widgets/about_island.dart';
import '../../widgets_examples/stack_positioned_index_10/widgets/background_image.dart';
import '../../widgets_examples/stack_positioned_index_10/widgets/heart_icon.dart';
// import 'package:lessons/widgets/aboutIsland.dart';
// import 'package:lessons/widgets/backgroundImage.dart';
// import 'package:lessons/widgets/heartIcon.dart';

class PositionedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: <Widget>[
        BackgroundImage(),
        Positioned(
          top: 500,
          child: AboutIsland(),
        ),
        Positioned(
          right: 50,
          top: 150,
          child: HeartIcon(),
        ),
      ],
    );
  }
}
