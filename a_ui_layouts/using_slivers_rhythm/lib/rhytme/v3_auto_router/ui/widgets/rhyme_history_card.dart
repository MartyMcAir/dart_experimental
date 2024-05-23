import 'package:flutter/material.dart';

import '../ui.dart';

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({super.key, required this.rhymes});

  final List<String> rhymes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseConatiner(
      width: 200,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Слово',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),

          Flexible(
            child: Text(
              rhymes.map((e) => '$e,  ').toList().join(),
              overflow: TextOverflow.ellipsis, // elipsis - троеточие..
              // maxLines: 3, // кажется не работает по колву строк
            ),
          ),
          // Wrap(
          //   children: rhymes
          //       .map((e) => Padding(
          //             padding: const EdgeInsets.only(right: 4),
          //             child: Text(e),
          //           ))
          //       .toList(),
          // ),
        ],
      ),
    );
  }
}
