import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// https://www.youtube.com/watch?v=A1k-yybG3Iw&list=PLY8G5DMG6TiNzT01O1gdRC_7poo04avz-&index=2

void main() {
  // Стор основной источник данных для приложения
  // reducer функция изменяющая состояние
  // - которая реагирует на определенный Action (в нашем случае это AddAction)
  final Store<int> store = Store(reducer, initialState: 0);
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
    final Store<int> store = StoreProvider.of(context);
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
        child: StoreConnector<int, int>(
          converter: (store) => store.state,
          builder: (context, state) => Text(
            state.toString(), // Тут заносим значение из обновленного состояния
            style: TextStyle(fontSize: 35),
          ),
        ),
      ),
    );
  }
}

class AddAction {}

int reducer(int state, dynamic action) {
  // тут мы проверяем какой именно экшон произошел,
  // и в соответствии с этим что делать _ те можно и на switch() поменять
  // или множить кол-во if'ов
  if (action is AddAction) {
    return state + 1;
  } else {
    return state;
  }
}
