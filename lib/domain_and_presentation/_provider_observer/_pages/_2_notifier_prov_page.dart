import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widget.dart';
import '../_0_providers/_2_notifier_provider.dart';

class NotifierPage extends ConsumerWidget {
  const NotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('NotifierProvider', TextType.titleSmall),
      ),
      body: Center(
        child: TextWidget('$counter', TextType.titleMedium),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
