import 'package:flutter/material.dart';

import 'button_element_dto.dart';

class BoxForButtonTitleObjDto extends StatelessWidget {
  final ButtonElementDto? demo;

  const BoxForButtonTitleObjDto({this.demo, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo!.name),
      onTap: () {
        Navigator.pushNamed(context, demo!.route);
      },
    );
  }
}
