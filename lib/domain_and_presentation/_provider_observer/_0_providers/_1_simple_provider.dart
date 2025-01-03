import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_1_simple_provider.g.dart';

@Riverpod(keepAlive: true)
// @riverpod //for not temporal provider
int counter(Ref ref) {
  return 0;
}
