import 'package:state_managers/src/my_redux_examples/redux_three/app_state.dart';
import 'package:redux/redux.dart';

import 'actions.dart';

// https://www.youtube.com/watch?v=REE6y2DJKEc&list=PLY8G5DMG6TiNzT01O1gdRC_7poo04avz-&index=4
// до 5ой минуты одна функция reducer() с ветвлениями
// на класс AppState содержащий несколько состояний

// AppState reducer(AppState state, dynamic action) {
//   // тут мы проверяем какой именно экшон произошел,
//   // и в соответствии с этим что делать _ те можно и на switch() поменять
//   // или множить кол-во if'ов
//   if (action is AddAction) {
//     return AppState(counter: state.counter + 1, text: state.text);
//   } else if (action is RemoveAction) {
//     return AppState(counter: state.counter - 1, text: state.text);
//   } else if (action is SetTextAction) {
//     // ветвление для заноса текста при экшоне SetTextAction
//     return AppState(counter: state.counter, text: action.text);
//   } else if (action is ResetTextAction) {
//     // заносим пустую строку
//     return AppState(counter: state.counter, text: "");
//   } else {
//     return state;
//   }
// }

// -----------------------------------------------------------------
// после 5ой минуты
// AppState reducer(AppState state, dynamic action) => AppState(
//     counter: _counterReducer(state, action), text: _textReducer(state, action));

// int _counterReducer(AppState state, dynamic action) {
//   if (action is AddAction) {
//     return state.counter + 1;
//   } else if (action is RemoveAction) {
//     return state.counter - 1;
//   } else
//     return state.counter;
// }

// String _textReducer(AppState state, dynamic action) {
//   if (action is SetTextAction) {
//     // ветвление для заноса текста при экшоне SetTextAction
//     return action.text;
//   } else if (action is ResetTextAction) {
//     // заносим пустую строку
//     return "";
//   } else {
//     return state.text;
//   }
// }

// -----------------------------------------------------------------
// после 8ой минуты
AppState reducer(AppState state, dynamic action) => AppState(
    counter: _counterReducer(state.counter, action),
    text: _textReducer(state.text, action));

Reducer<String> _textReducer = combineReducers([
  TypedReducer<String, SetTextAction>(_setTextReducer),
  TypedReducer<String, ResetTextAction>(_resetTextReducer),
]);
Reducer<int> _counterReducer = combineReducers([
  TypedReducer<int, AddAction>(_addCounterReducer),
  TypedReducer<int, RemoveAction>(_removeCounterReducer),
]);

int _addCounterReducer(int count, AddAction action) => count + 1;
int _removeCounterReducer(int count, RemoveAction action) => count - 1;
String _setTextReducer(String text, SetTextAction action) => action.text;
String _resetTextReducer(String text, ResetTextAction action) => "";


// -----------------------------------------------------------------
// с файлика redux библиотеки utils.dart
/// final Reducer<AppState> appReducer = combineReducers([
///   new TypedReducer<AppState, AddItemAction>(addItemReducer),
///   new TypedReducer<AppState, RemoveItemAction>(removeItemReducer),
///   new TypedReducer<AppState, ReverseItemAction>(reverseItemsReducer),
/// ]);