import 'package:redux/redux.dart';

import 'actions.dart';
import 'app_state.dart';

// ПО итогам с thunk _
// Middleware файл вообще удалили

void loaderMiddleware(
    Store<AppState> store, dynamic action, NextDispatcher nextDispatcher) {
  if (action is GetImageAction) {
    // _loadImage(
    //         "https://i.kym-cdn.com/photos/images/original/000/138/246/tumblr_lltzgnHi5F1qzib3wo1_400.jpg")
    //     .then((image) => store.dispatch(LoadedImageAction(image)));
  }

  nextDispatcher(action);
}

// Тут было Future<Widget> _loadImage(String url) async {
// пренесли в actions.dart
