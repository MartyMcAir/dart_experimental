class AddAction {}

class SetTextAction {
  final String text;
  // required - связанно с nullSafe'ty
  SetTextAction({required this.text});
}
