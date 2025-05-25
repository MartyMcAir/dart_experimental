import 'package:flutter/material.dart';

import '../models/place.dart';
import 'map.dart';

class PlacesDetailsScreen extends StatelessWidget {
  const PlacesDetailsScreen({super.key, required this.place});
  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          // full screen for image
          Image.file(place.image, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Тут обойдемся easy решением
                // les258 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37266970#overview - 7min
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MapScreen(location: place.location, isSelecting: false),
                    ));
                  },
                  // for tappable
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Внешний круг — рамка
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              // const Color(0xFFB39DDB).withAlpha(190)
                              color: const Color.fromARGB(255, 229, 227, 232).withAlpha(190),
                              width: 4),
                        ),
                      ),
                      ClipOval(
                        // картинка с альфа каналом
                        child: Image.asset(
                          'assets/images/VaultBoyfallout.png',
                          width: 140,
                          height: 140,
                          fit: BoxFit.contain, // чтобы не растягивало
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black54],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                  child: Text(place.location.address,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          )),
                ),
              ],
            ),
          )
        ],
      ),
      // Center(
      //     child: Text(place.title,
      //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
      //               color: Theme.of(context).colorScheme.onSurface,
      //             )))
    );
  }
}
