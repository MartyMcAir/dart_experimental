import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

// les188 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37144826#overview

class FovoriteMealsNotifier extends StateNotifier<List<Meal>> {
  // FovoriteMealsNotifier(super.state);
  FovoriteMealsNotifier() : super([]);

  bool toggleMealsFovoriteStatus(Meal meal) {
    // in StateNotifier provider -> you're not allowed to edit an existing value in memory,
    // insead you must always create a new one
    // That's simply a pattern enforce by this package (because it immutable)
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      // where - return a new list
      state = state.where((m) => m.id != meal.id).toList();
      return false; // was removed
    } else {
      // set a new list, where I simply wanna keep all the existing items but tthen also add a new one
      state = [...state, meal]; // ... - using spread operator
      return true; // if it was added
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FovoriteMealsNotifier, List<Meal>>((ref) {
  return FovoriteMealsNotifier();
});
