import 'package:flutter/material.dart';
import '../../../data/helpers.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/route_names.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Second', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextWidget('Second Page', TextType.headline),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () => Helpers.goTo(
                context,
                RouteNames.secondDetails,
                pathParameters: {'id': '735'},
                queryParameters: {'tab': 'info'},
              ),
              child: TextWidget(
                'View Second Details',
                TextType.button,
                color: Helpers.getColorScheme(context).onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Helpers.goTo(context, '/nowhere'),
              //  GoRouter.of(context).go('/nowhere'),
              child: const TextWidget('No Where', TextType.button),
            )
          ],
        ),
      ),
    );
  }
}
