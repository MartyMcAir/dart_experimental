import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';
import '../widgets/meal_iterm_trait.dart';

// https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37143984#overview
class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      // Stack by default ignores the shape from the Card
      clipBehavior: Clip.hardEdge, // Clip.hardEdge - fixed it
      elevation: 2,
      child: InkWell(
        // using InkWell for tappable
        onTap: () {
          onSelectMeal(context, meal);
        },
        child: Stack(
          children: [
            // image not popping in - which can quite ugly, but it's smoothly faded in
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54, // black54 - transparent
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis, // for Very long text..
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // MealItermTrait work withOuth Expanded - Because we use Positioned
                        // https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37143988#overview - 5min
                        MealItermTrait(icon: Icons.schedule, label: '${meal.duration} min'),
                        const SizedBox(width: 12),
                        MealItermTrait(icon: Icons.woman, label: complexityText),
                        const SizedBox(width: 12),
                        MealItermTrait(icon: Icons.money, label: affordabilityText),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
