import 'package:dartz/dartz.dart';

import '{{{pathToModule}}}/domain/{{failure_fn}}.dart';
import '{{{pathToModule}}}/domain/models/{{model_export_fn}}.dart';


abstract class {{Repository}}{
  Future<Either<{{Failure}}, {{Model}}>> get getData;
}
