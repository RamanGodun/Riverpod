import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'example2_provider.dart';

class Example2Page extends ConsumerWidget {
  const Example2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usage Example 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProviderScope(
              overrides: [ex2CounterProvider],
              child: const CounterDisplay(),
            ),
            const Divider(height: 40),
            ProviderScope(
              overrides: [
                ex2CounterProvider.overrideWith(() => Ex2Counter10())
              ],
              child: const CounterDisplay(),
            ),
            const Divider(height: 40),
            ProviderScope(
              overrides: [
                ex2CounterProvider.overrideWith(() => Ex2Counter100()),
                ex2AdjustedCounterProvider.overrideWith(
                  (ref) => ref.watch(ex2CounterProvider) * 3,
                ),
              ],
              child: const CounterDisplay(),
            ),
            const Divider(height: 40),
            const CounterDisplay(),
          ],
        ),
      ),
    );
  }
}

class CounterDisplay extends ConsumerWidget {
  const CounterDisplay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(ex2CounterProvider);
    final adjCounter = ref.watch(ex2AdjustedCounterProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$counter'),
            const SizedBox(width: 30),
            Text('$adjCounter'),
          ],
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {
            ref.read(ex2CounterProvider.notifier).increment();
          },
          child: const Text('Increment Counter'),
        ),
      ],
    );
  }
}
