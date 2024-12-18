import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/text_widget.dart';
import 'providers.dart';

class ProviderCascadePage extends ConsumerWidget {
  const ProviderCascadePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myAge = ref.watch(ageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Provider Cascade', TextType.titleSmall),
      ),
      body: Center(
        child: TextWidget(myAge, TextType.titleMedium),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(cascadeCounterProvider.notifier).increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
