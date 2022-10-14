import 'package:dart_casing/dart_casing.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  // TODO : get states and events parameters from user

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

    //*File names *****************

    'model_fn': '${moduleNameSnakeCase}_model',
    'model_exports_fn': '${moduleNameSnakeCase}_models',
    'dto_fn': '${moduleNameSnakeCase}_dto',
    'failure_fn': '${moduleNameSnakeCase}_failure',
    'bloc_fn': '${moduleNameSnakeCase}_bloc',
    'state_fn': '${moduleNameSnakeCase}_state',
    'event_fn': '${moduleNameSnakeCase}_event',

    'repository_fn': '${moduleNameSnakeCase}_repository',
    'data_source_fn': '${moduleNameSnakeCase}_data_source',
    'api_service_fn': '${moduleNameSnakeCase}_api_services',
    'repository_imp_fn': '${moduleNameSnakeCase}_repository_implementation',
  };
}
