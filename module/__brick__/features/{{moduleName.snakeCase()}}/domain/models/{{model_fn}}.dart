import 'package:freezed_annotation/freezed_annotation.dart';

part '{{model_fn}}.freezed.dart';

@freezed
class {{Model}} with _${{Model}}{
  const factory {{Model}}({
    required String id,
  }) = _{{Model}};
}
