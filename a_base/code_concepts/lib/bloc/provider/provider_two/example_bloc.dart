import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleBloc extends Bloc<BlocBaseEvent, BlocBaseState> {
  ExampleBloc() : super(BlocInitialState()) {
    on<BlocSomeEvent>(_onMethodForEvent);
  }

  _onMethodForEvent(BlocSomeEvent event, Emitter<BlocBaseState> emit) async {
    await doSomeThingForEventInAnoterClass();
    emit(NameSomeForEmitState());
  }

  doSomeThingForEventInAnoterClass() {
    print("event from method doSomeThingForEventInAnoterClass");
  }
}

// ------------------------------------------------------

abstract class BlocBaseEvent {}

class BlocSomeEvent extends BlocBaseEvent {}

abstract class BlocBaseState {}

class BlocInitialState extends BlocBaseState {}

class NameSomeForEmitState extends BlocBaseState {}
