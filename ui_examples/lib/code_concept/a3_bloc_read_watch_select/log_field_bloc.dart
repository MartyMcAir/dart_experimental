// Блок для управления состоянием логов
import 'package:flutter_bloc/flutter_bloc.dart';

class LogBloc extends Bloc<LogEvent, String> {
  LogBloc() : super("empty field") {
    on<UpdLogEvent>(_onUpdLog);
    on<ClearLogEvent>(_onClearLog);
  }

  void _onUpdLog(UpdLogEvent event, Emitter<String> emit) {
    // emit(state);
    emit(event.log);
  }

  void _onClearLog(ClearLogEvent event, Emitter<String> emit) {
    emit("");
  }
}

abstract class LogEvent {}

class UpdLogEvent extends LogEvent {
  final String log;
  UpdLogEvent(this.log);
}

class ClearLogEvent extends LogEvent {}
