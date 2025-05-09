import 'package:flutter_riverpod/flutter_riverpod.dart';

// les191 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37144834#overview

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive; // not allowed! => mutating state
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> shosenFilters) {
    state = shosenFilters;
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) => FiltersNotifier());
