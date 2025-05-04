import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/categories.dart';
import '../screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMedage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavoriteStatus(Meal meal) {
    final bool isExisting = _favoriteMeals.contains(meal);
    setState(() {
      isExisting == true
          ? {
              _favoriteMeals.remove(meal),
              _showInfoMedage('Meal is no longer a favorite (removed from favorite)'),
            }
          : {
              _favoriteMeals.add(meal),
              _showInfoMedage('Marked as a favorite!'),
            };
    });
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoriteStatus);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      // index 1 for icon 'favorite' in bottomNavigationBar.items
      activePage = MealsScreen(meals: _favoriteMeals, onToggleFavorite: _toggleMealFavoriteStatus);
      activePageTitle = 'Youre Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex, // index for.. which tab will be highlighted
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
