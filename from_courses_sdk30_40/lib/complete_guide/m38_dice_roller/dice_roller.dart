// https://api.flutter.dev/flutter/painting/LinearGradient-class.html

import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller extends StatefulWidget {
  // const DiceRoller(Color color, Color color, {super.key});
  const DiceRoller({super.key});

  // const DiceRoller(this.color1, this.color2, {super.key});
  // final Color color1;
  // final Color color2;
  // const DiceRoller.purple({super.key})
  //     : color1 = Colors.deepPurple,
  //       color2 = Colors.indigo;

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  final randomizer = Random();

  void rollDiceLikeAFunctionForOnPressed() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
    print('invoke method rollDiceLikeAFunctionForOnPressed()');
  }

  @override
  Widget build(BuildContext context) {
    // var topRight = Alignment.topRight;
    return Column(
      // для размешения по центру в вертикали колонки
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/compl_guide/img/dice-$currentDiceRoll.png',
          width: 200,
        ),
        // padding in TextButton or SizedBox
        const SizedBox(height: 20),
        // - for displaying a btn that has a background color & slide shadow
        // ElevatedButton(onPressed: onPressed, child: child)
        // - for btn has no background color but a border
        // OutlinedButton(onPressed: onPressed, child: child)
        // - for btn that is only some pressabe text
        TextButton(
            onPressed: rollDiceLikeAFunctionForOnPressed,
            style: TextButton.styleFrom(
              // padding: const EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 28),
            ),
            // () { // ... },
            child: const Text('Roll Dice'))
      ],
    );
  }
}
