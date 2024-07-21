import 'package:bloc/bloc.dart';

// CounterCubit - управляет состоянием счетчика и имеет методы increment и decrement для изменения состояния.
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
