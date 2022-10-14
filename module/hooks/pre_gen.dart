import 'package:dart_casing/dart_casing.dart';
import 'package:mason/mason.dart';

void run(HookContext context) {
  // TODO : get models and parameters in each model from user
  // TODO : get states and events parameters from user

  final moduleName = context.vars['moduleName'];

  //*Class names *****************
  final moduleNamePascalCase = Casing.pascalCase(moduleName);

  context.vars['Model'] = '${moduleNamePascalCase}Model';
  context.vars['Dto'] = '${moduleNamePascalCase}Dto';
  context.vars['Bloc'] = '${moduleNamePascalCase}Bloc';
  context.vars['State'] = '${moduleNamePascalCase}State';
  context.vars['Event'] = '${moduleNamePascalCase}Event';
  context.vars['Failure'] = '${moduleNamePascalCase}Failure';

  context.vars['Repository'] = 'I${moduleNamePascalCase}Repository';
  context.vars['DataSource'] = 'I${moduleNamePascalCase}ApiDataSource';
  context.vars['ApiService'] = 'I${moduleNamePascalCase}ApiService';

  context.vars['RepositoryImp'] =
      '${moduleNamePascalCase}RepositoryImplementation';
  context.vars['DataSourceImp'] =
      '${moduleNamePascalCase}ApiDataSourceImplementation';
  context.vars['ApiServiceImp'] =
      '${moduleNamePascalCase}ApiServiceImplementation';

  //*File names *****************
  final moduleNameSnakeCase = Casing.snakeCase(moduleName);

  context.vars['model_fn'] = '${moduleNameSnakeCase}_model';
  context.vars['model_exports_fn'] = '${moduleNameSnakeCase}_models';
  context.vars['dto_fn'] = '${moduleNameSnakeCase}_dto';
  context.vars['failure_fn'] = '${moduleNameSnakeCase}_failure';
  context.vars['bloc_fn'] = '${moduleNameSnakeCase}_bloc';
  context.vars['state_fn'] = '${moduleNameSnakeCase}_state';
  context.vars['event_fn'] = '${moduleNameSnakeCase}_event';

  context.vars['repository_fn'] = '${moduleNameSnakeCase}_repository';
  context.vars['data_source_fn'] = '${moduleNameSnakeCase}_data_source';
  context.vars['api_service_fn'] = '${moduleNameSnakeCase}_api_services';
  context.vars['repository_imp_fn'] =
      '${moduleNameSnakeCase}_repository_implementation';
}
