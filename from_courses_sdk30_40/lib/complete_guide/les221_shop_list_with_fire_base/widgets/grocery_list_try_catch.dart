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
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? _error;

// initState - for can we execute code if this was rendered for the first time
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    //les234 error handling like in java (almost)
    // https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37215198#overview
    try {
      final url = Uri.https('$firebaseUrl', '$firebaseShoppingList.json');
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
      }
      if (response.body == 'null') {
        // FireBase return 'null' as a String when DataBase is empty
        setState(() {
          _isLoading = false;
        });
        return;
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
      setState(() {
        _groceryItems = loadedItems;
        _isLoading = false;
      });
      // ----------------------------------------------------------
    } catch (error) {
      setState(() {
        _error = 'Something went wrong! Please try again later.';
      });
    }
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
    // _loadItems();
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    //
    final url = Uri.https('$firebaseUrl', '$firebaseShoppingList/${item.id}.json');
    final response = await http.delete(url);
    // if I don't need to wait for this request to finish to update my local list
    // that's why wee don't use here await and async
    // but it might be problem
    //les232 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37215190#overview
    if (response.statusCode >= 400) {
      // Optional: Show error message
      setState(() {
        _groceryItems.insert(index, item); // .add(..)
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_isLoading) {
      // les230 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37215184#overview
      // for show loading spinner initially _ if backend or internet so slow..
      content = const Center(child: CircularProgressIndicator());
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_groceryItems[index].id),
          onDismissed: (direction) {
            _removeItem(_groceryItems[index]);
          },
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
        ),
      );
    }

    if (_error != null) {
      content = Center(child: Text(_error!));
    }

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
      body: content,
    );
  }
}
