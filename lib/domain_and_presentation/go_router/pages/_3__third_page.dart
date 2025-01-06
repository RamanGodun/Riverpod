import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/helpers.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/auth_state_provider.dart';
import '../config/router/route_names.dart';

class ThirdPage extends ConsumerWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Third', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextWidget('Third Page', TextType.headline),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () => _handleViewThirdDetails(context),
              child: TextWidget(
                'View Third Details',
                TextType.button,
                color: Helpers.getColorScheme(context).onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Helpers.goTo(context, RouteNames.signIn),
              child: const TextWidget('Sign In', TextType.button),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => _handleSignOut(ref),
              child: const TextWidget('Sign Out', TextType.button),
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle navigation to third details page
  void _handleViewThirdDetails(BuildContext context) {
    Helpers.goTo(
      context,
      RouteNames.thirdDetails,
      pathParameters: {'id': '333'},
      queryParameters: {
        // 'firstName': 'Roman',
        'lastName': 'Godun',
      },
    );
  }

  // Method to handle sign out
  Future<void> _handleSignOut(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(false);
  }
}
