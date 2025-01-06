import 'package:flutter/material.dart';
import '../../../data/helpers.dart';
import '../../../widgets/text_widget.dart';
import '../config/router/route_names.dart';

class PageNotFound extends StatelessWidget {
  final String errMsg;
  const PageNotFound({
    super.key,
    required this.errMsg,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget('Error Route', TextType.titleSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(errMsg, TextType.error),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: () => Helpers.goTo(context, RouteNames.first),
                child: const TextWidget('Go to First', TextType.button),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
