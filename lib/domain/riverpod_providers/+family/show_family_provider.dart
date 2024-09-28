import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../gen_+auto_dispose_and_family /gen_family_provider.dart';
// import 'family_provider.dart';

class FamilyPage extends ConsumerWidget {
  const FamilyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final helloRoman = ref.watch(familyProvider(customName: 'Roman'));
    final helloGodun = ref.watch(familyProvider(customName: 'Godun'));
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(helloRoman, style: textTheme.titleSmall),
      ),
      body: Center(
        child:
            // Consumer(
            // builder: (context, ref, child) {
            // final helloGodun = ref.watch(helloProvider('Godun'));
            // return
            Text(helloGodun, style: textTheme.displayMedium
                // );
                // },
                ),
      ),
    );
  }
}
