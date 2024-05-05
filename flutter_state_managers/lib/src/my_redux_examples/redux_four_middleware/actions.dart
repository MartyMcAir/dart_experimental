import 'package:flutter/material.dart';

class AddAction {}

class RemoveAction {}

class SetTextAction {
  final String text;
  // required - связанно с nullSafe'ty
  SetTextAction({required this.text});
}

class ResetTextAction {}

class FreezeAction {}

class GetImageAction {}

class LoadedImageAction {
  final Widget widget;

  LoadedImageAction(this.widget);
}
