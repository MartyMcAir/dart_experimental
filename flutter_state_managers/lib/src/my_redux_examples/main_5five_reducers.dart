import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'redux_five_thunk/actions.dart';
import 'redux_five_thunk/app_state.dart';
import 'redux_five_thunk/reducers.dart';

// https://www.youtube.com/watch?v=Uk0xUAr5IW4&list=PLY8G5DMG6TiNzT01O1gdRC_7poo04avz-&index=6
// Redux Thunk

void main() {
  // Стор основной источник данных для приложения
  // reducer функция изменяющая состояние
  // - которая реагирует на определенный Action (в нашем случае это AddAction)
  final Store<AppState> store = Store(reducer,
      // middleware: [loaderMiddleware], // middleware! _ LINE DELETED
      initialState: AppState(
        counter: 0,
        text: "init",
        widget: Icon(Icons.image),
      ));
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
      // Тут БЫЛ кнопка floatingActionButton (плюсик)
      body: Center(
        // Через StoreConnector
        // (который содержится в классе _Counter а тот в StoreProvider)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // выравниваем колонку
          children: [
// -----------------------------------------------------
// Тут для Middleware
// 4ая минута https://www.youtube.com/watch?v=a30Lx4Zr6rU&list=PLY8G5DMG6TiNzT01O1gdRC_7poo04avz-&index=5
            Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.all(16),
                child: StoreConnector<AppState, AppState>(
                  converter: (store) => store.state,
                  builder: (context, vm) => vm.widget,
                )),
            ElevatedButton(
              // onPressed: () => store.dispatch(GetImageAction()), DELETED
              onPressed: () => store.dispatch(loadImageThunkAction(store)),
              child: Text("Get image"),
            ),
// -----------------------------------------------------
            Container(
              width: 200, // ограничиваем разрмер контейнера для текстового поля
              child: TextField(
                // при изменении поля заносим это value
                onChanged: (value) => inputText = value,
              ),
            ),

            // следующие 2а Text() будут находится под input полем
            SizedBox(width: 80), // SizedBox используется для красоты в верстке
            // при onPressed будет занос значения из input Поля
            // в следующее Text() что ниже
            // Это кнопка заноса текста Set его в.. store через dispatch
            // ___ ElevatedButton красивее TextButton
            Row(
              // выравнивание по центру
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () =>
                        store.dispatch(SetTextAction(text: inputText)),
                    child: Text("SET")),
                SizedBox(width: 80), // SizedBox для красоты в верстке
                ElevatedButton(
                    onPressed: () => store.dispatch(ResetTextAction()),
                    child: Text("RESET")),
                SizedBox(width: 20), // SizedBox для красоты в верстке
                ElevatedButton(
                    onPressed: () => store.dispatch(FreezeAction()),
                    child: Text("FREEZE")),
              ],
            ),
            StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                // builder соберет нам новое состояние из модели что выше
                // те из converter ..
                builder: (context, vm) => Text(vm.text)),
            SizedBox(width: 80), // SizedBox используется для красоты в верстке
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
            // Row хранящие FloatActionButton кнопка справа плюсик (Icons.add)
            Row(
              // выравнивание по центру
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => store.dispatch(addAsyncThunkAction(store)),
                    child: Text("AsyncAdd _ dont work xz why!?")),
                SizedBox(width: 20), // SizedBox для красоты в верстке
                FloatingActionButton(
                  onPressed: () => store.dispatch(AddAction()),
                  // при нажатии в обработчик Стора отправляется конкретный экшон AddAction()
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 80), // SizedBox для красоты в верстке
                FloatingActionButton(
                  // по аналогии для кнопки "минус"
                  onPressed: () => store.dispatch(RemoveAction()),
                  child: Icon(Icons.remove),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
