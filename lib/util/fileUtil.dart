import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'timeUtil.dart';

class LogsStorage {
  static final LogsStorage _singleton = LogsStorage._();

  static LogsStorage get instance {
    return _singleton;
  }

  LogsStorage._();

  File _file;

  Future<String> get _localPath async {
    Directory directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath + "/flogs/";
    Directory(path).create().then((Directory de) {
      print(de.path);
    });

    var file = File("$path${TimeUtil.getDayTime()}.log");
    var isExit = await file.exists();
    if (isExit) {
      print('log file exists');
    } else {
      print('log file not exists');
      file.create();
    }
    _file = file;
    return file;
  }

  void writeLog2File(String log) async {
    if (_file == null) {
      await _localFile;
    }
    _file.writeAsStringSync(log, mode: FileMode.append);
  }

  Future<String> readLogs2File() async {
    try {
      File file = await _localFile;
      String content = await file.readAsString();
      return content;
    } catch (e) {
      return "read logs error";
    }
  }
}
