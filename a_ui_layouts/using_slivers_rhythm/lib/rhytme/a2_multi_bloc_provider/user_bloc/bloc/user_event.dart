part of 'user_bloc.dart';

// sealed class UserEvent extends Equatable {
//   const UserEvent();

//   @override
//   List<Object> get props => [];
// }

@immutable
abstract class UserEvent {}

class UserGetUsersEvent extends UserEvent {
  final int count;

  UserGetUsersEvent(this.count);
}
