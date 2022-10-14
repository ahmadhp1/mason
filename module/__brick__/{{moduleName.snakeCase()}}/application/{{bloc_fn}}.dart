import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../domain/{{repository_fn}}.dart';
import '../domain/models/{{model_export_fn}}.dart';
import '../domain/{{failure_fn}}.dart';

part '{{bloc_fn}}.freezed.dart';
part '{{event_fn}}.dart';
part '{{state_fn}}.dart';

@injectable
class {{Bloc}} extends Bloc<{{Event}},{{State}}> {
  final {{Repository}} repository;
  {{Bloc}}(this.repository, {{State}} init) : super(init) {
    on<{{Event}}>((event, emit) async {
    });
  }
}
