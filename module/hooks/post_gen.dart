import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  //Thanks to Luke Moody (https://github.com/LukeMoody01) for this part of app

  final logger = context.logger;
  final directory = Directory.current.path;
  List<String> folders;

  if (Platform.isWindows) {
    folders = directory.split(r'\').toList();
  } else {
    folders = directory.split('/').toList();
  }

  final libIndex = folders.indexWhere((folder) => folder == 'lib');

  if (logger.confirm('Would you like to generate the freezed model?',
      defaultValue: true)) {
    final root = folders.sublist(0, libIndex).join('/').toString();
    final buildRunnerProcess = await Process.start(
      'flutter',
      ['pub', 'run', 'build_runner', 'build', '--delete-conflicting-outputs'],
      runInShell: true,
      workingDirectory: root,
    );

    await stdout.addStream(buildRunnerProcess.stdout);
    await stderr.addStream(buildRunnerProcess.stderr);
  }
  // if (logger.confirm('Would you like to open editor?', defaultValue: true)) {
  //   final root = folders.sublist(0, libIndex).join('/').toString();
  //   final openEditorProcess = await Process.start(
  //     'code',
  //     [root],
  //     runInShell: true,
  //     workingDirectory: root,
  //   );

  //   await stdout.addStream(openEditorProcess.stdout);
  //   await stderr.addStream(openEditorProcess.stderr);
  // }
}
