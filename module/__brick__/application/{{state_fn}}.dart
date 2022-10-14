part of '{{bloc_fn}}.dart';

@injectable
@freezed
class {{State}} with _${{State}}{
  const factory {{State}}({
    required Option<Either<{{Failure}}, {{Model}}>> data,
  }) = _{{State}};
  @factoryMethod
  factory {{State}}.init() => {{State}}(data: none());
}
