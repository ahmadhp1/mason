import 'dart:io';

import 'package:dart_casing/dart_casing.dart';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

Future<void> run(HookContext context) async {
  // TODO : get states and events parameters from user

  _addNamesToVars(context);
  await _addPackageNameToVars(context);
}

void _addNamesToVars(HookContext context) async {
  final moduleName = context.vars['moduleName'];
  final moduleNamePascalCase = Casing.pascalCase(moduleName);
  final moduleNameSnakeCase = Casing.snakeCase(moduleName);

  context.vars = {
    ...context.vars,

    //*Class names *****************

    'Model': '${moduleNamePascalCase}Model',
    'Dto': '${moduleNamePascalCase}Dto',
    'Bloc': '${moduleNamePascalCase}Bloc',
    'State': '${moduleNamePascalCase}State',
    'Event': '${moduleNamePascalCase}Event',
    'Failure': '${moduleNamePascalCase}Failure',

    'Repository': 'I${moduleNamePascalCase}Repository',
    'DataSource': 'I${moduleNamePascalCase}ApiDataSource',
    'ApiService': 'I${moduleNamePascalCase}ApiService',

    'RepositoryImp': '${moduleNamePascalCase}RepositoryImplementation',
    'DataSourceImp': '${moduleNamePascalCase}ApiDataSourceImplementation',
    'ApiServiceImp': '${moduleNamePascalCase}ApiServiceImplementation',

    'Screen': '${moduleNamePascalCase}Screen',
    'PhoneView': '${moduleNamePascalCase}PhoneView',
    'TabletView': '${moduleNamePascalCase}TabletView',

    //*File names *****************

    'model_fn': '${moduleNameSnakeCase}_model',
    'model_export_fn': '${moduleNameSnakeCase}_models',
    'dto_fn': '${moduleNameSnakeCase}_dto',
    'failure_fn': '${moduleNameSnakeCase}_failure',
    'bloc_fn': '${moduleNameSnakeCase}_bloc',
    'state_fn': '${moduleNameSnakeCase}_state',
    'event_fn': '${moduleNameSnakeCase}_event',

    'repository_fn': '${moduleNameSnakeCase}_repository',
    'data_source_fn': '${moduleNameSnakeCase}_data_source',
    'api_service_fn': '${moduleNameSnakeCase}_api_services',
    'repository_imp_fn': '${moduleNameSnakeCase}_repository_implementation',

    'screens_fn': '${moduleNameSnakeCase}_screens',
    'screen_fn': '${moduleNameSnakeCase}_screen',
    'phone_view_fn': '${moduleNameSnakeCase}_phone_view',
    'tablet_view_fn': '${moduleNameSnakeCase}_tablet_view',
    'components_fn': '${moduleNameSnakeCase}_components',
  };
}

Future<void> _addPackageNameToVars(HookContext context) async {
  final logger = context.logger;
  final directory = Directory.current.path;

  try {
    List<String> folders;

    if (Platform.isWindows) {
      folders = directory.split(r'\').toList();
    } else {
      folders = directory.split('/').toList();
    }

    final libIndex = folders.indexWhere((folder) => folder == 'lib');

    final pubSpecFile =
        File('${folders.sublist(0, libIndex).join('/')}/pubspec.yaml');

    final content = await pubSpecFile.readAsString();
    final yamlMap = loadYaml(content);
    final packageName = yamlMap['name'];

    context.vars = {
      ...context.vars,
      'packageName': packageName,
      'pathToModule':
          'package:$packageName/features/${context.vars['moduleName']}'
    };
    print(packageName);
  } on RangeError catch (_) {
    logger.alert(
      red.wrap(
        'Could not find lib folder in $directory',
      ),
    );
    logger.alert(
      red.wrap(
        'Re-run this brick inside your lib folder',
      ),
    );
    throw Exception();
  } on FileSystemException catch (_) {
    logger.alert(
      red.wrap(
        'Could not find pubspec.yaml folder in ${directory.replaceAll('\\lib', '')}',
      ),
    );
    throw Exception();
  } on PubspecNameException catch (_) {
    logger.alert(
      red.wrap(
        'Could not read package name in pubspec.yaml',
      ),
    );
    logger.alert(
      red.wrap(
        'Does your pubspec have a name ?',
      ),
    );
    throw Exception();
  } on Exception catch (e) {
    throw e;
  }
}

class PubspecNameException implements Exception {}
