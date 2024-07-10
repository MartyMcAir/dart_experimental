// https://www.youtube.com/watch?v=akxboSMzhhc
// Flutter BLoC Rebuild Stateless Widgets | Code Given
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocListApp());
}

class BlocListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc list title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocListPage(),
    );
  }
}

class BlocListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocList()..add(LoadInitialBlocListData()),
      child: BlocListPageContext(),
    );
  }
}

class BlocListPageContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title from page context'),
        ),
        body: BlocBuilder<BlocList, BlocListState>(builder: (context, state) {
          if (state is InitialBlocListState) {
            print("initial state");
            return Center(child: CircularProgressIndicator());
          } else if (state is DataBlocListLoaded) {
            print("DataLoaded state");
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(state.data[index]));
              },
            );
          } else {
            // Добавлен дефолтный возврат, чтобы избежать ошибки
            return SizedBox.shrink();
          }
        }));
  }
}

// ---------------------------

class BlocList extends Bloc<BlocListEvent, BlocListState> {
  // BlocList(super.initialState);
  BlocList() : super(InitialBlocListState()) {
    on<LoadInitialBlocListData>((event, emit) {
      // simulate some loading data
      final data = ['item 1', 'item 2', 'item 3'];
      emit(DataBlocListLoaded(data));
    });
  }
}

// ---------------------------
abstract class BlocListEvent {}

abstract class BlocListState {}

class LoadInitialBlocListData extends BlocListEvent {}

class InitialBlocListState extends BlocListState {}

class DataBlocListLoaded extends BlocListState {
  final List<String> data;
  DataBlocListLoaded(this.data);
}
