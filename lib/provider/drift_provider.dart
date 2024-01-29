// Package imports:
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Project imports:
import 'package:intern_practice/drift/todos.dart';

part 'drift_provider.g.dart';

@riverpod
class Drift extends _$Drift {
  @override
  MyDatabase build() {
    return MyDatabase();
  }
}
