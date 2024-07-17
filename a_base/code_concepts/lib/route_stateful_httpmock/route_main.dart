import 'package:flutter/material.dart';

import 'common_dto/btn_box_dto.dart';
import 'common_dto/button_element_dto.dart';
import 'http/mock_client.dart';
import 'sign_in_form/sign_in_http.dart';

void main() {
  runApp(const FormApp());
}

final buttonsList = [
  ButtonElementDto(
    name: 'BtnName: Sign in with HTTP',
    route: '/signin_http',
    builder: (context) => SignInHttpDemo(
      httpClient: mockClient,
    ),
  )
];

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FormApp title',
      theme: ThemeData(primarySwatch: Colors.teal),
      routes:
          Map.fromEntries(buttonsList.map((d) => MapEntry(d.route, d.builder))),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title on the top'),
      ),
      body: ListView(
        children: [...buttonsList.map((d) => BoxForButtonTitleObjDto(demo: d))],
      ),
    );
  }
}
