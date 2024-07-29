import 'package:bloc/bloc.dart';

import 'mix_counter_event.dart';
import 'mix_counter_state.dart';

class MixCounterBloc extends Bloc<MixCounterEvent, MixCounterState> {
  MixCounterBloc()
      : super(MixCounterState(counter: 0, message: 'Initial message')) {
    on<Increment>((event, emit) {
      emit(MixCounterState(counter: state.counter + 1, message: state.message));
    });
    on<ChangeMessage>((event, emit) {
      emit(MixCounterState(counter: state.counter, message: 'Message changed'));
    });
    on<Reset>((event, emit) {
      emit(MixCounterState(counter: 0, message: 'Initial message'));
    });
  }
}
