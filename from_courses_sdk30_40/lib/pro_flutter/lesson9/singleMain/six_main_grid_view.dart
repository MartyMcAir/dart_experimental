import 'package:flutter/material.dart';
// import 'package:second_by_studio/four_main_row_column.dart';

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView Widget'),
        ),
        // body: GridViewCustomWidget(),
        // body: GridViewBuilderWidget(),
        // body: GridViewSomeWidget(),
        // body: GridViewExtendsmWidget(),
        body: GridViewCustomWidget(),
      ),
    );
  }
}

class GridViewCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        childrenDelegate: SliverChildListDelegate([
          TextWidget(text: "1"),
          TextWidget(text: "2"),
          TextWidget(text: "3")
        ]));

    childrenDelegate:
    SliverChildBuilderDelegate((context, index) {
      return TextWidget(text: '$index');
    }, childCount: 15);
  }
}

class GridViewExtendsmWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);
    print(queryData.size);

    return Container(
        width: 300,
        color: Colors.greenAccent,
        child: GridView.extent(
          maxCrossAxisExtent: 100,
          children: [
            TextWidget(text: "1"),
            TextWidget(text: "2"),
            TextWidget(text: "3"),
            TextWidget(text: "4"),
            TextWidget(text: "5"),
          ],
        ));
  }
}

class GridViewSomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),

        // scrollDirection: Axis.horizontal,
        // reverse: true,
        // controller: ScrollController(initialScrollOffset: 100),
        // physics: NeverScrollableScrollPhysics(),
        // padding: EdgeInsets.all(20),
        children: <Widget>[
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
        ]);
  }
}

class GridViewBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // itemCount: 10, // for infinity lazy load it most commented
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return TextWidget(text: '$index');
        });
  }
}

class GridViewCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2, children: <Widget>[
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
    ]);
  }
}

// ------------------------------------------------------------------

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, this.text = 'default txt'}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: Text(
        text,
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
