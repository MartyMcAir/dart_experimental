import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'redux_two/actions.dart';
import 'redux_two/app_state.dart';
import 'redux_two/reducers.dart';

// https://www.youtube.com/watch?v=5cs5_DJuUOw&list=PLY8G5DMG6TiNzT01O1gdRC_7poo04avz-&index=3
// исходники тут https://github.com/petrovyuri/flutter_redux_tutorial/tree/5d285aceb49cd2ef91466eb9d6eecc487f9a592b
//..
// Еще есть пример использования https://github-com.translate.goog/brianegan/flutter_redux?_x_tr_sl=en&_x_tr_tl=ru&_x_tr_hl=ru&_x_tr_pto=sc

void main() {
  // Стор основной источник данных для приложения
  // reducer функция изменяющая состояние
  // - которая реагирует на определенный Action (в нашем случае это AddAction)
  final Store<AppState> store =
      Store(reducer, initialState: AppState(counter: 0, text: "init"));
  // initialState - начальное дефолтное значение по умолчанию
  // ..

// StoreProvider связующая основа "база"
  runApp(StoreProvider(
    store: store,
    child: MaterialApp(
      home: _Counter(),
    ),
  ));
  // ..
}

class _Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Поле хранилища Store - для доступа к нему изнутри класса
    // где есть элемент кнопки, при нажатии на который,
    // что бы можно было изменить значение состояния при нажатии
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    // Поле для Column что оборачивает StoreConnector
    String inputText = ""; // по умолчанию пустое значение
    //..
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Redux",
        ),
      ),
      // Тут начинается кнопка floatingActionButton (плюсик)
      floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(AddAction()),
        // при нажатии в обработчик Стора отправляется конкретный экшон AddAction()
        child: Icon(Icons.add),
      ),
      body: Center(
        // Через StoreConnector
        // (который содержится в классе _Counter а тот в StoreProvider)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // выравниваем колонку
          children: [
            Container(
              width: 200, // ограничиваем разрмер контейнера для текстового поля
              child: TextField(
                // при изменении поля заносим это value
                onChanged: (value) => inputText = value,
              ),
            ),

            // следующие 2а Text() будут находится под input полем
            SizedBox(height: 20), // SizedBox используется для красоты в верстке
            // при onPressed будет занос значения из input Поля
            // в следующее Text() что ниже
            // Это кнопка заноса текста Set его в.. store через dispatch
            TextButton(
                onPressed: () => store.dispatch(SetTextAction(text: inputText)),
                child: Text("SET")),
            StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                // builder соберет нам новое состояние из модели что выше
                // те из converter ..
                builder: (context, vm) => Text(vm.text)),
            SizedBox(height: 20), // SizedBox используется для красоты в верстке
            //..

            // обычно тут вместо блока StoreConnector идет композициявиджетов
            // но для простоты оставим пока так
            StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) => Text(
                state.counter.toString(),
                // Тут заносим значение из обновленного состояния
                style: TextStyle(fontSize: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
