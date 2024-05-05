import 'package:flutter/material.dart';

import 'anonymous_routes_with_params.dart';
import 'named_routes_with_params.dart';
import 'on_generate_route.dart';

// https://docs.flutter.dev/cookbook/navigation/named-routes
// https://docs.flutter.dev/cookbook/navigation/navigate-with-arguments
void main() {
  // runApp(const NamedRoutesWithParams());
  // runApp(const AnonymousRoutesWithParams());
  runApp(const OnGenerateRoute());
}
