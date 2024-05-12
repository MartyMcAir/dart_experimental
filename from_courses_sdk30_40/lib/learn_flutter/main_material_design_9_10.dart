// https://www.udemy.com/course/learn_flutter/learn/lecture/17549020#overview
// https://docs.flutter.dev/ui/widgets-intro
// ..
// https://m3.material.io/ - рекомендации по использованию стиля

import 'package:flutter/material.dart';

// Simple example
// void main() {
//   runApp(
//     const Center(
//       child: Text(
//         "Hi",
//         style: TextStyle(
//             fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),
//         textDirection: TextDirection.ltr,
//       ),
//     ),
//   );
// }

// Material Design Example - управляет стилем отображения и навигаецией
void main() {
  runApp(
    const MaterialApp(
      home: Center(
        // home основной Material виджет,
        child: Text(
          "Hi",
          style: TextStyle(
              fontSize: 16, color: Colors.orange, fontWeight: FontWeight.bold),
          textDirection: TextDirection.ltr,
        ),
      ),
    ),
  );
}
