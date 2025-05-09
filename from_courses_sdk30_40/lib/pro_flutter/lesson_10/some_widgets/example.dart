import 'package:flutter/material.dart';

import '../../widgets_examples/stack_positioned_index_10/widgets/about_island.dart';
import '../../widgets_examples/stack_positioned_index_10/widgets/background_image.dart';
import '../../widgets_examples/stack_positioned_index_10/widgets/heart_icon.dart';
// import 'package:lessons/widgets/aboutIsland.dart';
// import 'package:lessons/widgets/backgroundImage.dart';
// import 'package:lessons/widgets/heartIcon.dart';

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
