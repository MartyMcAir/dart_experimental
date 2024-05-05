import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_managers/src/redux_widget/redux/app_state.dart';
import 'package:flutter_state_managers/src/redux_widget/redux/drink_action.dart';

import '../constants.dart';
import '../model/drink.dart';
import '../widgets/drinks_widget.dart';

class ReduxScreen extends StatelessWidget {
  final List<Drink> drinks = [
    Drink("Water", false),
    Drink("Cuba Libre", false),
    Drink("Pina Colada", false),
    Drink("Havana Cola", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cocktail Order"),
      ),
      body: Container(
        decoration: kMainBackgroundImage,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: kWhiteBackground,
              // TODO 10: Surround the column with a StoreConnector
              child: StoreConnector<AppState3, List<Drink>>(
                converter: (store) => store.state.drinks,

                // TODO 10.1: convert the state in a List of Drinks
                builder: (context, List<Drink> stateDrinks) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Drinks tonight",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    ...drinks
                        .map(
                          (drink) => DrinksWidget(
                            drink: drink,
                            onChanged: (value) {
                              // TODO 11: Use the StoreProvider.of to dispatch the UpdateDrinkAction
                              drink.selected = !drink.selected;
                              StoreProvider.of<AppState3>(context)
                                  .dispatch(UpdateDrinkAction(drink));
                            },
                          ),
                        )
                        .toList(),
                    Text(
                      "The order is: ",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => ListTile(
                          title: Text(
                            // TODO 12: replace with the state drinks and remove the drinks list from the widget
                            // drinks
                            stateDrinks
                                .where((element) => element.selected)
                                .toList()[index]
                                .name,
                          ),
                        ),
                        itemCount:
                            // drinks
                            stateDrinks
                                .where((element) => element.selected)
                                .length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
