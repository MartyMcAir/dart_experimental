import 'package:flutter/material.dart';

import '../../../ui/widgets/index.dart';

class SearchRhymeBottomSheet extends StatelessWidget {
  const SearchRhymeBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              // Row по дефолту на всю ширину
              children: [
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: theme.hintColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Ввод слова тут...',
                            hintStyle: TextStyle(
                                color: theme.hintColor.withOpacity(0.5)),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 13),
                            enabledBorder: const OutlineInputBorder(
                              // убрали границы поля
                              borderSide: BorderSide.none,
                            ),
                            border: const OutlineInputBorder(
                              // убрали нижнюю прямую активного поля
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ))),
                const SizedBox(width: 8),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: const Text('word from autocomplete'),
                      onTap: () {},
                    ),
                separatorBuilder: (context, _) => const Divider(height: 1),
                itemCount: 15),
          ),
        ],
      ),
    );
  }
}
