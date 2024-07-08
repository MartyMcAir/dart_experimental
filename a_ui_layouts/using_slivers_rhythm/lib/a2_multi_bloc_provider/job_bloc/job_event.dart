part of 'job_bloc.dart';

@immutable
abstract class JobEvent {}

class JobGetEvent extends JobEvent {
  final int count;

  JobGetEvent(this.count);
}
