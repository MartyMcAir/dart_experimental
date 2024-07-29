import 'package:bloc/bloc.dart';

import 'bloc_provider_event.dart';
import 'bloc_provider_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increment>((event, emit) {
      emit(CounterState(state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(CounterState(state.counter - 1));
    });
    on<Reset>((event, emit) {
      emit(CounterState(0));
    });
  }
}
