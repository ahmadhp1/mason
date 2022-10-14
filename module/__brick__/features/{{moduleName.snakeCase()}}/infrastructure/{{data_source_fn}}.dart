import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:{{packageName}}/core/network/api_error_handler.dart';
import '{{{pathToModule}}}/infrastructure/dtos/{{dto_fn}}.dart';
import '{{{pathToModule}}}/infrastructure/{{api_service_fn}}.dart';


abstract class {{DataSource}}{
  Future<{{Dto}}> get getData;
}

@Injectable(as: {{DataSource}})
class {{DataSourceImp}} implements {{DataSource}}{
  final {{ApiService}} _apiService;

  {{DataSourceImp}}(this._apiService);

  @override
  Future<{{Dto}}> get getData async {
    return handleError<{{Dto}}>(() async {
      final Response response = await _apiService.getData();
      return {{Dto}}.fromJson(response.data as Map<String, dynamic>);
    });
  }
}
