import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import 'meals.dart';
import '../widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37143978#overview
  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals =
        dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // Stateful - не нужен для смены экрана
    // push -add _ pop - remove from the stack
    // Navigator.push(context, route); // the same - of(context).push
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(
              title: category.title,
              meals: filteredMeals,
            )));
  }

  @override
  Widget build(BuildContext context) {
    // in multi screen app _ all screens use Scaffold
    return Scaffold(
      appBar: AppBar(title: const Text('Pick your category')),
      body: GridView(
        // for very long items list
        //GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder),
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2, // 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // Text('1', style: TextStyle(color: Colors.white70)),
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList(),
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
    );
  }
}
