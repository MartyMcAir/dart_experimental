// -----------
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../ui/widgets/index.dart';
import '../widgets/index.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: const Text('Rhymer'),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchButton(
              onTap: () => _showSearchBottomSheet(context)
              // ],)) // Column
              ,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final rhymes = List.generate(4, (index) => 'Рифма $index');
                return RhymeHistoryCard(rhymes: rhymes);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverList.builder(
          itemBuilder: (context, index) => const RhymeListCard(
            rhyme: 'Рифма',
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }

  void _showSearchBottomSheet(BuildContext context) {
    showModalBottomSheet(
      // https://www.youtube.com/watch?v=G1UDhN8EbKY&list=PLtUuja72DaLIywRDTLSSM5kMJLrbrUvbT&index=8
      // builder - строит контент внутри ботомшита
      // showBottomSheet( // без затемнения зад фона
      // с затемнением зад фона
      // ботомшит+колонка+isScrollControlled =на всю высоту экрана
      // но не будет отступа сверху
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0, // без elevation будет фон не белый
      context: context,
      builder: (context) =>
          // Column по дефолту старается выстроиться в максимал высоту
          // Column(
          //       children: [
          // const Padding(
          const Padding(
        padding: EdgeInsets.only(top: 60),
        child: SearchRhymeBottomSheet(),
      ),
    );
  }
}
