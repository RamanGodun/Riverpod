import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widget.dart';

import '../../../data/helpers.dart';
import 'timer_provider.dart';

class TimerValue extends ConsumerWidget {
  const TimerValue({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerProvider);
    print(timerState);

    return timerState.maybeWhen(
      data: (value) => TextWidget(
        Helpers.formatTimer(value.duration),
        TextType.headline,
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }
}
