import 'package:freezed_annotation/freezed_annotation.dart';

part '{{dto_fn}}.freezed.dart';
part '{{dto_fn}}.g.dart';

@freezed
class {{Dto}} with _${{Dto}}{
  factory {{Dto}}({
    @JsonKey(name: 'id') required String id,
  }) = _{{Dto}};

  factory {{Dto}}.fromJson(Map<String, dynamic> json) =>
      _${{Dto}}FromJson(json);
  const {{Dto}}._();

  {{Model}} toDomain() => {{Model}}(id: id);
}