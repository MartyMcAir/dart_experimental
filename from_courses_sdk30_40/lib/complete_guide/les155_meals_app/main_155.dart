import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './screens/tabs.dart';
// import 'screen/categories.dart';
// import './data/dummy_data.dart';
// import './screen/meals.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
      // home: const CategoriesScreen(),
      // home: const MealsScreen( // for Test MealsScreen
      //   title: 'Some category..',
      //   // meals: [], // for test if empty, them expect = 'Uh oh ... nothing here!'
      //   meals: dummyMeals,
      // ),
    );
  }
}
