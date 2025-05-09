import 'package:flutter/material.dart';

import '../../widgets_examples/stack_positioned_index_10/widgets/about_island.dart';
import '../../widgets_examples/stack_positioned_index_10/widgets/background_image.dart';
import '../../widgets_examples/stack_positioned_index_10/widgets/heart_icon.dart';
// import 'package:lessons/widgets/aboutIsland.dart';
// import 'package:lessons/widgets/backgroundImage.dart';
// import 'package:lessons/widgets/heartIcon.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.center,

      // alignment: Alignment(1, 1),
      children: <Widget>[
        BackgroundImage(),
        AboutIsland(),
        HeartIcon(),
      ],
    );
  }
}
