import 'package:flutter/material.dart';

import '../ui.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard(
      {super.key, required this.rhyme, this.sourceWord, this.isFavorite});

  final String rhyme;
  final String? sourceWord;
  final bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseConatiner(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (sourceWord != null) ...[
            Text(sourceWord!),
            const Icon(Icons.arrow_forward)
          ],
          Text(
            rhyme,
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
