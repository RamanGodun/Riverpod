import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/domain_and_presentation/extensions/async_value_xx.dart';
import 'package:riverpod_project/widgets/error_dialog.dart';
import 'package:riverpod_project/widgets/text_widget.dart';

import '../../../data/enums.dart';
import '../../../widgets/mini_widgets.dart';
import 'weather_second_provider.dart';

int _selectedCityIndex = 1;

class WeatherSecondPage extends ConsumerWidget {
  const WeatherSecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<String>>(
      weatherSecondProvider,
      (previous, next) {
        if (next.hasError && !next.isLoading) {
          showDialog(
              context: context,
              builder: (context) =>
                  ErrorDialog(errorMessage: next.error.toString()));
        }
      },
    );

    final weather = ref.watch(weatherSecondProvider);

    print(weather.toString);
    print(weather.props);

    try {
      print('value: ${weather.value}');
    } catch (e) {
      print(e.toString());
    }

    print('valueOrNull: ${weather.valueOrNull}');

    try {
      print('requireValue: ${weather.requireValue}');
    } on StateError {
      print('StateError');
    } catch (e) {
      print(e.toString());
    }

    print('===========');

    return Scaffold(
      appBar: AppBar(
        title: const Text('AsyncValue Details - Second'),
        actions: [
          IconButton(
            onPressed: () {
              _selectedCityIndex = 1;
              ref.invalidate(cityProvider);
              ref.invalidate(weatherSecondProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: weather.when(
          skipError: true,
          skipLoadingOnRefresh: false,
          // skipLoadingOnReload: true,
          data: (temp) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(temp, TextType.headline),
                const SizedBox(height: 20),
                const GetWeatherButton(),
              ],
            );
          },
          error: (e, st) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppMiniWidgets(MWType.error, error: e.toString()),
              const SizedBox(height: 20),
              const GetWeatherButton(),
            ],
          ),
          loading: () => const AppMiniWidgets(MWType.loading),
        ),
      ),
    );
  }
}

class GetWeatherButton extends ConsumerWidget {
  const GetWeatherButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      onPressed: () {
        final cityIndex = _selectedCityIndex % 4;
        final city = Cities.values[cityIndex];

        _selectedCityIndex++;
        ref.read(cityProvider.notifier).changeCity(city);
      },
      child: const TextWidget('Get Weather', TextType.titleSmall),
    );
  }
}
