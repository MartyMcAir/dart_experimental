import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  JobBloc() : super(JobInitial()) {
    on<JobGetEvent>(_onGetJob);
  }

  _onGetJob(JobGetEvent event, Emitter<JobState> emit) async {
    emit(JobLoadingState());
    // эмитируем задержку с сервера
    await Future.delayed(const Duration(seconds: 2));
    List<Job> jobsList = getJobs(event);
    emit(JobLoadedState(jobsList));
  }

  List<Job> getJobs(JobGetEvent event) {
    final jobsList = List.generate(
        event.count * 2,
        (index) => Job(
            name: '# ${index.toString()} and job name', id: index.toString()));
    return jobsList;
  }
}
