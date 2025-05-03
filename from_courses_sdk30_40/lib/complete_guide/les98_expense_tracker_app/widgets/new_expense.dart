import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // String _enteredTitle = '';
  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    // .then(  (value) {},    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          // showCupertinoDialog - for style dialog like in iOs only
          context: context,
          builder: (ctx) => CupertinoAlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Please make sure a valid title, amount, date and category was entered'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay'))
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Please make sure a valid title, amount, date and category was entered'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay'))
                ],
              ));
    }
  }

  void _submitExpenseData() {
    // if tryParse cant parse - then it return null
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsIvalid = (enteredAmount == null) || (enteredAmount <= 0);
    if (_titleController.text.trim().isEmpty || amountIsIvalid || _selectedDate == null) {
      _showDialog();
      return; // не совсем понял, lesson 118
      // Because I wont to show the dialog, and then nothing else
    }
    // -----------------------------
    widget.onAddExpense(Expense(
      title: _titleController.text,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    ));
    Navigator.pop(context);
  }

  // При исплозовании TextEditingController следует переопределять dispose
  // что бы Flutter освобождал ресурсы и убирал мусор от TextEditingController
  // тогда когда в нем нет необходимости
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyaboardSpace = MediaQuery.of(context).viewInsets.bottom;
    // LayoutBuilder that automatically adjusts studio available space
    // LayoutBuilder will call this builder function again whenever the constraints change
    return LayoutBuilder(builder: (ctx, constrains) {
// constrains - is all about telling us which constraints are applied
// by the parent widget in which we use this widget here
      print(constrains); // => BoxConstraints(0.0<=w<=640.0, 0.0<=h<=683.4)
      final width = constrains.maxWidth;

      // ----------------------------------------------------------------------------
      return SizedBox(
        // because on that sized box can set the height
        height: double.infinity, // for avoid size screen error
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyaboardSpace + 16),
            child: Column(
              children: [
                (width >= 600)
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              // onChanged: _saveTitleInput,
                              controller: _titleController,
                              maxLength: 50,
                              decoration: const InputDecoration(label: Text('Title')),
                            ),
                          ),
                          const SizedBox(width: 24),
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixText: '\$ ',
                                label: Text('Amount'),
                              ),
                            ),
                          ),
                        ],
                      )
                    : TextField(
                        // onChanged: _saveTitleInput,
                        controller: _titleController,
                        maxLength: 50,
                        decoration: const InputDecoration(label: Text('Title')),
                      ),
                (width >= 600)
                    ? Row(children: [
                        DropdownButton(
                          value: _selectedCategory,
                          items: Category.values
                              .map(
                                (v) => DropdownMenuItem(value: v, child: Text(v.name.toUpperCase())),
                              )
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              if (value == null) {
                                return;
                              }
                              _selectedCategory = value;
                            });
                          },
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(_selectedDate == null
                                  ? 'No date selected'
                                  : formatter.format(_selectedDate!)),
                              IconButton(
                                onPressed: _presentDatePicker,
                                icon: const Icon(Icons.calendar_month),
                              )
                            ],
                          ),
                        )
                      ])
                    : Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                prefixText: '\$ ',
                                label: Text('Amount'),
                              ),
                            ),
                          ),
                          //
                          const SizedBox(width: 16),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(_selectedDate == null
                                    ? 'No date selected'
                                    : formatter.format(_selectedDate!)),
                                IconButton(
                                  onPressed: _presentDatePicker,
                                  icon: const Icon(Icons.calendar_month),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                const SizedBox(height: 16),
                (width >= 600)
                    ? Row(children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel')),
                        ElevatedButton(onPressed: _submitExpenseData, child: const Text('Save Expense'))
                      ])
                    : Row(
                        children: [
                          DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map(
                                  (v) => DropdownMenuItem(value: v, child: Text(v.name.toUpperCase())),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                if (value == null) {
                                  return;
                                }
                                _selectedCategory = value;
                              });
                            },
                          ),
                          const Spacer(),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel')),
                          ElevatedButton(
                              onPressed: _submitExpenseData,
                              //  () {  // print(_enteredTitle);
                              // print(_titleController.text);
                              // print(_amountController.text); },
                              child: const Text('Save Expense'))
                        ],
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
