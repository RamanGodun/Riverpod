import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';

import '../../data/helpers.dart';
// import 'ticker_provider.dart'; // Use this if you are not using code generation
import '../../widgets/text_widget.dart';
import 'ticker_provider_gen.dart'; // Use this in case of code generation

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);
    print(tickerValue);

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Ticker', TextType.titleMedium),
      ),
      body: Center(
        child: tickerValue.when(
          // Handling the state of the Stream with `when` method from AsyncValue
          data: (ticks) =>
              TextWidget(Helpers.formatTimer(ticks), TextType.headline),
          // Display error widget if the Stream encounters an error
          error: (e, st) => AppMiniWidgets.errorWidget(context, e),
          // Display loading widget while the Stream is still loading (initial state)
          loading: () => AppMiniWidgets.loadingWidget(),
        ),
      ),
    );
  }
}
