import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widget.dart';
import '../_0_providers/_7_state_notifier.dart';

class StateNotifierPage extends ConsumerWidget {
  const StateNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('StateNotifierProvider', TextType.titleMedium),
      ),
      body: Center(
        child: TextWidget('$counter', TextType.headline),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
