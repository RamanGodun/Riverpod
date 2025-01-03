import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/mini_widgets.dart';
import '../../../widgets/text_widget.dart';
import '../_0_providers/_4_stream_provider.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider'),
      ),
      body: Center(
        child: counter.when(
          data: (count) => TextWidget('$count', TextType.headline),
          error: (e, _) => AppMiniWidgets(MWType.error, error: e),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}
