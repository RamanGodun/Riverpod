import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

import 'ticker_provider_gen.dart';

class TickerPage extends ConsumerWidget {
  const TickerPage({super.key});

  String zeroPaddedTwoDigits(double ticks) {
    return ticks.floor().toString().padLeft(2, '0');
  }

  String formatTimer(int ticks) {
    final minutes = zeroPaddedTwoDigits((ticks / 60) % 60);
    final seconds = zeroPaddedTwoDigits(ticks % 60);

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tickerValue = ref.watch(tickerProvider);
    print(tickerValue);

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.titleSmallText(context, 'Ticker'),
      ),
      body: Center(
        child: tickerValue.when(
          data: (ticks) => TextWidgets.headlineText(
            context,
            formatTimer(ticks),
          ),
          error: (e, st) => AppMiniWidgets.errorWidget(context, e),
          loading: () => AppMiniWidgets.loadingWidget(),
        ),
      ),
    );
  }
}
