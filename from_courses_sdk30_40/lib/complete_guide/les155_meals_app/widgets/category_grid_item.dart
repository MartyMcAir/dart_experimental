import 'package:flutter/material.dart';

import '../models/category.dart';

// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37143964#overview
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category, required this.onSelectCategory});

  final Category category;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    // return GestureDetector( onTap: (){}, // if when fedback don't needed
    return InkWell(
      // InkWell - for get feed back
      onTap: onSelectCategory, // tappable
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        // use Container - because it geves a-lot of options for settings..
        // .. background color /decoration etc..
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface, // instead onBackground
              ),
        ),
      ),
    );
  }
}
