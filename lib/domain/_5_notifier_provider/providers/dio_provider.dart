import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(
    BaseOptions(
      baseUrl:
          'https://bored-api.appbrewery.com/filter', // правильний URL для фільтрації
    ),
  );
}

// https://bored-api.appbrewery.com/filter?type=education
// 'https://bored-api.appbrewery.com/filter',
// https://bored-api.appbrewery.com/random
