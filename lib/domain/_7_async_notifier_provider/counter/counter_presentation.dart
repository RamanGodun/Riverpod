import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/widgets/mini_widgets.dart';
import '../../../widgets/text_widget.dart';
import '_counter_provider.dart';
// import '_counter_provider_gen.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    print(counter);
    print(
        'isLoading: ${counter.isLoading}          isRefreshing: ${counter.isRefreshing}            isReloading: ${counter.isReloading}');
    print(
        'hasValue: ${counter.hasValue}         hasError: ${counter.hasError}');

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Counter', TextType.titleMedium),
      ),
      body: Center(
          child: counter.when(
        skipLoadingOnRefresh: false,
        data: (count) {
          print('AsyncData count is: $count');
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget('Current count is: ', TextType.headline),
              const SizedBox(height: 50),
              TextWidget('$count', TextType.headline),
              const SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    heroTag: 'decrement',
                    onPressed: () =>
                        ref.read(counterProvider.notifier).decrement(),
                    child: const Icon(Icons.remove, size: 40),
                  ),
                  const SizedBox(width: 75),
                  FloatingActionButton(
                    heroTag: 'increment',
                    onPressed: () =>
                        ref.read(counterProvider.notifier).increment(),
                    child: const Icon(Icons.add, size: 40),
                  ),
                ],
              )
            ],
          );
        },
        error: (error, stackTrace) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(error.toString(), TextType.error),
            const SizedBox(height: 50),
            OutlinedButton(
              onPressed: () => ref.invalidate(counterProvider),
              child: const TextWidget('Refresh', TextType.titleMedium),
            )
          ],
        ),
        loading: () {
          // print('AsyncData count is: $counterProvider.');
          return const AppMiniWidgets(MWType.loading);
        },
      )),
    );
  }
}
