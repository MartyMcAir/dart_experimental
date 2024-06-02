import 'package:flutter/material.dart';

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PageView Widget'),
        ),
        // body: PageViewCustomWidget(),
        body: PageViewWidget(),
      ),
    );
  }
}

class PageViewWidget extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      // pageSnapping: false,
      // physics: BouncingScrollPhysics(),
      // physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      onPageChanged: (number) {
        print("Page number $number");
      },

      children: <Widget>[
        Container(
          color: Colors.red,
          child: Center(
            child: Text('Stop!'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Center(
            child: Text('Ready?'),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 250, 153, 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Go!',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                child: Text('Reload'),
                onPressed: () {
                  pageController.jumpToPage(0);
                  // pageController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeInBack);
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PageViewBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      // itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: index % 2 == 0 ? Colors.red : Colors.greenAccent,
          alignment: Alignment.center,
          child: Text('$index'),
        );
      },
    );
  }
}

class PageViewCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.custom(
      childrenDelegate: SliverChildListDelegate([
        Text('1'),
        Text('2'),
        Text('3'),
      ]),
    );
  }
}

// ----------------------------------------------------------

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({Key? key, this.text = 'default'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: Text(
        text,
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
