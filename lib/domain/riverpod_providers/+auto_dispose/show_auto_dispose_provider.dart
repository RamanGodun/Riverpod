import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gen_+auto_dispose_and_family /gen_auto_dispose_provider.dart';
// import 'auto_dispose_provider.dart';

class AutoDisposePage extends ConsumerWidget {
  const AutoDisposePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final autoDisposeVariable = ref.watch(autoDisposedProvider);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          style: textTheme.bodySmall,
          autoDisposeVariable,
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              style: textTheme.headlineLarge,
              textAlign: TextAlign.center,
              autoDisposeVariable,
            ),
          ],
        ),
      ),
    );
  }
}
