import 'package:flutter/material.dart';

void main() => runApp(const ScreenWidget());

class ScreenWidget extends StatelessWidget {
  const ScreenWidget({super.key});

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

  PageViewWidget({super.key});

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
          child: const Center(
            child: Text('Stop!'),
          ),
        ),
        Container(
          color: Colors.green,
          child: const Center(
            child: Text('Ready?'),
          ),
        ),
        Container(
          color: const Color.fromARGB(255, 250, 153, 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Go!',
                style: TextStyle(fontSize: 40),
              ),
              ElevatedButton(
                child: const Text('Reload'),
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
  const PageViewBuilderWidget({super.key});

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
  const PageViewCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.custom(
      childrenDelegate: SliverChildListDelegate([
        const Text('1'),
        const Text('2'),
        const Text('3'),
      ]),
    );
  }
}

// ----------------------------------------------------------

class TextWidget extends StatelessWidget {
  final String text;
  const TextWidget({super.key, this.text = 'default'});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 40),
      ),
    );
  }
}
