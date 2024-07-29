// Определение событий для CounterBloc
abstract class ContextEvent {}

class Increment extends ContextEvent {}

class ChangeMessage extends ContextEvent {}

class Reset extends ContextEvent {}
