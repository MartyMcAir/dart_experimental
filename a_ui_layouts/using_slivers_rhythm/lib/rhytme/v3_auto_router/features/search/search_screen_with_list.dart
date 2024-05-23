import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:using_slivers_rhythm/rhytme/v1_rhytme.dart';
// import 'package:using_slivers_rhythm/rhytme/v3_auto_router/features/poems/base_container.dart';
// import 'package:using_slivers_rhythm/rhytme/v3_auto_router/features/search/top_block_histry_card.dart';
// import 'package:using_slivers_rhythm/rhytme/v3/features/search/search_button.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Title for appBar'),
          pinned: true, // что бы Appbar зафиксировать в верхху
          snap: true,
          floating: true,
          // backgroundColor: theme.primaryColor,
          // backgroundColor: theme.cardColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.redAccent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: SearchButton(),
          ),
        ),
        // отступ от AppBar
        const SliverToBoxAdapter(child: SizedBox(height: 5)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 2),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(
                width: 5,
              ),
              itemBuilder: (context, index) {
                final rhymes = List.generate(4, (index) => 'Rhyme $index');
                return TopBlockHistoryCard(rhymes: rhymes);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 5)), // отступ
        SliverList.builder(
          itemBuilder: (context, index) => RhymeListcard(),
        )
      ],
    );
  }
}

class RhymeListcard extends StatelessWidget {
  const RhymeListcard({super.key, this.isFavorite = false});

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      margin: const EdgeInsets.symmetric(horizontal: 2).copyWith(bottom: 3),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // элементы по бокам
        children: [
          Text(
            'Some Rhyme',
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: isFavorite
                    ? theme.primaryColor
                    : theme.hintColor.withOpacity(0.3),
                // color: theme.primaryColor,
              ))
        ],
      ),
    );
  }
}
