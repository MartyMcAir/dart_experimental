import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'example_bloc.dart';

void main() {
  runApp(const BlocApp());
}

class BlocApp extends StatelessWidget {
  const BlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ExampleBloc(),
        child: const BlocPage(),
      ),
    );
  }
}

class BlocPage extends StatefulWidget {
  const BlocPage({super.key});

  @override
  State<BlocPage> createState() => BlocPageScreenState();
}

class BlocPageScreenState extends State<BlocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocPageScreenState title'),
      ),
      body: BlocBuilder<ExampleBloc, BlocBaseState>(
        builder: (context, state) {
          if (state is NameSomeForEmitState) {
            print("body in BlocPageScreenState");
          }
          return Column(
            children: <Widget>[
              const Text('Text text above button'),
              ElevatedButton(
                onPressed: () {
                  context.read<ExampleBloc>().add(BlocSomeEvent());
                },
                child: const Text('ElevatedButton 2 title'),
              ),
            ],
          );
        },
      ),
    );
  }
}
