import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'domain/_3_stream_provider/ticker_presentation.dart';
// import 'domain/_4_state_or_change_notifier_provider/todos_presentation.dart';
// import 'domain/_5_notifier_provider/presentation/counter_presentation.dart';
// import 'domain/_5_notifier_provider/presentation/enum_activity_presentation.dart';
// import 'domain/_5_notifier_provider/presentation/sealed_activity_presentation.dart';

import 'domain/_6_async_provider/counter/counter_page.dart';
import 'domain/_6_async_provider/enum_based_async_state/enum_async_activity_presentation.dart';
import 'domain/_6_async_provider/sealed_async_activity/sealed_async_activity_presentation.dart';
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
      title: 'AsyncNotifierProvider',
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
        title: const Text('AsyncNotifierProvider'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            CustomButton(
              title: 'Counter',
              child: CounterPage(),
            ),
            SizedBox(height: 50),
            CustomButton(
              title: 'Async enum based state',
              child: EnumAsyncActivityPage(),
            ),
            SizedBox(height: 50),
            CustomButton(
              title: 'Async sealed-based state',
              child: SealedAsyncActivityPage(),
            ),
            //
            // CustomButton(
            //   title: 'Counter',
            //   child: CounterPageOnNotifier(),
            // ),
            // CustomButton(
            //   title: 'Enum Activity',
            //   child: EnumActivityPage(),
            // ),
            // CustomButton(
            //   title: 'Sealed Activity',
            //   child: SealedActivityPage(),
            // ),
            // CustomButton(
            //   title: 'Ticker',
            //   child: TickerPage(),
            // ),
            // CustomButton(
            //   title: 'Todo',
            //   child: TodosPage(),
            // )
          ],
        ),
      ),
    );
  }
}
