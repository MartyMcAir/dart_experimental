import 'dart:async';

void main() {
  // https://www.youtube.com/watch?v=JLVLcYH7z3Y&t=625s
  final cmp = SomeComponent();
  // cmp.action(); // Action called

  cmp.onEvent.listen((event) {
    print(event.someMessage);
  });
  cmp.action(); // Action called and new line: // Event occurs

  cmp.onEvent.listen((event) {
    print('some not msg: ${event.someNotMessage}');
  });
  cmp.action(); // Action called // some not msg: hello from someNotMessage
}

class SomeEvent {
  final String someMessage;
  final String someNotMessage;
  SomeEvent(this.someMessage, this.someNotMessage);
}

class SomeComponent {
  // final _eventController = StreamController<SomeEvent>();
  // broadcats() - for multiple listener's
  final _eventController = StreamController<SomeEvent>.broadcast();
  Stream<SomeEvent> get onEvent => _eventController.stream;

  void action() {
    print("Action called");
    _eventController
        .add(SomeEvent("Event occurs", "hello from someNotMessage"));
  }
}
