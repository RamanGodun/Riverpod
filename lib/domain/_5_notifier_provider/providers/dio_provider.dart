// ignore_for_file: functional_ref
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

part 'dio_provider.g.dart';

@riverpod
Dio dio(DioRef ref) {
  return Dio(
    BaseOptions(
      baseUrl: 'https://bored-api.appbrewery.com/filter',
    ),
  );
}
