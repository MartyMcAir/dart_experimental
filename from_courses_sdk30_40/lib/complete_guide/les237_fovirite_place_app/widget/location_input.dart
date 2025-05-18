import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});
  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedLocation;
  var _isGettingLocation = false;

  // lesson 256 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37266956#overview
  SizedBox get locationImage {
    final currentLocation = LatLng(_pickedLocation!.latitude, _pickedLocation!.longitude);

    return SizedBox(
      height: 250,
      width: double.infinity, //double.infinity, // 200,
      child: FlutterMap(
        options: MapOptions(initialCenter: currentLocation, initialZoom: 15),
        children: [
          TileLayer(
            // urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: currentLocation,
                width: 40,
                height: 40,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });
    locationData = await location.getLocation();
    // https://developers.google.com/maps/documentation/geocoding/requests-reverse-geocoding?hl=ru
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    if (lat == null || lng == null) {
      return; // temporarely solution
    }

    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$lng&accept-language=en&format=json');
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'User-Agent': 'flutter_app_for_test',
    });
    final Map<String, dynamic> resData = json.decode(response.body);
    final displayName = resData['display_name']; // full addres with country &etc..
    // final type = resData['type']; // apartments
    // final addresstype = resData['addresstype']; // building
    // final address = resData['address']; // object address{ }
    // - house_number = 38 - postcode = 0120
    // - country_code = ge - country = Georgia
    // - city = Tbilisi - quarter = Navtlughi
    // final boundingbox1 = resData['boundingbox'][0]; // array boundingbox[ ]
    // final boundingbox2 = resData['boundingbox'][1];
    // final boundingbox3 = resData['boundingbox'][2];
    // final boundingbox4 = resData['boundingbox'][3];

    setState(() {
      _pickedLocation = PlaceLocation(latitude: lat, longitude: lng, address: displayName);
      _isGettingLocation = false;
    });
    widget.onSelectLocation(_pickedLocation!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text('No location chosen',
        textAlign: TextAlign.center, // Horizontally centered
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ));

    if (_pickedLocation != null) {
      previewContent = locationImage;
      // Image.network(locationImage, fit: BoxFit.cover, width: double.infinity, height: double.infinity);
    }
    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center, // Aligned to vertical center
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary.withAlpha((255 * 0.2).round()),
          )),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Get Current Location'),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: Icon(Icons.map),
              label: Text('Selected on Map'),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
