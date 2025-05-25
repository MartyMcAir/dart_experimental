import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import '../models/place.dart';

// les264 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37267010#overview
// packages:
// path_provider - gives us easy access to a path that we may use to store data that belongs to our app
// path - simplifies the process of working with file paths, (for construct some paths manually)
// sqflite - allow us to store data on the device using SQL commands (basic local DataBase)
// sharedpreferences - allows you to store data on the device, using by store simple key value pairs

Future<Database> _getDataBase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'places.db'),
      // onCreate - execute after create db, to allow you to perform some initial setup work
      onCreate: (db, verstion) {
    return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)');
  }, version: 1);
  return db;
}

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  // for loading data whe the app started
  Future<void> loadPlaces() async {
    final db = await _getDataBase();
    final data = await db.query('user_places'); // , where: );
    final places = data
        .map((row) => Place(
              id: row['id'] as String,
              image: File(row['image'] as String),
              title: row['title'] as String,
              location: PlaceLocation(
                latitude: row['lat'] as double,
                longitude: row['lng'] as double,
                address: row['address'] as String,
              ),
            ))
        .toList();
    // set the state of this notifier clause in which we still are..
    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');
    final newPlace = Place(title: title, image: copiedImage, location: location);
    final db = await _getDataBase();
    db.insert('user_places', {
      // storing data in the dataBase
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location.latitude,
      'lng': newPlace.location.longitude,
      'address': newPlace.location.address,
    });
    // if you try to open a dataBase that doesn't exist yet,
    // this package will automatically create the dataBase
    //
    state = [newPlace, ...state];
  }

  void onRemovePlace(Place place) async {
    final db = await _getDataBase();
    await db.delete('user_places', where: 'id = ?', whereArgs: [place.id]);
    if (await place.image.exists()) {
      await place.image.delete();
    }
    state = state.where((p) => p.id != place.id).toList();
  }
}

final userPolacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);
