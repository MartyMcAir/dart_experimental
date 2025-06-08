import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../config/firebase_config.dart';
import '../data/categories.dart';
import '../models/category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _eneteredName = '';
  var _eneteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;
  var _isSending = false;

  void _saveItem() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
      // les226 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37215160#overview
      final url = Uri.https('$firebaseUrl', '$firebaseShoppingList.json');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          // json from: import 'dart:convert';
          // withOut id because FireBase generate id for us, which is pretty convenient
          'name': _eneteredName,
          'quantity': _eneteredQuantity,
          'category': _selectedCategory.title,
        }),
      );
      // .then((response) {}); // or use '.then(..)' manually
      // or add for method 'async' and 'await'
      // if(response.statusCode == 200){}
      print(response.body);

      final Map<String, dynamic> resData = json.decode(response.body);
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop(GroceryItem(
        id: resData['name'],
        name: _eneteredName,
        quantity: _eneteredQuantity,
        category: _selectedCategory,
      ));
      //
      // Navigator.of(context).pop(          // GroceryItem(
      //   id: DateTime.now().toString(),
      //   name: _eneteredName,
      //   quantity: _eneteredQuantity,
      //   category: _selectedCategory)          // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                validator: validateString,
                onSaved: (value) {
                  _eneteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(label: Text('Quantity')),
                      keyboardType: TextInputType.number,
                      validator: validateInt,
                      initialValue: _eneteredQuantity.toString(),
                      onSaved: (value) {
                        _eneteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value!;
                        });
                      },
                      items: [
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                            child: Row(
                              children: [
                                Container(width: 16, height: 16, color: category.value.color),
                                const SizedBox(width: 6),
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      // for disable btn _isSending - to avoid redundant API request
                      //les230 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37215184#overview
                      // а что если отправка идет бессконечно
                      onPressed: _isSending
                          ? null
                          : () {
                              _formKey.currentState!.reset();
                            },
                      child: const Text('Reset')),
                  ElevatedButton(
                    onPressed: _isSending ? null : _saveItem,
                    child: _isSending
                        ? const SizedBox(height: 16, width: 16, child: CircularProgressIndicator())
                        : const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateInt(value) {
    if (value == null || value.isEmpty || int.tryParse(value) == null || int.tryParse(value)! <= 0) {
      return 'Must be a valid, positive number.';
    }
    return null;
  }

  String? validateString(value) {
    if (value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }
}
