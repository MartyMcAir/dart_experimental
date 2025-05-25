import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

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
    this.isSelecting = true,
  });
  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // les260 5min https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37266982#overview
  // FlatMap instead GoogleMap
  // zoom 16
  // markers: {.. postion..}
  LatLng? _pickedLocation;

  FlutterMap get locationImage {
    final currentLocation = LatLng(widget.location.latitude, widget.location.longitude);

    return FlutterMap(
      options: MapOptions(
        initialCenter: currentLocation,
        initialZoom: 16,
        //
        onTap: (tapPosition, latlng) {
          if (!widget.isSelecting) return;
          setState(() {
            _pickedLocation = latlng;
          });
        },
        //
      ),
      children: [
        TileLayer(
          // urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            if (_pickedLocation != null)
              Marker(
                point: _pickedLocation!,
                width: 40,
                height: 40,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              )
            else if (!widget.isSelecting)
              Marker(
                point: currentLocation,
                width: 40,
                height: 40,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final initialLocation = LatLng(widget.location.latitude, widget.location.longitude);
    final center = _pickedLocation ?? initialLocation;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_pickedLocation != null) {
                  Navigator.of(context).pop(_pickedLocation);
                }
              },
            ),
        ],
      ),
      // body: locationImage,
      body: FlutterMap(
        options: MapOptions(
            initialCenter: center,
            initialZoom: 16,
            onTap: widget.isSelecting
                ? (tapPosition, latlng) {
                    setState(() {
                      _pickedLocation = latlng;
                    });
                  }
                : null),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.app',
          ),
          MarkerLayer(
            markers: (_pickedLocation == null && widget.isSelecting)
                ? []
                : [
                    Marker(
                      point: _pickedLocation ?? initialLocation,
                      width: 40,
                      height: 40,
                      child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                    ),
                  ],
          ),
        ],
      ),
    );
  }
}
