// https://api.flutter.dev/flutter/painting/LinearGradient-class.html

import 'package:flutter/material.dart';

import 'dice_roller.dart';

// Alignment topLeft = Alignment.topLeft;
const Alignment topLeft = Alignment.topLeft;
const topRight = Alignment.topRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  // naming constructor
  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    // var topRight = Alignment.topRight;
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [color1, color2],
          begin: topLeft,
          end: topRight,
        )),
        child: const Center(
          // child: StyledText('Hello world!'),
          // child: Image(image: image),
          child: DiceRoller(),
        ));
  }
}

// ---------------------------------------------------------------------------
// class GradientContainer extends StatelessWidget {
//   GradientContainer(this.color1, this.color2, {super.key});

//   final Color color1;
//   final Color color2;
//   var activeDiceImage = 'assets/images/dice-2.png';

//   // naming constructor
//   GradientContainer.purple({super.key})
//       : color1 = Colors.deepPurple,
//         color2 = Colors.indigo;

//   void rollDiceLikeAFunctionForOnPressed() {
//     activeDiceImage = 'assets/images/dice-4.png';
//     print('invoke method rollDiceLikeAFunctionForOnPressed()');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // var topRight = Alignment.topRight;
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//         colors: [color1, color2],
//         begin: topLeft,
//         end: topRight,
//       )),
//       child: Center(
//         // child: StyledText('Hello world!'),
//         // child: Image(image: image),
//         child: Column(
//           // для размешения по центру в вертикали колонки
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Image.asset(activeDiceImage, width: 200),
//             // padding in TextButton or SizedBox
//             const SizedBox(height: 20),
//             // - for displaying a btn that has a background color & slide shadow
//             // ElevatedButton(onPressed: onPressed, child: child)
//             // - for btn has no background color but a border
//             // OutlinedButton(onPressed: onPressed, child: child)
//             // - for btn that is only some pressabe text
//             TextButton(
//                 onPressed: rollDiceLikeAFunctionForOnPressed,
//                 style: TextButton.styleFrom(
//                   // padding: const EdgeInsets.only(top: 20),
//                   foregroundColor: Colors.white,
//                   textStyle: const TextStyle(fontSize: 28),
//                 ),
//                 // () { // ... },
//                 child: const Text('Roll Dice'))
//           ],
//         ),
//       ),
//     );
//   }
// }
// ---------------------------------------------------------------------------

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({super.key, required this.colors});

//   final List<Color> colors;

//   @override
//   Widget build(BuildContext context) {
//     // var topRight = Alignment.topRight;
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//         colors: colors,
//         // [          Color.fromARGB(255, 26, 2, 80),
//         //   Color.fromARGB(255, 45, 7, 98)        ]
//         begin: topLeft,
//         end: topRight,
//       )),
//       child: const Center(
//         child: StyledText('Hello world!'),
//       ),
//     );
//   }
// }