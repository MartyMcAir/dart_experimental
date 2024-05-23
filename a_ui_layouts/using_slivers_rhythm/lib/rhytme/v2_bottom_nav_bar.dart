import 'package:flutter/material.dart';

// https://www.youtube.com/watch?v=USa8W4wJqhE&list=PLtUuja72DaLIywRDTLSSM5kMJLrbrUvbT&index=5

void main() {
  runApp(const RhythmApp());
}

class RhythmApp extends StatelessWidget {
  const RhythmApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFF82B10);
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.grey,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: PageView(
        // PageView для возможности листать /свайпать экраны по горизонтали
        controller: _pageController,
        // что бы при свайпах перелистывало
        onPageChanged: (currentIndex) {
          setState(() => _selectedPageIndex = currentIndex);
        },
        children: [
          SearchScreen(),
          Scaffold(),
          Scaffold(),
          Scaffold(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: theme.primaryColor,
          unselectedItemColor: theme.hintColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          currentIndex:
              _selectedPageIndex, // выделяется выбранный раздел из items массива
          onTap: _openBottomNavPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Избранное'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Стихи'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Настройки')
          ]),
      // Red кнопка справа внизу
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: theme.primaryColor,
      ),
    );
  }

  void _openBottomNavPage(int index) {
    // (value){}
    setState(() => _selectedPageIndex = index);
    // _pageController.jumpToPage(index); // fast
    // slow with animated effects
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }
}

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
          itemBuilder: (context, index) => const RhymeListcard(),
        )
      ],
    );
  }
}

class TopBlockHistoryCard extends StatelessWidget {
  const TopBlockHistoryCard({
    super.key,
    required this.rhymes,
  });

  final List<String> rhymes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BaseContainer(
      width: 200,
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('main seached word',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700)),
          Wrap(
              children: rhymes
                  // к каждом элементу списка применим padding
                  .map((element) => Padding(
                      padding: const EdgeInsets.only(right: 18),
                      child: Text(element)))
                  .toList())
        ],
      ),
    );
  }
}

class BaseContainer extends StatelessWidget {
  BaseContainer(
      {super.key,
      required this.child,
      required this.width,
      this.margin,
      // по дефолту значение поля padding 12
      this.padding = const EdgeInsets.only(left: 12)});

  EdgeInsets? margin; // наллабл _ необязательное поле
  final EdgeInsets padding;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      // height: 40,
      margin: margin,
      // margin: const EdgeInsets.symmetric(horizontal: 2).copyWith(bottom: 3),      // padding: const EdgeInsets.all(6),eeqwsqwswq
      // padding: const EdgeInsets.only(left: 12),
      padding: padding,
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(6)),
      child: child,
    );
  }
}

class RhymeListcard extends StatelessWidget {
  const RhymeListcard({super.key});

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
                color: theme.hintColor.withOpacity(0.3),
                // color: theme.primaryColor,
              ))
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    // required this.theme,
  });

  // final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.hintColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded),
          const SizedBox(width: 12),
          Text(
            'Search field',
            style: TextStyle(
                fontSize: 12,
                color: theme.hintColor.withOpacity(0.5),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
