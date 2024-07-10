import 'actions.dart';
import 'app_state.dart';

AppState reducer(AppState state, dynamic action) {
  // тут мы проверяем какой именно экшон произошел,
  // и в соответствии с этим что делать _ те можно и на switch() поменять
  // или множить кол-во if'ов
  if (action is AddAction) {
    return AppState(counter: state.counter + 1, text: state.text);
  } else if (action is SetTextAction) {
    // ветвление для заноса текста при экшоне SetTextAction
    return AppState(counter: state.counter, text: action.text);
  } else {
    return state;
  }
}
