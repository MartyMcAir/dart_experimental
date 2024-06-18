part of 'job_bloc.dart';

// https://www.youtube.com/watch?v=33DYnEfh0ng&list=PLwT4VxCiStYTa60yGDebJoZV0lQ6eKfuk&index=2
// вообщем как понял (не уверен что полностью но)
// смысл copyWith в возможности копировать имеющийся объект
// изменяя тлько часть его полей при необъодимости

// @immutable
// abstract class JobState {}

// class JobInitial extends JobState {}

// class JobLoadedState extends JobState {
//   final List<Job> jobsList;

//   JobLoadedState(this.jobsList);
// }

// class JobLoadingState extends JobState {}
class JobState2 {
  final List<Salary> salaryList;
  final List<Responsibillities> responsibillitiesList;
  final bool isLoading;

  const JobState2(
      // если данных не будет, то по умолчанию прийдет пустой массив
      {this.salaryList = const [],
      this.responsibillitiesList = const [],
      this.isLoading = false});

  JobState2 copyWith({
    // ? - все поля наллабл, не обязательные
    List<Salary>? salaryList,
    List<Responsibillities>? responsibillitiesList,
    bool isLoading = false,
  }) {
    return JobState2(
      // в случае не прихода, возьмуется старое значение из JobState
      salaryList: salaryList ?? this.salaryList,
      responsibillitiesList:
          responsibillitiesList ?? this.responsibillitiesList,
      // isLoading возврщаем как есть тк обязательный с значением по умолчанию
      isLoading: this.isLoading,
    );
  }
}

class Salary {
  final bool isOffcial;
  final String size;

  Salary({required this.isOffcial, required this.size});
}

class Responsibillities {
  final String difficult;
  final String priority;

  Responsibillities({required this.priority, required this.difficult});
}
