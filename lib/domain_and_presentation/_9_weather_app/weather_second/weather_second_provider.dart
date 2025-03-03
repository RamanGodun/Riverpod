import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/enums.dart';

part 'weather_second_provider.g.dart';

@riverpod
class City extends _$City {
  @override
  Cities build() {
    print('[cityProvider] initialized');
    ref.onDispose(() {
      print('[cityProvider] disposed');
    });
    return Cities.seoul;
  }

  void changeCity(Cities city) {
    state = city;
  }
}

@riverpod
FutureOr<String> weatherSecond(Ref ref) async {
  print('[weatherSecondProvider] initialized');
  ref.onDispose(() {
    print('[weatherSecondProvider] disposed');
  });

  final city = ref.watch(cityProvider);

  await Future.delayed(const Duration(seconds: 1));

  switch (city) {
    case Cities.seoul:
      // throw 'Fail to fetch the temperature of ${city.name}';
      return '${city.name} - 23';
    case Cities.london:
      throw 'Fail to fetch the temperature of ${city.name}';
    case Cities.bangkok:
      throw 'Fail to fetch the temperature of ${city.name}';
    case Cities.tokyo:
      return '${city.name} - 28';
  }
  // return null;
}
