import 'package:flutter/material.dart';
import 'package:riverpod_project/data/helpers.dart';

import '../../../widgets/text_widget.dart';
import '../config/router/route_names.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('First', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextWidget('First Page', TextType.headline),
            const SizedBox(height: 10),
            FilledButton(
              onPressed: () => Helpers.goTo(context, RouteNames.firstDetails),
              // GoRouter.of(context).goNamed(RouteNames.firstDetails)
              child: TextWidget('View First Details', TextType.button,
                  color: Helpers.getColorScheme(context).onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
