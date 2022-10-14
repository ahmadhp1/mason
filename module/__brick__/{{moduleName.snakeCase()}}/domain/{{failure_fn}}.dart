import 'package:freezed_annotation/freezed_annotation.dart';

part '{{failure_fn}}.freezed.dart';

@freezed
class {{Failure}} with _${{Failure}}{
  const factory {{Failure}}.noNetwork() = _NoNetwork;
  const factory {{Failure}}.unexpected() = _Unexpected;
}
