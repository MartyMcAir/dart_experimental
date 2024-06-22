import 'dart:convert';
import 'dart:io';

import 'package:logger/logger.dart';

class LogConfig {
  static Level? levelResult;

  static Future<void> init() async {
    levelResult = await ConfigReader.getLogLevel();
    // some
  }

// если logger =null, тогда
  static Logger get logger {
    return Logger(
      level: levelResult ?? Level.all,
      printer: PrettyPrinter(
        methodCount:
            2, // Показываем 2 уровня вызовов, чтобы видеть и метод, и класс
      ),
    );
  }
}

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
