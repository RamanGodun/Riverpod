import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/mini_widgets.dart';
import '../../../widgets/text_widget.dart';
import '../_0_providers/_3_future_provider.dart';

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterFutureProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('FutureProvider', TextType.titleSmall),
      ),
      body: Center(
        child: counter.when(
          data: (count) => TextWidget('$count', TextType.titleMedium),
          error: (e, _) => AppMiniWidgets(MWType.error, error: e),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}
