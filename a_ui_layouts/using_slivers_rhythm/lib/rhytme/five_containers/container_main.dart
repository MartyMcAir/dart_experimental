import 'package:flutter/material.dart';

void main() {
  runApp(const FiveContainersApp());
}

// https://www.youtube.com/watch?v=wHA4DiaK2B8
class FiveContainersApp extends StatelessWidget {
  const FiveContainersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Radial App Demo",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const FiveContainersPage(),
    );
  }
}

class FiveContainersPage extends StatefulWidget {
  const FiveContainersPage({super.key});

  @override
  State<StatefulWidget> createState() => _FiveContainersState();
}

class _FiveContainersState extends State<FiveContainersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REUSABLE CARD'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableCard(customColor: Color(0xFF1D1E33))),
              Expanded(child: ReusableCard(customColor: Color(0xFF1D1E33))),
            ],
          )),
          Expanded(child: ReusableCard(customColor: Colors.purple)),
          Expanded(
            child: Row(children: [
              Expanded(child: ReusableCard(customColor: Color(0xFF1D1E33))),
              Expanded(child: ReusableCard(customColor: Color(0xFF1D1E33))),
            ]),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color customColor;

  const ReusableCard({
    super.key,
    required this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: customColor, borderRadius: BorderRadius.circular(10)),
    );
  }
}
