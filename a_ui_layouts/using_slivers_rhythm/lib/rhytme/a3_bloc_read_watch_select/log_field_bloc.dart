// Блок для управления состоянием логов
import 'package:flutter_bloc/flutter_bloc.dart';

class LogBloc extends Bloc<LogEvent, String> {
  LogBloc() : super("empty field") {
    on<UpdLogEvent>(_onUpdLog);
    on<ClearLogEvent>(_onClearLog);
  }

  _onUpdLog(UpdLogEvent event, Emitter<String> emit) {
    emit(state);
  }

  _onClearLog(ClearLogEvent event, Emitter<String> emit) {
    emit("");
  }
}

abstract class LogEvent {}

class UpdLogEvent extends LogEvent {}

class ClearLogEvent extends LogEvent {}
