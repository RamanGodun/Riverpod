import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'domain/_3_stream_provider/ticker_presentation.dart';
// import 'domain/_4_state_or_change_notifier_provider/todos_presentation.dart';
// import 'domain/_5_notifier_provider/presentation/counter_presentation.dart';
// import 'domain/_5_notifier_provider/presentation/enum_activity_presentation.dart';
// import 'domain/_5_notifier_provider/presentation/sealed_activity_presentation.dart';
// import 'domain/_7_async_notifier_provider/counter/counter_presentation.dart';
// import 'domain/_6_async_provider/enum_based_async_state/enum_async_activity_presentation.dart';
// import 'domain/_6_async_provider/sealed_async_activity/sealed_async_activity_presentation.dart';
// import 'domain/_7_async_notifier_provider/sealed_class_based_async_activity/async_activity_presentation.dart';
// import 'domain/_8_stream_provider/timer/timer_presentation.dart';
// import 'domain/_9_weather_app/weather_first/weather_first_presentation.dart';
// import 'domain/_9_weather_app/weather_second/weather_second_presentation.dart';
// import 'domain/_10_life_cycle/async_keep_alive/products_page.dart';
// import 'domain/_10_life_cycle/auto_dispose/auto_dispose_page.dart';
// import 'domain/_10_life_cycle/keep_alive/keep_alive_page.dart';
// import 'domain/_10_life_cycle/provider_cascade/provider_cascade_page.dart';
// import 'domain/_10_life_cycle/async_keep_alive/sync_keep_alive_page.dart';

import 'domain/_10_life_cycle/async_keep_alive_with_dio/products_page.dart';
import 'optimization/sync_provider_4_async_API/other_page.dart';
import 'optimization/widget_rebuild_optimization/pages/items_page.dart';
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
        title: const Text('Test app'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: const [
            // CustomButton(
            //   title: 'Counter',
            //   child: CounterPage(),
            // ),
            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Async enum based state',
            //   child: EnumAsyncActivityPage(),
            // ),
            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Async sealed-based state',
            //   child: SealedAsyncActivityPage(),
            // ),
            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'AsyncActivityPage',
            //   child: AsyncActivityPage(),
            // ),
            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Stream timer',
            //   child: StreamTimerPresentation(),
            // ),
            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Weather First Page',
            //   child: WeatherFirstPage(),
            // ),

            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Weather Second Page',
            //   child: WeatherSecondPage(),
            // ),
            //
            CustomButton(
              title: 'Products',
              child: ProductsPage(),
            ),
            CustomButton(
              title: 'SyncProvider4AsyncAPI',
              child: SyncProvider4AsyncAPI(),
            ),

            SizedBox(height: 50),
            CustomButton(
              title: 'OPTIMIZATION',
              child: ItemsPage(),
            ),

            SizedBox(height: 50),
            // CustomButton(
            //   title: 'Auto Dispose',
            //   child: AutoDisposePage(),
            // ),

            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Keep Alive',
            //   child: KeepAlivePage(),
            // ),
            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Provider Cascade',
            //   child: ProviderCascadePage(),
            // ),
            // SizedBox(height: 50),
            // CustomButton(
            //   title: 'Async Keep Alive',
            //   child: SyncKeepAlivePage(),
            // ),
            // ProductsPage
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
