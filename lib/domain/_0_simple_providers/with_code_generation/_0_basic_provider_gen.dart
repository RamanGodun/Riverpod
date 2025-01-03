// ignore_for_file: functional_ref
import 'package:riverpod_annotation/riverpod_annotation.dart';

//rivp and choose autocompletion
// dart run build_runner build watch
part '_0_basic_provider_gen.g.dart';

// riverpodKeepAlive and choose autocompletion
@Riverpod(keepAlive: true)
String hello(HelloRef ref) {
  ref.onDispose(() {
    print('[helloProvider] was disposed');
  });

  return 'Hello providers';
}

@Riverpod(keepAlive: true)
String words(WordsRef ref) {
  ref.onDispose(() {
    print('[wordsProviders] was disposed');
  });

  return 'Words provider';
}

/*
 This provider  does not dispose automatically.
 The `onDispose` callback is never triggered because
 the provider stays in memory throughout the entire app run.

 Use this type of provider when you need to retain the state
 or data for the entire duration of the app lifecycle.

 This is suitable for global states or configurations that
 should persist as long as the app is running.

 If you want to manually dispose or refresh this provider,
 you can call `invalidate` or `refresh` through the `ref` object.
 */
