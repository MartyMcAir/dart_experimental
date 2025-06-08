import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../config/firebase_config.dart';
import '../data/categories.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;
  String? _error;

// initState - for can we execute code if this was rendered for the first time
  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  // les 235 18min FutureBuilder
  // https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37208346#overview
  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https('$firebaseUrl', '$firebaseShoppingList.json');
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      // throw - for FutureBuilder -> snapshot.hasError
      throw Exception('Failed to fetch grocery items. Please try again later.');
    }
    if (response.body == 'null') {
      // FireBase return 'null' as a String when DataBase is empty
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category =
          categories.entries.firstWhere((elem) => elem.value.title == item.value['category']).value;
      loadedItems.add(GroceryItem(
        id: item.key,
        name: item.value['name'],
        quantity: item.value['quantity'],
        category: category,
      ));
    }
    return loadedItems;
  }

  void _addItem(BuildContext context) async {
    final newItem = await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (ctx) => const NewItem(),
    ));
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    //
    final url = Uri.https('$firebaseUrl', '$firebaseShoppingList/${item.id}.json');
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: () {
                _addItem(context);
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
          future: _loadItems(), // 5min - bad practice,
          // because function will be re-executedn every time the builder executes again
          // future: _loadedItems, // here good load once from initState()
          // - BUT it broken functional = for add or remove dinamicly
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // loading state wait for response
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.data!.isEmpty) {
              return const Center(child: Text('No items added yet.'));
            }

            return ListView.builder(
              // 13min - intead _groceryItems.* should use snapshot.data!.*
              itemCount: snapshot.data!.length, // _groceryItems.length
              itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(snapshot.data![index].id),
                onDismissed: (direction) {
                  _removeItem(snapshot.data![index]);
                },
                child: ListTile(
                  title: Text(snapshot.data![index].name),
                  leading: Container(
                    width: 24,
                    height: 24,
                    color: snapshot.data![index].category.color,
                  ),
                  trailing: Text(snapshot.data![index].quantity.toString()),
                ),
              ),
            );
          }),
    );
  }
}
