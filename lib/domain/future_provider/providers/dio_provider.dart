import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

// rivp => and choose autocompletion
part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(
    BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'),
  );
}
