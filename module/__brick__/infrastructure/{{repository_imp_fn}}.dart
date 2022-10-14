import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:{{packageName}}/core/network/api_error_handling.dart';
import 'package:{{packageName}}/core/network/network_info.dart';

import './{{data_source_fn}}.dart';
import '../domain/{{failure_fn}}.dart';


@Injectable(as: {{Repository}})
class {{RepositoryImp}} implements {{Repository}}{
    final INetworkInfo _networkInfo;
    final {{DataSource}} _dataSource;

    {{RepositoryImp}}(this._networkInfo, this._dataSource);


     @override
  Future<Either<{{Failure}}, {{Model}}>> get getData async {
    if (await _networkInfo.isConnected == false) {
         return left(const GeneralFailure.noNetwork());
      }
      try {
        final {{Dto}} dto =
            await _dataSource.getData;
        final {{Model}} result = dto.toDomain();

        return right(result);
      } catch (e) {
        return left(const GeneralFailure.unexpected());
      }
    }
  }



