import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/mini_widgets.dart';
import '../../../widgets/text_widget.dart';
import '../_0_providers/_5_async_notifier.dart';

class AsyncNotifierPage extends ConsumerWidget {
  const AsyncNotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterAsyncNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('AsyncNotifierProvider', TextType.titleSmall),
      ),
      body: Center(
        child: counter.when(
          data: (count) => TextWidget('$count', TextType.headline),
          error: (e, _) => AppMiniWidgets(MWType.error, error: e),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterAsyncNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
