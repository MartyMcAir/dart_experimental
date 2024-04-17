import 'package:test/test.dart';

import '../lib/some_function_without_class.dart';

void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });
}
