import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await ConfigReader.init();
    runApp(const MyApp());
  } catch (e) {
    ErrorCollector.addError(e.toString());
    runApp(const ErrorApp());
  }
}

class ErrorCollector {
  static final List<String> _errors = [];

  static void addError(String error) {
    _errors.add(error);
  }

  static List<String> get errors => _errors;
}

class ConfigReader {
  static const String _configFileName = 'app_config.json';
  static const String _defaultConfigFileName = 'app_config_default.json';
  static Level logLevel = Level.off; // Уровень логирования по умолчанию

  static Future<void> init() async {
    try {
      final config = await _loadConfig();
      final defaultConfig = await _loadDefaultConfig();
      logLevel =
          _parseLogLevel(config['logLevel'] ?? defaultConfig['logLevel']);
    } catch (e) {
      ErrorCollector.addError(e.toString());
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> _loadConfig() async {
    final file = File(_configFileName);

    if (!(await file.exists())) {
      ErrorCollector.addError(
          'Файл $_configFileName не найден. Создаю на основе $_defaultConfigFileName.');
      final defaultConfig = await _loadDefaultConfig();
      await file.create(recursive: true);
      await file.writeAsString(jsonEncode(defaultConfig));
    }

    final content = await file.readAsString();
    return jsonDecode(content);
  }

  static Future<Map<String, dynamic>> _loadDefaultConfig() async {
    final file = File(_defaultConfigFileName);

    if (!(await file.exists())) {
      throw Exception(
          'Файл $_defaultConfigFileName не найден. Пожалуйста, создайте файл с необходимыми настройками.');
    }

    final content = await file.readAsString();
    return jsonDecode(content);
  }

  static Level _parseLogLevel(String? level) {
    switch (level?.toUpperCase()) {
      case 'OFF':
        return Level.off;
      case 'FATAL':
        return Level.fatal;
      case 'ERROR':
        return Level.error;
      case 'WARNING':
        return Level.warning;
      case 'INFO':
        return Level.info;
      case 'DEBUG':
        return Level.debug;
      case 'ALL':
        return Level.all;
      case 'TRACE':
        return Level.trace;
      default:
        return Level.off;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main Application'),
        ),
        body: Center(
          child: Text(
              'Application is running with log level: ${ConfigReader.logLevel.name}'),
        ),
      ),
    );
  }
}

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    final errors = ErrorCollector.errors;
    return MaterialApp(
      title: 'Error',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Configuration Error'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: errors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    '${index + 1}) ${errors[index]}',
                    style: const TextStyle(color: Colors.red, fontSize: 18),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
