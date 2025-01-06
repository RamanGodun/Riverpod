import 'package:flutter/material.dart';
import 'package:riverpod_project/data/helpers.dart';

import '../../../widgets/text_widget.dart';

class FirstDetailsPage extends StatefulWidget {
  const FirstDetailsPage({super.key});

  @override
  State<FirstDetailsPage> createState() => _FirstDetailsPageState();
}

class _FirstDetailsPageState extends State<FirstDetailsPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('First Details Page', TextType.titleSmall),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('$counter', TextType.headline),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => setState(() => counter++),
              child: TextWidget(
                'Increment Counter',
                TextType.button,
                color: Helpers.getColorScheme(context).onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
