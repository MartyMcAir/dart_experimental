part of 'user_bloc.dart';

// наследуется от общего стейта всеъх стейтов в Dart
// sealed class UserState extends Equatable {
//   const UserState();

//   @override
//   List<Object> get props => [];
// }

// final class UserInitial extends UserState {}

// после 13ой минуты видео тут все удалют ради демонстрации copyWith();

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadedState extends UserState {
  final List<User> usersList;

  UserLoadedState(this.usersList);
}

class UserLoadingState extends UserState {}

class User {
  final String name;
  final String id;

  User({required this.name, required this.id});
}
