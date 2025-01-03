import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_4_stream_provider.g.dart';

@riverpod
Stream<int> counterStream(Ref ref) {
  return Stream<int>.periodic(const Duration(seconds: 1), (i) => i).take(5);
}
