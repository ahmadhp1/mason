import 'package:dartz/dartz.dart';

import '../domain/{{failure_fn}}.dart';
import '../domain/models/{{model_export_fn}}.dart';


abstract class {{Repository}}{
  Future<Either<{{Failure}}, {{Model}}>> get getData;
}
