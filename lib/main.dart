import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'domain/_3_stream_provider/ticker_presentation.dart';
import 'domain/_4_state_or_change_notifier_provider/todos_presentation.dart';
import 'domain/_5_notifier_provider/presentation/counter_presentation.dart';
import 'domain/_5_notifier_provider/presentation/enum_activity_presentation.dart';
import 'domain/_5_notifier_provider/presentation/sealed_activity_presentation.dart';
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
      title: 'NotifierProvider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
        title: const Text('NotifierProvider'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Counter',
              child: CounterPageOnNotifier(),
            ),
            CustomButton(
              title: 'Enum Activity',
              child: EnumActivityPage(),
            ),
            CustomButton(
              title: 'Sealed Activity',
              child: SealedActivityPage(),
            ),
            CustomButton(
              title: 'Ticker',
              child: TickerPage(),
            ),
            CustomButton(
              title: 'Todo',
              child: TodosPage(),
            )
          ],
        ),
      ),
    );
  }
}
