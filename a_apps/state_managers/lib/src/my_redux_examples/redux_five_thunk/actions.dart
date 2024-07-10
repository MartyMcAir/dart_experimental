import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AddAction {}

class AddActionAsync {
  final int count;

  AddActionAsync(this.count);
}

class RemoveAction {}

class SetTextAction {
  final String text;
  // required - связанно с nullSafe'ty
  SetTextAction({required this.text});
}

class ResetTextAction {}

class FreezeAction {}

class GetImageAction {}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);
}

// ---------------------------------------------------------------

// Цикл ассинхронный
ThunkAction addAsyncThunkAction = (Store store) async {
// будет тоже фризить устройство, так как сам по себе dart в одном потоке
// 7яминута https://www.youtube.com/watch?v=Uk0xUAr5IW4&list=PLY8G5DMG6TiNzT01O1gdRC_7poo04avz-&index=7
// И что бы это обойти, необходимо использовать изолятор для тяжелых вычислительных операций

  Future<int>(() async {
    int count = 0;
    for (int i = 0; i < 100; ++i) {
      count++;
    }
    return count;
  }).then((value) => store.dispatch(AddActionAsync(value)));

  // С использованием изолятора
  // compute(calcAsync, 200)
  //     .then((value) => store.dispatch(AddActionAsync(value)));
};

Future<int> calcAsync(int count) async {
  print("1");
  int result = 0;
  for (int i = 0; i < count; ++i) {
    result++;
    print("2");
  }
  print("3");
  return result;
}

// ----------
// ----------
// ----------
ThunkAction loadImageThunkAction = (Store store) async {
  store.dispatch(GetImageAction());
  _loadImage(
          "https://i.kym-cdn.com/photos/images/original/000/138/246/tumblr_lltzgnHi5F1qzib3wo1_400.jpg")
      .then((image) => store.dispatch(LoadedImageAction(image)));
};

// Future - это функция которая выполняется ассинхронно и возвращает результат своей работы
Future<Widget> _loadImage(String url) async {
  await Future.delayed(Duration(seconds: 3)); // эмитация ожидания 3 сек

  var myVariable = Image.network(url);
  try {
    myVariable = Image.network(url);
  } catch (e) {
    print("ошибка $e");
  }
  return myVariable;
}
