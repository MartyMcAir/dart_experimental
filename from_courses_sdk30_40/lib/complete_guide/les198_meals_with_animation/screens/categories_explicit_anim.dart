import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';
import 'meals.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

// les200 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37145094#overview
// with TickerProviderStateMixin but for single controller -> SingleTickerProviderStateMixin
class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, // vsync -> 60 times per second
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1, // 20
    );

    // .stop() - for pause, forward() - play it to its end
    // unless you stop it in between     // .repeat()
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => MealsScreen(title: category.title, meals: filteredMeals)),
    ); // Navigator.push(context, route)
  }

  @override
  Widget build(BuildContext context) {
    // AnimatedBuilder - build every tick for animation
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              )
          ],
        ),
        // using controller - Explilcit animation
        builder: (context, child) => SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.3),
                end: const Offset(0, 0),
              ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),
              //
              // thanks to using SlideTransition, this animation is a bit more optimized
              // and it also gives us some extra features and capabilities
              // _animationController.drive(
              //   Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0)),
              // ),
              child: child,
            )
        // GridView will bee displayed inside Padding/
        // but only padding widget would be rebuilt 60 times per second and reevaluated
        // Padding(
        //   // padding: EdgeInsets.only(top: _animationController.value * 100), // animated down
        //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100), // animated up
        //   child: child),
        );
  }
}
