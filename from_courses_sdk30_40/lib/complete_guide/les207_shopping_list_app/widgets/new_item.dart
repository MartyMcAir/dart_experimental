import 'package:flutter/material.dart';

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
  var _eneteredName = '';
  var _eneteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables]!;

  // les 216 https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/learn/lecture/37213800#overview
  // key - for to tell Flutter, should execute all the validators that are registered for all the form fields
  // key - for do get this access to form through a key (not ValueKey !)
  final _formKey = GlobalKey<FormState>(); // GlobalKey() - easy access to the underlying widget

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      // if true -> validton succeeds
      // .validate() -> triggered 'validator'
      _formKey.currentState!.save(); // .save() -> triggered 'onSaved'
      Navigator.of(context).pop(GroceryItem(
        id: DateTime.now().toString(),
        name: _eneteredName,
        quantity: _eneteredQuantity,
        category: _selectedCategory,
      ));
      // print(_eneteredName);
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
                // TextFormField() integrated with Form()
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                //validator:(value){if(value==null){return'err';}return null;},
                validator: validateString,
                onSaved: (value) {
                  // use: value! _or if don't have validator use: if(value == null) {return;}
                  _eneteredName = value!;
                  // setState((){}) - don't need because don't need build method execute again
                  // and we don't have any UI update
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(label: Text('Quantity')),
                      keyboardType: TextInputType.number, // num keyboard on the mobile device
                      validator: validateInt,
                      initialValue: _eneteredQuantity.toString(), // every user input is a String
                      onSaved: (value) {
                        _eneteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory, // instead initialValue
                      onChanged: (value) {
                        setState(() {
                          // Without setState(..), it won't work
                          // required because selectedCategory
                          // is used to set the currently visible value istead initialValue
                          _selectedCategory = value!;
                        });
                      },
                      // onSaved: , // don't need because we did it manually anyways
                      items: [
                        // MapEntry<Categories, Category> category
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
                mainAxisAlignment: MainAxisAlignment.end, // to the right ->
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Reset')),
                  ElevatedButton(onPressed: _saveItem, child: const Text('Add Item')),
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
    // if it does return null, = Flutter knows that validation succeeded
    // and the entered value is Correct
    // Otherwise, if we return some text here = this will be the error message
    if (value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }
}
