import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widget.dart';
import '../_0_providers/_8_change_notifier.dart';

class ChangeNotifierPage extends ConsumerWidget {
  const ChangeNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterChangeNotifierProvider).counter;

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('ChangeNotifierProvider', TextType.titleSmall),
      ),
      body: Center(
        child: TextWidget('$counter', TextType.headline),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterChangeNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
