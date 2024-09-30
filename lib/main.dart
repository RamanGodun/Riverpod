import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/_1_state_provider/plus_auto_dispose_mod/auto_dispose_provider_presentation.dart';
import 'domain/_1_state_provider/plus_family_auto_dispose_mod/auto_dispose_family_provider_presentation.dart';
import 'domain/_1_state_provider/basic/basic_provider_presentation.dart';
import 'domain/_1_state_provider/plus_family_mod/family_provider_presentation.dart';
import 'widgets/custom_button.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateProvider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 231, 6, 223)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StateProvider'),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: const [
            CustomButton(
              title: 'StateProvider',
              child: BasicPage(),
            ),
            CustomButton(
              title: 'AutoDisposeStateProvider',
              child: AutoDisposePage(),
            ),
            CustomButton(
              title: 'FamilyStateProvider',
              child: FamilyPage(),
            ),
            CustomButton(
              title: 'AutoDisposeFamilyStateProvider',
              child: AutoDisposeFamilyPage(),
            ),
          ],
        ),
      ),
    );
  }
}
