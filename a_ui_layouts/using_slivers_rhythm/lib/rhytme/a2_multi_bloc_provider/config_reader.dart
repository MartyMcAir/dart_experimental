import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

class LogConfig {
  static Level? levelResult;
  static Future<void> init() async {
    levelResult = await ConfigReader.getLogLevel();
  }

  static Logger get logger {
    MyLogOutPut myLogOut = MyLogOutPut();
    return Logger(
      printer: PrettyPrinter(
        methodCount:
            2, // Показываем 2 уровня вызовов, чтобы видеть и метод, и класс
      ),
      output: myLogOut,
    );
  }
}

// ----------------------------------------------------------------------------

class MyLogOutPut extends ConsoleOutput {
  late String _currentLog = "no logs";
  String get currentLog => _currentLog;
  set currentLog(String value) => _currentLog = value;

  @override
  void output(OutputEvent event) {
    int length = event.lines.length;
    _currentLog = event.lines[length - 2];
    LogStorage.addLog(_currentLog);
    LogStorage.setLogsList = event.lines;
    event.lines.forEach(print);
  }
}

class LogStorage {
  static List<String> _logsList = [];
  static set setLogsList(List<String> value) => _logsList = value;

  static void addLog(String log) {
    _logsList.add(log);
  }

  static void addLogs(List<String> logsList) {
    _logsList.addAll(logsList);
  }

  static String getLastLog() {
    return _logsList.isNotEmpty ? _findLastLog() : "No logs available";
  }

  static String _findLastLog() {
    // int indexForLastLog = _logsList.length - 2;
    // _logsList[indexForLastLog]
    String strResult = "last log not found";
    if (_logsList.isNotEmpty) {
      for (int i = _logsList.length - 1; i >= 0; i--) {
        String currentStr = _logsList[i].toLowerCase();
        if (currentStr.contains("reloaded") ||
            currentStr.contains("└───────") ||
            currentStr.contains("├┄┄┄┄┄┄┄")) {
          continue;
        } else {
          strResult = currentStr;
          break;
        }
      }
    }
    return strResult;
  }
}

// ----------------------------------------------------------------------------

class ConfigReader {
  static Future<Level> getLogLevel() async {
    final config = await _loadConfig();
    return _parseLogLevel(config['logLevel']);
  }

  static Future<Map<String, dynamic>> _loadConfig() async {
    final file = File('app_config.json');
    final content = await file.readAsString();
    return jsonDecode(content);
  }

  static Level _parseLogLevel(String level) {
    switch (level.toUpperCase()) {
      case 'OFF':
        return Level.off;
      case 'FATAL':
        return Level.fatal; // Только критичные ошибки
      case 'ERROR':
        return Level.error; // любые ошибки
      case 'WARNING':
        return Level.warning; // обшики включая, не критичные предупреждения
      case 'INFO':
        return Level.info; // информационные и то что выше
      case 'DEBUG':
        return Level.debug; // подроьбный вывод для отладки
      case 'ALL':
        return Level.all; // вывод логов всех уровней логирования
      case 'TRACE':
        return Level.trace; // избыточные логи включая значения переменных
      default:
        return Level.off;
    }

    // Google logging library Logs Levels
    // logging библиотека - боле низкоуровневая и гибкая НО требует больше кода
    // Level.OFF
    // Level.SEVERE; // Только критичные ошибки
    // Level.WARNING; // Только критичные ошибки
    // Level.INFO; // критичные ошибки, warnings & информационные
    // Level.FINE; // отладка уровень 1
    // Level.FINER; // отладка уровень 2
    // Level.FINEST; // отладка уровень 3, самая детальная
    // Level.ALL; // вывод логов всех уровней логирования
    // Level.CONFIG; // логи настроек и инициализации приложения
  }
}
