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
          Row(
            children: [
              // 3 точки каскадное добавление списка в др список
              if (sourceWord != null) ...[
                Text(
                  sourceWord!,
                  style: theme.textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                    color: theme.hintColor.withOpacity(0.4),
                  ),
                )
              ],
              Text(
                rhyme,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
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
