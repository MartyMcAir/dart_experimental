import 'package:flutter/material.dart';

import '../ui.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseConatiner(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Рифма',
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: theme.hintColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
