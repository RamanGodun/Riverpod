import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widget.dart';
import '../_0_providers/_1_simple_provider.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Provider', TextType.titleSmall),
      ),
      body: Center(
        child: TextWidget('$counter', TextType.headline),
      ),
    );
  }
}
