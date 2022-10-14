import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class {{ApiService}}{
  Future<Response> getData();
}

@Injectable(as: {{ApiService}})
class {{ApiServiceImp}} implements {{ApiService}}{
  final Dio api;

  {{ApiServiceImp}}(this.api);

  @override
  Future<Response> getData() {
    return api.get(
      '/rest/V1/',
      queryParameters: {},
    );
  }
}
