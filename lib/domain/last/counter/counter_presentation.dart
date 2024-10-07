import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/text_widget.dart';
import '_counter_provider_gen.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider(10));

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Counter', TextType.titleMedium),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('$counter', TextType.headline),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                ref.read(counterProvider(10).notifier).increment();
              },
              child: const TextWidget('Increment', TextType.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
