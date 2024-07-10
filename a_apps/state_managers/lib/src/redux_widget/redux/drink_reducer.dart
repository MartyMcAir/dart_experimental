import 'drink_action.dart';
import 'app_state.dart';

AppState3 updateDrinksReducer(AppState3 state, dynamic action) {
  if (action is UpdateDrinkAction) {
    // duplicate it _ in screen bater
    // action.updatedDrink.selected = !action.updatedDrink.selected;

    return AppState3(
        drinks: state.drinks
            .map(
              (drink) => drink.name == action.updatedDrink.name
                  ? action.updatedDrink
                  : drink,
            )
            .toList());
  }

  return state;
}
