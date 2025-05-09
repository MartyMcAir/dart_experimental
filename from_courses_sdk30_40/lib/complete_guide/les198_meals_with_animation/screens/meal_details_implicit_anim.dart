import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../providers/favorites_provider.dart';

// Implicit Animation - https://docs.flutter.dev/ui/widgets/animation
// les203 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37145108#overview

class MealDetailsScreen extends ConsumerWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);
    final isFavorite = favoriteMeals.contains(meal);

    return Scaffold(
        appBar: AppBar(title: Text(meal.title), actions: [
          IconButton(
            onPressed: () {
              final wasAdded = ref.read(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(wasAdded ? 'Meal added as a favorite.' : 'Meal removed.')),
              );
            },
            // AnimatedSwitcher - animated transition from one widget to anoter
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    // turns: animation,
                    turns: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.airplay, // star_border
                  // key for Flutter will therefore see that something changed here
                  key: ValueKey(isFavorite), // and will then tregger this animation (AnimatedSwitcher)
                )),
          )
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // multi screen transitions / animations (Hero)
              Hero(
                  tag: meal.id,
                  child: Image.network(
                    meal.imageUrl,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(height: 14),
              Text('Ingredients',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              for (final ingredient in meal.ingredients)
                Text(ingredient,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onSurface)),
              const SizedBox(height: 24),
              Text('Steps',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              for (final step in meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Text(step,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Theme.of(context).colorScheme.onSurface)),
                ),
            ],
          ),
        ));
  }
}
