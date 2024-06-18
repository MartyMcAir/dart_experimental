part of 'job_bloc.dart';

@immutable
abstract class JobState {}

class JobInitial extends JobState {}

class JobLoadedState extends JobState {
  final List<Job> jobsList;

  JobLoadedState(this.jobsList);
}

class JobLoadingState extends JobState {}

class Job {
  final String name;
  final String id;

  Job({required this.name, required this.id});
}
