import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

// V2 usinf JSON setting for logger
Logger logger = createLoggerFromJson();

void main(List<String> arguments) {
  // V1 using Dart lang settings for logger
  // var config = _readLoggingConfigFromJson("logging_config.json");
  // var logLevel = Level.info;

  Map<String, dynamic> alienMap = getMapFromJsonFile('./bin/json/alien.json');
  Alien someAlien = Alien.fromJson(alienMap);
  logger.i('here some alien with name is: ${someAlien.name}'); // Alice
  logger.i('alien show to string: $someAlien'); // Alien{name=Alice, age=999999}

  logger.i('some info message');
  logger.e('some error message');
}

class Alien {
  String name;
  int age;
  Alien(this.name, this.age);

  factory Alien.fromJson(Map<String, dynamic> json) {
    return Alien(json['name'] as String, json['age'] as int);
  }

  @override
  String toString() {
    return 'Alien{name=$name, age=$age}';
  }
}

// ---------------------- V2 USING JSON file ----------------------------
Logger createLoggerFromJson() {
  Map<String, dynamic> jsonMap = getMapFromJsonFile('logging_config.json');
  return Logger(
    // output: null, // for show in all output
    // output: ConsoleOutput(), // for show only in console
    printer: PrettyPrinter(
      methodCount: jsonMap['prettypPrinter']
          ['methodCount'], // Number of method calls to be displayed
      errorMethodCount: jsonMap['prettypPrinter'][
          'errorMethodCount'], // Number of method calls if stacktrace is provided
      lineLength: jsonMap['prettypPrinter']
          ['lineLength'], // Width of the output
      colors: jsonMap['prettypPrinter']['colors'], // Colorful log messages
      printTime: jsonMap['prettypPrinter']
          ['printTime'], // Should each log print cinfoontain a timestamp
    ),
    level: getLevel(jsonMap['level']),
    filter: InfoFilter(), // for show info Level only
  );
}

Map<String, dynamic> getMapFromJsonFile(String pathToJson) {
  String fileString = File(pathToJson).readAsStringSync();
  return jsonDecode(fileString);
}

Level getLevel(String level) {
  switch (level) {
    case 'info': // ON all logs (if filter allows)
      return Level.info;
    case 'error':
      return Level.error;
    case 'warning':
      return Level.warning;
    case 'off': // OFF all logs
      return Level.off;
    default:
      return Level.info;
  }
}

// ---------------------- V1 USING DART lang ----------------------------
class InfoFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return event.level == Level.info;
  }
}

// var logger = Logger(
//   // output: null, // for show in all output
//   // output: ConsoleOutput(), // for show only in console
//   printer: PrettyPrinter(
//     methodCount: 2, // Number of method calls to be displayed
//     errorMethodCount: 8, // Number of method calls if stacktrace is provided
//     lineLength: 120, // Width of the output
//     colors: true, // Colorful log messages
//     printEmojis: true, // Print an emoji for each log message
//     printTime: false, // Should each log print cinfoontain a timestamp
//     levelEmojis: {Level.info: 'i'},
//   ),
//   level: Level.info,
//   filter: InfoFilter(), // for show info Level only
// );
