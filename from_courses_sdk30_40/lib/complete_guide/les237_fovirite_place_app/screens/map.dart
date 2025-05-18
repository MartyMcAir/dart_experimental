import 'package:flutter/material.dart';

import '../models/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = const PlaceLocation(
      // consstructor must be const
      latitude: 37.422,
      longitude: -122.084,
      address: 'Google Main Office',
    ),
  });
  final PlaceLocation location;

  @override
  State<MapScreen> createState() {
    return _MapScreenState();
  }
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
