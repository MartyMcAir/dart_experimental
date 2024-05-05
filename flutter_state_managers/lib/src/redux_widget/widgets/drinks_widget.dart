import 'package:flutter/material.dart';

import '../model/drink.dart';

class DrinksWidget extends StatelessWidget {
  final Drink drink;
  // final Function onChanged;
  final Function(bool?) onChanged;

  const DrinksWidget({Key? key, required this.drink, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: drink.selected,
          onChanged: onChanged,
        ),
        Text(drink.name)
      ],
    );
  }
}
