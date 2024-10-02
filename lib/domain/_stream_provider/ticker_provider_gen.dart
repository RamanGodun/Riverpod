import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ticker_provider_gen.g.dart';

@riverpod
Stream<int> ticker(TickerRef ref) {
  ref.onDispose(() {
    print('[tickerProvider] disposed');
  });
  return Stream.periodic(const Duration(seconds: 1), (t) => t + 1).take(60);
}
