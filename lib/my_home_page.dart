// used before...
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
// import 'domain/_10_life_cycle/async_keep_alive_with_dio/products_page.dart';
// import 'optimization/_widget_rebuild_optimization/pages/items_page.dart';
// import 'widgets/custom_button.dart';
// import 'optimization/sync_provider_4_async_API/other_page.dart';
// import 'package:riverpod_project/optimization/sync_provider_4_async_API/counter_provider.dart';
// import '../optimization/sync_provider_4_async_API/counter_provider.dart';
// import 'optimization/provider_scope_and_overlay/downloaded/pages/counter_provider.dart';
// import '../optimization/_widget_rebuild_optimization/pages/items_page.dart';
// import '../optimization/sync_provider_4_async_API/other_page.dart';
// import '../optimization/sync_provider_4_async_API/counter_provider.dart'   as sync_counter;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/domain_and_presentation/_11_optimization/_provider_scope_and_overlay/pages/counter_provider.dart';
import '../widgets/custom_button.dart';
import 'package:riverpod_project/domain_and_presentation/_11_optimization/_provider_scope_and_overlay/pages/home_paged_4_overlay_optimization.dart';
import 'domain_and_presentation/_11_optimization/_provider_scope_and_overlay/pages/counter_provider.dart'
    as overlay_counter;
import 'domain_and_presentation/_11_optimization/subtree optimization/pages/example1_page.dart';
import 'domain_and_presentation/_11_optimization/subtree optimization/pages/example2_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod app'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          children: [
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
            // CustomButton(
            //   title: 'Products',
            //   child: ProductsPage(),
            // ),
            // Center(
            //   child: Consumer(
            //     builder: (context, ref, child) {
            //       final counter = ref.watch(sync_counter.counterProvider);
            //       // final preferences = ref.watch(sharedPreferencesProvider);
            //       // final val = preferences.getInt('counter');
            //       return Text(
            //         '$counter',
            //         style: const TextStyle(fontSize: 52),
            //       );
            //     },
            //   ),
            // ),
            // const CustomButton(
            //   title: 'go to SyncProvider4AsyncAPI page',
            //   child: SyncProvider4AsyncAPI(),
            // ),
            // const SizedBox(height: 50),

            // const CustomButton(
            //   title: 'OPTIMIZATION',
            //   child: ItemsPage(),
            // ),
            // const SizedBox(height: 50),
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

            const SizedBox(height: 50),
            CustomButton(
              title: 'go to Overlay optimization with 100',
              child: ProviderScope(
                overrides: [
                  overlay_counter.counterProvider.overrideWith(
                    () => Counter100(),
                  )
                ],
                child: const HomePage4OverlayOptimization(),
              ),
            ),
            const SizedBox(height: 50),
            const CustomButton(
              title: 'go to Example1',
              child: Example1Page(),
            ),
            const SizedBox(height: 50),
            const CustomButton(
              title: 'go to Example2',
              child: Example2Page(),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
// next used only  for optimization, when  initialization of Synch Provider for Async APIs
      // floatingActionButton: Consumer(
      //   builder: (context, ref, child) {
      //     return FloatingActionButton(
      //       onPressed: () {
      //         ref.read(sync_counter.counterProvider.notifier).increment();
      //       },
      //       child: const Icon(Icons.add),
      //     );
      //   },
      // ),
    );
  }
}
