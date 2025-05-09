import 'package:flutter/material.dart';

// Изучаем Flutter
// https://www.udemy.com/course/learn_flutter/learn/lecture/17549056#notes

// lessons 0 - 12

void main(List<String> args) {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text("My first App"),
        centerTitle: true,
      ),
      body: const Center(
          child: Text(
        "This is home page",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple),
      )),
    ),
  ));
}
