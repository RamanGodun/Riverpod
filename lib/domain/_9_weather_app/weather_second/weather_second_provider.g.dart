// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_second_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherSecondHash() => r'e1b3624197d24b7f6c1af62172ff3df96c656838';

/// See also [weatherSecond].
@ProviderFor(weatherSecond)
final weatherSecondProvider = AutoDisposeFutureProvider<String>.internal(
  weatherSecond,
  name: r'weatherSecondProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherSecondHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WeatherSecondRef = AutoDisposeFutureProviderRef<String>;
String _$cityHash() => r'52eb79862338a7e39c29ce67deb860df0092250c';

/// See also [City].
@ProviderFor(City)
final cityProvider = AutoDisposeNotifierProvider<City, Cities>.internal(
  City.new,
  name: r'cityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$City = AutoDisposeNotifier<Cities>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
