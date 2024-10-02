import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/text_widgets.dart';

// import '../providers/counter_provider.dart'; //without code generation use this
import '../providers/counter_provider_gen.dart';

class CounterPageOnNotifier extends ConsumerWidget {
  const CounterPageOnNotifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final counter = ref.watch(counterProviderOnNotifier(10)); //without code generation use this
    final counter = ref.watch(counterOnNotifierProvider(10));

    return Scaffold(
      appBar: AppBar(
        title: TextWidgets.titleSmallText(context, 'Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidgets.headlineText(context, '$counter'),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed:
                    () => // ref.read(counterOnNotifierProvider(10).notifier).increment()  //without code generation use this
                        ref
                            .read(counterOnNotifierProvider(10).notifier)
                            .increment(),
                child: TextWidgets.titleMediumText(context, 'Increment')),
          ],
        ),
      ),
    );
  }
}
