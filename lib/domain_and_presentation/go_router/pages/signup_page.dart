import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/helpers.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/auth_state_provider.dart';
import '../config/router/route_names.dart';

class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Sign UP', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => _handleSignUp(ref),
              child: TextWidget('Sign UP', TextType.button,
                  color: Helpers.getColorScheme(context).onPrimary),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () => Helpers.goTo(context, RouteNames.signIn),
              child: const TextWidget(
                  'Already a member? Sign IN!', TextType.button),
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () => Helpers.goTo(context, RouteNames.second),
              child: const TextWidget('Second', TextType.button),
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () => Helpers.goTo(context, '/nowhere'),
              child: const TextWidget('No Where', TextType.button),
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle the sign-up logic
  Future<void> _handleSignUp(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(true);
  }
}
