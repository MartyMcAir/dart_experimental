import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../search/search_screen_with_list.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
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
            title: Text('Favorite'),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 5)), // отступ
          SliverList.builder(
            itemBuilder: (context, index) =>
                const RhymeListcard(isFavorite: true, rhyme: 'Рифма'),
          )
        ],
      ),
    );
  }
}
