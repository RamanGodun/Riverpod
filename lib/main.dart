import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'domain_and_presentation/_provider_observer/_observer_logger.dart';
import 'my_home_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'domain_and_presentation/_11_optimization/_sync_provider_4_async_API/shared_pref_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance(); //needs for section of optimization ASYNC APIs

  runApp(
    ProviderScope(
      observers: [Logger()],
      // next needs for section of optimization ASYNC APIs
      // overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod studding',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 48, 77, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
