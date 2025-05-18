import 'package:flutter/material.dart';

void main() => runApp(const ScreenWidget());

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Widget'),
        ),
        body: const ListViewCustomWidget(),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      // reverse: true,
      // controller: ScrollController(initialScrollOffset: 100),
      // physics: NeverScrollableScrollPhysics(),
      // padding: EdgeInsets.all(20),
      children: const <Widget>[
        TextWidget(text: "1"),
        TextWidget(text: "2"),
        TextWidget(text: "3"),
        TextWidget(text: "4"),
        TextWidget(text: "5"),
        TextWidget(text: "6"),
        TextWidget(text: "7"),
        TextWidget(text: "8"),
        TextWidget(text: "9"),
        TextWidget(text: "10"),
      ],
    );
  }
}

class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: 20,
        itemBuilder: (context, index) {
      return TextWidget(text: '$index');
    });
  }
}

class ListViewSeparatedWidget extends StatelessWidget {
  const ListViewSeparatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return TextWidget(text: "$index");
        },
        separatorBuilder: (context, index) {
          return const Divider(color: Colors.black);
        },
        itemCount: 20);
  }
}

class ListViewCustomWidget extends StatelessWidget {
  const ListViewCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.custom(childrenDelegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return TextWidget(text: "$index");
    }));
  }
}
