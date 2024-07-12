import 'package:flutter/material.dart';
import 'package:simple_todo_app/state_todo/state_todo_main.dart';

import 'box_list_element.dart';

class TodoScreenState extends State<StateTodoPage> {
  List toDoList = [
    ['Learn Flutter', false],
    ['Drink cup of tea', false]
  ];

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (BuildContext context, index) {
            return BoxElementList(
              tuskItem: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(index),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
      // In down Text input field
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Add a new some todos items may bee',
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            )),
            // Square button on the bottom
            FloatingActionButton(
              onPressed: saveNewTusk,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }

  checkBoxChanged(int index) {
    setState(() {
      // без setState состояние чекбокса меняться не будет
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTusk() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }
}
