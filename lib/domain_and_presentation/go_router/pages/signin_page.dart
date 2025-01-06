import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/helpers.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/auth_state_provider.dart';
import '../config/router/route_names.dart';

class SigninPage extends ConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const TextWidget('Sign IN', TextType.titleSmall)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () => _handleSignIn(ref),
              child: TextWidget(
                'Sign IN',
                TextType.button,
                color: Helpers.getColorScheme(context).onPrimary,
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () => Helpers.goTo(context, RouteNames.signup),
              child:
                  const TextWidget('Not a member? Sign UP!', TextType.button),
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(
              onPressed: () => Helpers.goTo(context, RouteNames.first),
              child: const TextWidget('First', TextType.button),
            ),
          ],
        ),
      ),
    );
  }

  // Method to handle the sign-in logic
  Future<void> _handleSignIn(WidgetRef ref) async {
    await ref.read(authStateProvider.notifier).setAuthenticate(true);
  }
}
