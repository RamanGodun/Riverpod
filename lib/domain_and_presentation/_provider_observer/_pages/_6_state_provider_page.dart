import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widget.dart';
import '../_0_providers/_6_state_provider.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('StateProvider', TextType.titleSmall),
      ),
      body: Center(
        child: TextWidget('$counter', TextType.headline),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
