import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetUsersEvent>(_onGetUser);
  }

  _onGetUser(UserGetUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());
    // эмитируем задержку с сервера
    await Future.delayed(const Duration(seconds: 1));
    List<User> usersList = getUsers(event);
    emit(UserLoadedState(usersList));
  }

  List<User> getUsers(UserGetUsersEvent event) {
    final usersList = List.generate(
        event.count,
        (index) => User(
            name: '# ${index.toString()} and usr name', id: index.toString()));
    return usersList;
  }
}
