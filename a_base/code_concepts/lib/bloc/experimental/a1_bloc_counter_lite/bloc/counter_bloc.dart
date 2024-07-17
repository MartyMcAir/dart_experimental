import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  // 5 - первоночальное значение инициализации по умолчанию
  CounterBloc() : super(5) {
    on<CounterIncrementEvent>(_onIncrement); // в () принимает callback функцию
    on<CounterDecrementEvent>(_onDecrement);
    on<CounterClearEvent>(_onClear);
  }

  _onIncrement(CounterIncrementEvent event, Emitter<int> emit) {
    emit(state + 1);
  }

  _onDecrement(CounterDecrementEvent event, Emitter<int> emit) {
    if (state <= 0) return; // тогда выходим
    emit(state - 1);
  }

  _onClear(CounterClearEvent event, Emitter<int> emit) {
    emit(0);
  }
}

abstract class CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

class CounterClearEvent extends CounterEvent {}
