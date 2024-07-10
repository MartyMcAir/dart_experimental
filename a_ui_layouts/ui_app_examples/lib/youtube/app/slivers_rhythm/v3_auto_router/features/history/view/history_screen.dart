import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../ui/widgets/rhyme_history_card.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            title: Text('History'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 5)), // отступ
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.8, //меняет соотношение ширины и высоты
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const RhymeHistoryCard(
                      rhymes: ['one', 'two', 'three', 'four', 'five']);
                },
                childCount: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
