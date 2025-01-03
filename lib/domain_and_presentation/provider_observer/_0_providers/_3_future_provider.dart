import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_3_future_provider.g.dart';

@riverpod
FutureOr<int> counterFuture(Ref ref) async {
  await Future.delayed(const Duration(seconds: 1));
  return 0;
}
