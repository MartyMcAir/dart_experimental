import 'package:flutter/material.dart';

void main() => runApp(ScreenWidget());

var CENTER_TEXT = "Some text is good 333";

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('StatelessWidget'),
        ),
        body: SimpleWidget(),
      ),
    );
  }
}

class SimpleWidget extends StatelessWidget {
  var src =
      'https://i.kym-cdn.com/entries/icons/original/000/006/151/ObamaNotBad.jpg';
  // const SimpleWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      // color: Colors.green, // if uncomment all bee green
      child: Text(
        'Panda',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      height: 150,
      width: double.infinity, // fill all width
      // alignment: Alignment.center,
      alignment: Alignment(0, 0), // center is: 0, 0 _ -1,-1, - topLeft
      // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      margin: EdgeInsets.all(50), // outer padding
      // transform: Matrix4.rotationZ(0.1),
      decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [Colors.pink, Colors.yellow])),
          // color: Colors.green,
          image: DecorationImage(
              image: Image.network(src).image, fit: BoxFit.cover),
          // use shape OR
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black45,
                offset: Offset(-5, 5),
                blurRadius: 5,
                spreadRadius: 5)
          ]),
      // OR use border
      // borderRadius: BorderRadius.circular(15),
      // border: Border.all(color: Colors.black, width: 8)),
    ));
  }
}
