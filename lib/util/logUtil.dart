import 'package:flutter/material.dart';
import 'timeUtil.dart';
import 'fileUtil.dart';

enum Level { DEBUG, INFO, WARNING, ERROR }

bool get isDebugMode {
  bool debugMode = true;
  assert(debugMode = true);
  return debugMode;
}

class LogUtil {
  static Level logLevel = Level.DEBUG;
  static final LogsStorage storage = LogsStorage.instance;

  static d({String tag, @required String content}) {
    _log2File(Level.DEBUG, tag ?? "DEBUG", content);
  }

  static i({String tag, @required String content}) {
    _log2File(Level.INFO, tag ?? "INFO", content);
  }

  static w({String tag, @required String content}) {
    _log2File(Level.WARNING, tag ?? "WARNING", content);
  }

  static e({String tag, @required String content}) {
    _log2File(Level.ERROR, tag ?? "ERROR", content);
  }

  static void _log2File(Level level, String tag, String content) {
    String log = _formatLog(level, tag, content);
    if (isDebugMode) {
      print(log);
    }
    if (level.index >= logLevel.index) {
      storage.writeLog2File(log);
    }
  }

  static String _formatLog(Level level, String tag, String content) {
    String log = "${level.toString()}";
    log += "${TimeUtil.getCurrentFullTime()} ";
    log += "$tag ";
    log += "$content\n";
    return log;
  }
}
