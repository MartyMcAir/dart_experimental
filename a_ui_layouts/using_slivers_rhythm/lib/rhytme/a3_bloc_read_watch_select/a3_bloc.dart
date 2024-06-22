// context.read() - при поступлении новых данных, перерисовки UI не происходит
// используется для: получения значения из провайдера, БЕЗ подписки на его изменения
// плюсы: получение данных не вызывая перестроение виджета при изменении этих данных

// context.watch() - перерисовка всего UI при любых изменениях
// используется для: получения значения из провайдера, C подпиской на его изменения
// плюсы: их нет, просто обновляет весь UI при любых изменениях провайдера

// context.select() - перерисовка UI части виджета, при определнных изменениях данных
// используется для: получения части данных из провайдера,
//      подписываясь только на оперделенные изменения конкретной части
// плюсы: когда виджет зависит, только от определнной части данных,
//      и подписываясь только на эту часть данных провайдера,
//      тогда только при их изменении будет перестраиваться нужный виджет

// https://www.youtube.com/watch?v=Sunwo30Q_68 - не понял примеры не оч наглядно

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:using_slivers_rhythm/rhytme/a1_bloc_counter_lite/bloc/counter_bloc.dart';
import '../a2_multi_bloc_provider/job_bloc/job_bloc.dart';
import '../a2_multi_bloc_provider/user_bloc/user_bloc.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(const MyAppCounter2());
}

class MyAppCounter2 extends StatelessWidget {
  const MyAppCounter2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyBlocCounter2(),
    );
  }
}

class MyBlocCounter2 extends StatelessWidget {
  MyBlocCounter2({super.key});
  final double buttonSize = 66;
  final Logger logger = Logger();

  @override
  Widget build(BuildContext context) {
    logger.i('This is a build -----------------------------------------');

    final CounterBloc counterBloc = CounterBloc()..add(CounterDecrementEvent());
    final UserBloc userBloc = UserBloc();
    final JobBloc jobBloc = JobBloc();

    return MultiBlocProvider(
      providers: [
        // PROVIDER ONE -----------------------------------
        BlocProvider<CounterBloc>(
          create: (context) => counterBloc,
        ),
        // PROVIDER TWO -----------------------------------
        BlocProvider<UserBloc>(
          create: (context) => userBloc,
        ),
        // PROVIDER THREE -----------------------------------
        BlocProvider<JobBloc>(
          create: (context) => jobBloc,
        ),
      ],
      child: Scaffold(
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getIncrementButton(counterBloc),
            getDecrementButton(counterBloc),
            getUserButton(userBloc, counterBloc),
            getJobButton(jobBloc, counterBloc)
          ],
        ),
        // SafeArea чтоб контент не выпал за границы экрана (!?)
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                counterChildren(counterBloc),
                userChildren(userBloc),
                jobChildren(jobBloc),
              ],
            ),
          ),
        ),
      ),
    );
  }

// --- BLOCS - CHILDRENS ---------------------------------------------------

  BlocBuilder<JobBloc, JobState> jobChildren(JobBloc jobBloc) {
    logger.i('This is a jobChildren -----------------------------------------');
    return BlocBuilder<JobBloc, JobState>(
      bloc: jobBloc,
      builder: (context, state) {
        return Column(
          children: [
            if (state is JobLoadingState) const CircularProgressIndicator(),
            if (state is JobLoadedState)
              ...state.jobsList.map((e) => Text(e.name)),
          ],
        );
      },
    );
  }

  BlocBuilder<UserBloc, UserState> userChildren(UserBloc userBloc) {
    logger
        .i('This is a userChildren -----------------------------------------');
    return BlocBuilder<UserBloc, UserState>(
      bloc: userBloc,
      builder: (context, state) {
        return Column(
          children: [
            if (state is UserLoadingState) const CircularProgressIndicator(),
            if (state is UserLoadedState)
              ...state.usersList.map((e) => Text(e.name)),
          ],
        );
      },
    );
  }

  BlocBuilder<CounterBloc, int> counterChildren(CounterBloc counterBloc) {
    logger.i(
        'This is a counterChildren -----------------------------------------');
    return BlocBuilder<CounterBloc, int>(
      bloc: counterBloc,
      builder: (context, state) {
        return Text(state.toString(), style: const TextStyle(fontSize: 33));
      },
    );
  }

// ---------------- BUTTONS ----------------------------------------------------

  IconButton getJobButton(JobBloc jobBloc, CounterBloc counterBloc) {
    logger
        .i('This is a getJobButton -----------------------------------------');
    return IconButton(
      onPressed: () {
        jobBloc.add(JobGetEvent(counterBloc.state));
      },
      icon: Icon(Icons.work, size: buttonSize),
    );
  }

  IconButton getUserButton(UserBloc userBloc, CounterBloc counterBloc) {
    logger
        .i('This is a getUserButton -----------------------------------------');
    return IconButton(
      onPressed: () {
        // закидуем int с CounterBloc'a в блок юзеров
        // те будем генерить столько пользаков скок цифра на счетчике
        userBloc.add(UserGetUsersEvent(counterBloc.state));
      },
      icon: Icon(Icons.person, size: buttonSize),
    );
  }

  IconButton getDecrementButton(CounterBloc counterBloc) {
    logger.i(
        'This is a getDecrementButton -----------------------------------------');
    return IconButton(
      onPressed: () {
        counterBloc.add(CounterDecrementEvent());
      },
      icon: Icon(Icons.exposure_minus_1, size: buttonSize),
    );
  }

  IconButton getIncrementButton(CounterBloc counterBloc) {
    logger.i(
        'This is a getIncrementButton -----------------------------------------');
    return IconButton(
      onPressed: () {
        counterBloc.add(CounterIncrementEvent());
      },
      icon: Icon(Icons.plus_one, size: buttonSize),
    );
  }
}
