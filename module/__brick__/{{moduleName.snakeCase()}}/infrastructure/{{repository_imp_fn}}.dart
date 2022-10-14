import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:{{packageName}}/core/network/network_info.dart';

import 'dtos/{{dto_fn}}.dart';
import '{{data_source_fn}}.dart';
import '../domain/{{failure_fn}}.dart';
import '../domain/{{repository_fn}}.dart';
import '../domain/models/{{model_export_fn}}.dart';


@Injectable(as: {{Repository}})
class {{RepositoryImp}} implements {{Repository}}{
    final INetworkInfo _networkInfo;
    final {{DataSource}} _dataSource;

    {{RepositoryImp}}(this._networkInfo, this._dataSource);


     @override
  Future<Either<{{Failure}}, {{Model}}>> get getData async {
    if (await _networkInfo.isConnected == false) {
         return left(const {{Failure}}.noNetwork());
      }
      try {
        final {{Dto}} dto =
            await _dataSource.getData;
        final {{Model}} result = dto.toDomain();

        return right(result);
      } catch (e) {
        return left(const {{Failure}}.unexpected());
      }
    }
  }



