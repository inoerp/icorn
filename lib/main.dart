import 'dart:io';
import 'package:cron/cron.dart';

main() async {
  // await deleteLogFiles([
  //   '/usr/sw/oracleug.com/released/files/log',
  //   '/usr/sw/apicsforum.com/released/files/log',
  //   '/usr/sw/demo.inoerp.com/released/files/log',
  //   '/usr/sw/demo1.inoerp.com/released/files/log',
  // ]);
  final cron = Cron();
  // Schedule task to run every week
  cron.schedule(Schedule.parse('0 0 * * 0'), () async {
    await deleteLogFiles([
      '/usr/sw/oracleug.com/released/files/log',
      '/usr/sw/apicsforum.com/released/files/log',
      '/usr/sw/demo.inoerp.com/released/files/log',
      '/usr/sw/demo1.inoerp.com/released/files/log',
    ]);
  });
}

Future<void> deleteLogFiles(List<String> directories) async {
  for (var dirPath in directories) {
    final dir = Directory(dirPath);
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    } else {
      print('Directory not found: $dirPath');
    }
  }
}
