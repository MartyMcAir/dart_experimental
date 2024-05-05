import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';

void loaderMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher nextDispatcher) {
  if (action is GetImageAction) {
    _loadImage(
            "https://i.kym-cdn.com/photos/images/original/000/138/246/tumblr_lltzgnHi5F1qzib3wo1_400.jpg")
        .then((image) => store.dispatch(LoadedImageAction(image)));
  }

  nextDispatcher(action);
}

// Future - это функция которая выполняется ассинхронно и возвращает результат своей работы
Future<Widget> _loadImage(String url) async {
  await Future.delayed(Duration(seconds: 3)); // эмитация ожидания 3 сек
  return Image.network(url);
}
