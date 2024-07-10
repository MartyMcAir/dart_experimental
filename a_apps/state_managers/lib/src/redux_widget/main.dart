import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'model/drink.dart';
import 'redux/drink_reducer.dart';
import 'redux/screen.dart';
import 'redux/app_state.dart';

// https://www.youtube.com/watch?v=60_2HlagOzg

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Store<AppState3> _store = Store<AppState3>(
    updateDrinksReducer,
    initialState: AppState3(
      drinks: [
        Drink("Water", false),
        Drink("Cuba Libre", false),
        Drink("Pina Colada", false),
        Drink("Havana Cola", false)
      ],
    ),
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Redux solution - Flutter Explained',
      theme: ThemeData.light().copyWith(primaryColor: Color(0xFFe13133)),
      home: StoreProvider<AppState3>(
        store: _store,
        child: ReduxScreen(),
      ),
    );
  }
}
