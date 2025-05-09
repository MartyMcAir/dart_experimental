import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dummy_data.dart';

// les187 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37144822#overview

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
