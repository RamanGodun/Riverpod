import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/firebase_options.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'data/providers/shared_pref_provider.dart';
// import 'domain_and_presentation/_go_router/config/router/router_provider.dart';
import './domain_and_presentation/firebase_auth/config/router/router_provider.dart';
// import 'domain_and_presentation/_provider_observer/_observer_logger.dart';
// import 'my_home_page.dart';
// import 'domain_and_presentation/_11_optimization/_sync_provider_4_async_API/shared_pref_provider.dart';
// import 'domain_and_presentation/_provider_observer/_observer_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy(); //or use setPathUrlStrategy() for advanced strategy
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics
      .logEvent(name: 'test_event', parameters: {'test_param': 'test_value'});
  // final prefs = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      // observers: [Logger()],
      // next needs for section of optimization ASYNC APIs
      // overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
/*
next used WITHOUT GO-ROUTER 

    return MaterialApp(
      title: 'Riverpod studding',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const MyHomePage(),
    );
*/
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'GoRouter with Riverpod',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routerConfig: router,
    );
  }
}

final ThemeData appTheme = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 147, 169, 111)),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 24),
    labelLarge: TextStyle(fontSize: 24),
  ),
  useMaterial3: true,
);
