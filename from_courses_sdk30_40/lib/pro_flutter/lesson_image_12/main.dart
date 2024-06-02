// SIMPLE -------------------------------------------------------------
// https://metanit.com/dart/flutter/3.6.php
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body:
//           Image.asset("assets/images/lesson_12/a_dot_burr.jpg", width: 320, height: 240),
//       appBar: AppBar(
//         title: const Text("METANIT.COM"),
//       ),
//     ),
//   ));
// }

// -------------------------------------------------------------------
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: ImageWidget(title: 'Flutter Demo Home Page'),
      home: ImageWidget(const Key("some")),
    );
  }
}

class ImageWidget extends StatelessWidget {
  ImageWidget(Key key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String assetNamePath1 = 'assets/images/lesson_12/a_dot_burr.jpg';
    final String assetNamePath2 = 'ssets/images/lesson_12/a_dot_ham.jpg';
    final String assetNamePath3 = 'assets/lesson_12/subscribe.svg';
    final String assetNamePathUrl =
        'https://i.kym-cdn.com/entries/icons/original/000/006/151/ObamaNotBad.jpg';

    AssetImage imageFromAsset = AssetImage(assetNamePath1);
    Image imageFromAsset2 = Image.asset(assetNamePath2, fit: BoxFit.cover);
    // here use flutter_svg - dependency
    // SvgPicture imageFromAsset3 = SvgPicture.asset(assetNamePath3, fit:);

    // Image imageFile = Image.file();
    // Image imageMemo = Image.memory();
    // Image imageNetwork = Image.network();

    Image changedImage = Image(
      image: imageFromAsset2.image,
      color: Colors.green,
      colorBlendMode: BlendMode.color,
    );

    return Container(
      constraints: BoxConstraints.expand(height: double.infinity),
      child: changedImage,
      // child: Image(image: imageFromAsset, fit: BoxFit.cover),
    );
  }
}
