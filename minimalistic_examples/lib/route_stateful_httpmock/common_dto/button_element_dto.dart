import 'package:flutter/material.dart';

class ButtonElementDto {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const ButtonElementDto(
      {required this.name, required this.route, required this.builder});
}
