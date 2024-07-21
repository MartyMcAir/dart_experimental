import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import '../../bloc/experimental/a1_bloc_counter_lite/bloc/counter_bloc.dart';
import 'config_reader.dart';
import 'job_bloc/job_bloc.dart';
import 'user_bloc/user_bloc.dart';

// https://www.youtube.com/watch?v=33DYnEfh0ng&list=PLwT4VxCiStYTa60yGDebJoZV0lQ6eKfuk&index=2
// MultiBlocProvider - когда необходимо разместить и обработать несколько блоков на одном экране
// еще варианты: 1 создать один общий common bloc (view model bloc) содержащий другие блоки
// 2 создать Redux Store общий для всех блоков который будет правлять State's для любого экрана
// 3 плохой вариант создавать 100500+ блоков которые, будут как-то между собой взаимодействовать без "общей точки сбора"
// в конечном итоге что где происходит и как это работает будет понять крайне не просто если вообще возможно

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LogConfig.init();
  // ставим await, что бы перед запуском app дождались подгрузки конфига
  runApp(const MyAppCounter2());
}

class MyAppCounter2 extends StatelessWidget {
  const MyAppCounter2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyBlocCounter2(),
    );
  }
}

class MyBlocCounter2 extends StatelessWidget {
  const MyBlocCounter2({super.key});
  final double buttonSize = 66;
  static final Logger logger = LogConfig.logger;

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
